;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(setq custom-file "~/.spacemacs_custom")
(load custom-file)

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     html
     python
     syntax-checking
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     github
     markdown
     bibtex
     (latex :variables latex-build-command "latexmk")
     org
     ;; (mu4e :variables
     ;;       mu4e-installation-path "/usr/share/emacs/site-lisp/mu4e")
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     ;; syntax-checking
     ;; version-control
     common-lisp
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     dired-narrow
     dired-k
     ;; extempore-mode
     ;; helm-books
     ;; org-cliplink
     visual-fill-column
     beginend
     web
     ;; el-pocket
     ;; python-mode
     dired-details
     ;; centered-window-mode
     rainbow-mode
     dracula-theme
     workgroups
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(org-projectile org-bullets)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(dracula
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Roboto Mono:pixelsize=18:foundry=pyrs:weight=normal:slant=normal:width=normal:scalable=true")
   ;; dotspacemacs-default-font '("Iosevka:pixelsize=22:foundry=CYEL:weight=light:slant=normal:width=normal:spacing=90:scalable=true")
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 100
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq-default spacemacs-show-trailing-whitespace nil)

  (defun me/resize-window-to-fill-column ()
    "Resize the current window to have width `fill-column'.
If current window has width lesser/greater than `fill-column',
this function reduces/increases the window width to show filled
content. Only takes effect is the window can be resized; i.e., it
is not the only window visible."
    (interactive)
    (let* ((current (window-width (selected-window)))
           (desired fill-column)
           (delta (- desired current)))
      (window-resize (selected-window) delta t)))
  (spacemacs/set-leader-keys "wf" 'me/resize-window-to-fill-column)

  (with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "/") 'dired-narrow)
    (define-key dired-mode-map (kbd "e") 'wdired-change-to-wdired-mode)
    (setq dired-listing-switches "-alh")
    (setq dired-k-human-readable +1)
    (setq dired-k-style nil)
    (define-key dired-mode-map (kbd "K") 'dired-k))

  (setq me/texcount-command "texcount -sum -brief -merge %s")
  (setq me/texcount-root-tex nil)
  (defun me/texcount-this-file ()
    (interactive)
    (let* ((bname (if me/texcount-root-tex
                      me/texcount-root-tex
                    (buffer-name))))
      (print (s-trim (shell-command-to-string (format me/texcount-command
                                                      bname))))))
  (defun me/add-texcount-to-modeline
      (interactive))

  (spacemacs/set-leader-keys-for-major-mode 'latex-mode "ib" 'latex-insert-block)
  (spacemacs/set-leader-keys-for-major-mode 'latex-mode "d" 'me/texcount-this-file)

  (with-eval-after-load 'org
    (cond
     ((string-equal system-type "darwin")
      (setq org-latex-create-formula-image-program 'dvisvgm))
     (t
      (setq org-latex-create-formula-image-program 'dvipng)))

    (setq org-directory "~/hackery/org")
    (setq org-default-notes-file (concat org-directory "/notes.org"))
    (setq org-capture-templates
          '(("t" "Brief todo" entry (file+headline org-default-notes-file "Tasks")
             "* TODO %?\n  %i\n")
            ("T" "Todo" entry (file+headline org-default-notes-file "Tasks")
             "* TODO %?\n %i\n %a")
            ;; ("j" "Journal" entry (file+datetree "~/org/journal.org")
            ;;  "* %?\nEntered on %U\n  %i\n  %a")
            ))

    ;;(add-hook 'org-mode-hook 'org-display-outline-path)
    (global-set-key (kbd "C-c M-o") 'org-iswitchb)
    ;;(setq header-line-format '(:eval (org-display-outline-path nil t))))
    (bind-key "C-_" 'undo org-mode-map)
    (bind-key "<C-M-return>" 'org-insert-item org-mode-map)
    (add-hook 'org-mode-hook 'auto-fill-mode)
    (add-hook 'org-mode-hook (lambda () (setq fill-column 80))))

  (with-eval-after-load 'org-drill
    (setq org-drill-use-visible-cloze-face-p t)
    (setq org-drill-cram-hours 0))

  ;;; LINUX SPECIFIC CONF
  (when (string-equal system-type "gnu/linux")
    (global-set-key (kbd "C-w") 'backward-kill-word)
    (global-set-key (kbd "C-\d") 'kill-region)

    ;; Ideally would like to have mu/mu4e on my macbook also, but having trouble getting that
    ;; working.
    (add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
    (require 'mu4e)
    (require 'mu4e-contrib)
    (require 'org-mu4e)
    (setq mu4e-maildir "~/mail"
          mu4e-trash-folder "/Trash"
          mu4e-refile-folder "/Archive"
          mu4e-get-mail-command "offlineimap"
          mu4e-update-interval 300
          mu4e-compose-signature-auto-include nil
          mu4e-view-show-images t
          mu4e-view-show-addresses t
          mu4e-view-prefer-html t
          ;; mu4e-html2text-command "elinks -dump -dump-width 100"
          ;; mu4e-html2text-command "html2markdown"
          mu4e-html2text-command 'mu4e-shr2text
          shr-color-visible-luminance-min 60
          shr-color-visible-distance-min 5
          )
    (add-to-list 'mu4e-bookmarks
                 (make-mu4e-bookmark
                  :name "Uni unread/flagged"
                  :query "maildir:/uni flag:unread OR maildir:/uni flag:flagged"
                  :key ?s))
    ;; Stops shr using funky colours that make things unreadable.
    (advice-add #'shr-colorize-region :around (defun shr-no-colourise-region (&rest ignore)))
    (add-to-list 'mu4e-view-actions '("ViewInBrowser" . mu4e-action-view-in-browser) t)

    (setq org-mu4e-link-query-in-headers-mode nil)
    (setq mu4e-sent-folder "/sent"
          mu4e-drafts-folder "/drafts"
          smtpmail-default-smtp-server "smtp.gmail.com"
          smtpmail-smtp-server "smtp.gmail.com"
          smtpmail-smtp-service 587
          message-send-mail-function 'smtpmail-send-it)
    (setq mu4e-headers-hide-predicate
          (lambda (msg)
            (member 'trashed (mu4e-message-field msg :flags))))

    (setq my/mu4e-uni-context
          (make-mu4e-context
           :name "Uni"
           :enter-func (lambda () (mu4e-message "Entering Uni context"))
           :leave-func (lambda () (mu4e-message "Leaving Uni context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches
                            msg
                            '(:to :cc :bcc) '("ppyms3@nottingham.ac.uk"
                                              "ppyms3@exmail.nottingham.ac.uk"))))
           :vars '((user-mail-address . "ppyms3@nottingham.ac.uk")
                   (user-full-name . "Mark Skilbeck")
                   (mu4e-sent-folder . "/sent")
                   (user-mail-address . "ppyms3@exmail.nottingham.ac.uk")
                   (smtpmail-smtp-user . "ppyms3@ad.nottingham.ac.uk")
                   (smtp-local-domain . "office365.com")
                   (smtpmail-default-smtp-server . "smtp.office365.com")
                   (smtpmail-smtp-server . "smtp.office365.com")
                   (smtpmail-smtp-service . 587))))

    (setq my/mu4e-personal-context
          (make-mu4e-context
           :name "Personal"
           :enter-func (lambda () (mu4e-message "Entering Personal context"))
           :leave-func (lambda () (mu4e-message "Leaving Personal context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches
                            msg
                            '(:to :cc :bcc) "markskilbeck@gmail.com")))
           :vars '((user-mail-address . "markskilbeck@gmail.com")
                   (user-full-name . "Mark Skilbeck")
                   (mu4e-sent-folder . "/sent")
                   (smtpmail-smtp-user . "markskilbeck@gmail.com")
                   (smtp-local-domain . "gmail.com")
                   (smtpmail-default-smtp-server . "smtp.gmail.com")
                   (smtpmail-smtp-server . "smtp.gmail.com")
                   (smtpmail-smtp-service . 587))))

    (setq mu4e-contexts (list my/mu4e-personal-context my/mu4e-uni-context))
    (setq mu4e-context-policy 'pick-first)
    (setq mu4e-compose-context-policy 'ask)

    (add-hook 'mu4e-view-mode-hook 'visual-line-mode)
    (add-hook 'visual-line-mode-hook 'visual-fill-column-mode))

  ;; Open urls in text with firefox
  (setq browse-url-browser-function 'browse-url-firefox)

  ;; I have ~/.spacemacs, ~/.config/... etc symlinked to my ~/hackery/dotfiles/. Magit etc
  ;; needs to load the dotfile stuff, not the homedir stuff, so follow the symlink to
  ;; dotfiles.
  (setq vc-follow-symlinks t)

  ;; Tell magit to give me an overview of my favourite repos. Use magit-list-repositories
  ;; to get a repo list. It's not actually that helpful... essentially just shows the repo
  ;; paths with no other useful information.
  ;;
  ;; Maybe a TODO is to put some useful info in there, e.g. if that repo has changes, etc.
  (setq magit-repository-directories
        '(("~/hackery/" . 1)))

  ;;;; Custom movement/movement-related stuff.
  (defun me/backward-kill-word-or-region (arg)
    "Kill the previous word. If there is an active region, kill
that instead. In both cases, save killed text to kill ring."
    (interactive "P")
    (if (region-active-p)
        (kill-region (region-beginning)
                     (region-end))
      (backward-kill-word (or arg 1))))
  (global-set-key (kbd "C-w") 'me/backward-kill-word-or-region)

  ;; Useful package that changes what is meant by beginning/ending of a file. For example,
  ;; while reading an email, M-< will take you to the beginning of the email body rather
  ;; than the very first line in the email (top of the headers). 
  (beginend-global-mode)

  ;; As per emacs rocks episode 16
  (require 'dired-details)
  (setq-default dired-details-hidden-string "--- ")
  (dired-details-install)

  ;; workgroups goes some way to giving a "desktop" experience, where you can save
  ;; window/buffer configurations. They can persist over sessions too, so exiting/opening
  ;; emacs doesn't mean your nice window configuration is gone forever (assuming you told
  ;; workgrouns to save it).
  ;;
  ;; Maybe look into using
  ;; http://boyanangelov.com/spacemacs/layers/+window-management/spacemacs-layouts/README.html
  ;; Basic use:
  ;; 1. Identify window and buffer layout that I need to save
  ;; 2. Save that layout to file with: M-x wg-save
  ;; 3. If you close emacs / do stuff to lose that layout, reload it with
  ;;    M-x wg-load
  ;; An alternative to workgroups is to use the window registers. Workgroups seem more
  ;; appropriate for long-term window configurations that might need to persist over
  ;; sessions. Use window registers if you don't want to lose a window configuration for
  ;; some small amount of time. E.g., I'm currently writing some quantum computing notes
  ;; in one buffer and have the pdf I'm reading in another, with side-by-side windows
  ;; showing both. If instead I would like to quickly do something else, for example, edit
  ;; my emacs config, I will save the window config to a register with "C-x r w <number>"
  ;; and later recall that window config with "C-x r j <number>". Alternatively,
  ;; use "M-x helm-registers" for a list of registers. It would be nice to have
  ;; more descriptive names, but maybe that's when workgroups is more relevant.
  (require 'workgroups)

  ;; Remove those ugly rounded separators that don't show properly on my systems.
  (setq powerline-default-separator nil)
  (load (expand-file-name "~/quicklisp/slime-helper.el"))

  (fringe-mode 14)
  (linum-mode +1)

  )

;; Make META the command key
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'nil)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete


  (setq powerline-default-separator 'box)

  )
