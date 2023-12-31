; Suppress the startup message
(setq inhibit-startup-message t)

; Disable visible scrollbar
(scroll-bar-mode -1)

; Disable the toolbar
(tool-bar-mode -1)

; Disable tooltips
(tooltip-mode -1)

; (set-fringe-mode 10)

; Disable the menu bar
(menu-bar-mode -1)

; Set up the visible bell
(setq visible-bell t)

; Setting up the font and size
(set-face-attribute 'default nil :font "Fira Code Retina" :height 130)

; Theme
(load-theme 'wombat)

; Make ESC key to quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

; Initialize package sources
(require 'package)

; Setting package archives
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

; Initializing packages
(package-initialize)

; Refresh the packages
(unless package-archive-contents
  (package-refresh-contents))

; Install and initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

; Load use-package
(require 'use-package)

; Use use-package to install other packages every time
(setq use-package-always-ensure t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" default))
 '(package-selected-packages
   '(evil-magit magit counsel-projectile projectile hydra evil-collection evil general all-the-icons doom-themes helpful counsel ivy-rich which-key rainbow-delimiters doom-modeline ivy command-log-mode use-package))
 '(warning-suppress-log-types '((use-package) (use-package)))
 '(warning-suppress-types '((comp) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Enable column number
(column-number-mode)

; Enable global line number
(global-display-line-numbers-mode t)

; Disable line numbers for the following modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

; Describe command side by side after executing
; M-x clm/toggle-command-log-buffer
(use-package command-log-mode)

; Using Ivy package for completion feature
(use-package ivy
  ; hides the Ivy mode from the mini buffer
  :diminish
  :bind (
	 ; Search forward
	 ("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))  
  :config
  (ivy-mode 1))

; Install additional icons for the modeline
; For the very first time after installing all-the-icons package
; run the command: M-x all-the-icons-install-fonts
(use-package all-the-icons)

; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

; Doom themes
(use-package doom-themes
  :init (load-theme 'doom-dracula t))

; Rainbow delimiters for colorful parenthesis
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

; Showing available keybindings
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

; Additional informations of auto-completion commands
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

; Using Counsel package for more helpful descriptions of the available auto-completion commands
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

; Using Helpful package for better descriptions of functions and variables
(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

; Setting special personal key bindings by using "General" package
(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  ; Calling custom key binding definer
  (rune/leader-keys
   "t"  '(:ignore t :which-key "toggles")
   "tt"  '(counsel-load-theme :which-key "choose theme")))

; Evil mode
(use-package evil
  :init
  ; integrate evil in all mode
  (setq evil-want-integration t)
  ; no automatic keybindings for evil 
  (setq evil-want-keybinding nil)
  ; C-u for scrolling in Normal state
  (setq evil-want-C-u-scroll t)
  ; Disable jumping the cursor to the first character
  ; of the buffer when activating Insert mode
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  ; "Ctrl-g" to switch the mode to Normal from Insert
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  ; BACKSPACE key of VIM (remove character backward and joins the next line to that line)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ; Visual line motions will work outside of the visual-line-mode
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  ; Keeping messages and dashboard modes to Normal state
  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

; "evil-collection" package is simply an extension of evil mode
(use-package evil-collection
  ; load "evil" package before loading "evil-collection" package.
  :after evil
  :config
  ; Initializing evil-collection package
  (evil-collection-init))

; Use "hydra" package for text scaling
(use-package hydra)

; defining a hydra
; The prompt will wait for 4 seconds and then exit automatically
; if no key is pressed.
(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ; "j" for zoom in
  ("j" text-scale-increase "in")
  ; "k" for zoom out
  ("k" text-scale-decrease "out")
  ; "f" for finished scaling and quit hydra
  ("f" nil "finished" :exit t))

(rune/leader-keys
  ; "Ctrl-Space-t-s" for text scaling using the hydra
  "ts" '(hydra-text-scale/body :which-key "scale text"))

; Using "Projectile" package for managing and interacting with project directories
(use-package projectile
  :diminish projectile-mode
  ; Enabling projectile mode
  :config (projectile-mode)
  ; Using ivy completion as the completion command for the projectile package
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ; Maintaing projectile package into the "~/Projects" directory always.
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects")))
  ; When switch project, always show the new project's directories and files as a list
  (setq projectile-switch-project-action #'projectile-dired))

; Extending "projectile" package by combining it with "counsel" for better completion and
; and interactive search
(use-package counsel-projectile
  :config (counsel-projectile-mode))

; "magit" is a git interface in emacs
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

; Using "magit" with "evil" keybindings
(use-package evil-magit
  :after magit)
