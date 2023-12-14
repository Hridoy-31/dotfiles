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
 '(package-selected-packages '(doom-modeline ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
