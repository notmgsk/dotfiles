# TODO Follow Cole's advice and don't install everything to the
# system, instead using user-specific configs.

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  unstable = import
    (builtins.fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz)
    { config = config.nixpkgs.config; };
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Required if one needs the proprietary nvidia drivers
  nixpkgs.config.allowUnfree = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "auto";
  boot.extraModprobeConfig = ''
    options nvidia "NVreg_RestrictProfilingToAdminUsers=0"
  '';

  networking.hostName = "mgsk-nixos"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # TODO update to 20.09
  #programs.steam.enable = true;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp2s0.useDHCP = true;
  networking.interfaces.wlo1.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    pciutils cudatoolkit
    
    vim docker unstable.emacs

    firefox slack spotify gimp
    freecad

    zsh oh-my-zsh zsh-autosuggestions zsh-fast-syntax-highlighting
    wget git
    feh # Image viewer
    kitty alacritty # Terminal emulator
    evince # pdf reader
    jq bc killall xorg.xbacklight
    ripgrep ispell
    htop unstable.bpytop tmux
    httpie nmap nmap-graphical
    unstable.openconnect
    #unstable.openconnect_pa
    postgresql
    nix-index

    # direnv allows us to manage environments upon entering a
    # directory, e.g. automatically enable a python
    # environment. nix-direnv wraps direnv to make it faster on
    # nixos. Make sure to have the line
    #
    #    source /run/current-system/sw/share/nix-direnv/direnvrc
    #
    # in ~/.direnvrc
    direnv nix-direnv

    pavucontrol pasystray # audio stuff

    (pkgs.callPackage ./sbcl.nix {})
    lispPackages.quicklisp
    unstable.go
    python python3
    sqlite
    gcc
    gnumake
    antlr4
    zeromq4
    czmq
    stdenv.cc.cc.lib

    # Desktop
    redshift bspwm sxhkd rofi polybar compton
    gnome3.adwaita-icon-theme

    # Custom derivations/packages
    (import ./rofi-bluetooth.nix)
  ];

  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';
  environment.pathsToLink = [
    "/share/nix-direnv"
  ];

  fonts = {
    fontconfig = {
      defaultFonts = {
        monospace = [ "Iosevka" ];
      };
    };
    fonts = with pkgs; [
      iosevka
      fira-code
      fira-code-symbols
    ];
  };

  environment.variables.XCURSOR_SIZE = "64";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  #   pinentryFlavor = "gnome3";
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 24800 ];
  networking.firewall.allowedUDPPorts = [ 24800 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  # networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    dpi = 144;
    layout = "us";
    # xkbOptions = "ctrl:swapcaps";
    autoRepeatDelay = 200;
    autoRepeatInterval = 40;
  };

  # TODO
  #hardware.fancontrol.enable = true;
  #hardware.fancontrol.config = "";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  services.xserver.displayManager.lightdm = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "mgsk";
  };
  #services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.windowManager.bspwm.enable = true;

  services.xserver.displayManager.defaultSession = "none+bspwm";
  services.xserver.displayManager.sessionCommands = ''
    ${pkgs.xorg.xset}/bin/xset r rate 200 40
  '';

  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libGL
    ];
    setLdLibraryPath = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.screenSection = ''
    Option "metamodes" "nvidia-auto-select +0+0 { ForceCompositionPipeline = On }"
  '';
  systemd.services.nvidia-control-devices = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig.ExecStart = "${pkgs.linuxPackages_latest.nvidia_x11.bin}/bin/nvidia-smi";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.mgsk = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
  };

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  virtualisation.docker.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    ohMyZsh.theme = "robbyrussell";
  };

  programs.zsh.promptInit = ""; # Clear this to avoid a conflict with oh-my-zsh

  users.defaultUserShell = pkgs.zsh;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}
