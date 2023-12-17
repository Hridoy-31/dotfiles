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
   '(doom-themes helpful counsel ivy-rich which-key rainbow-delimiters doom-modeline ivy command-log-mode use-package))
 '(warning-suppress-log-types '((use-package) (use-package)))
 '(warning-suppress-types '((use-package))))
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

; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

; Doom themes
(use-package doom-themes
  :init (load-theme 'doom-gruvbox))

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
