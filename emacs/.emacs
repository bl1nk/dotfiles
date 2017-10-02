(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents (package-refresh-contents))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; smex sorts M-x by usage
(use-package smex)

;; counsel pulls ivy and swiper, better M-x and C-x C-f and C-s
(use-package counsel
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :config
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (ivy-mode 1))

;; shows help for keybinds
(use-package which-key
  :init
  (which-key-mode))

;; Git!
(use-package magit
  :init
  (global-set-key (kbd "C-x g") 'magit-status))

;; okayish looking themes
(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  :config
  (load-theme 'doom-vibrant t)
  (doom-themes-visual-bell-config))

(use-package org
  :config
  (setq org-log-done t))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md\\'" . gfm-mode)
	 ("\\.markdown\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package terraform-mode)

;; Project management
(use-package projectile
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode))

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package smart-mode-line
  :init
  (setq sml/theme 'respectful
	sml/no-confirm-load-theme t
	line-number-mode 1
	column-number-mode 1)
  (sml/setup))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package golden-ratio
  :init
  (setq golden-ratio-auto-scale t)
  (golden-ratio-mode 1))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(setq show-paren-mode t
      show-trailing-whitespace t
      size-indication-mode t
      desktop-restore-eager 10
      desktop-save (quote if-exists)
      desktop-save-mode t)

;; move between windows with shift+arrowkeys
(windmove-default-keybindings)

;; set font
(add-to-list 'default-frame-alist '(font . "Fira Code-14" ))
(set-face-attribute 'default t :font "Fira Code-14" )

;; save temporary/backup files in emacs directory
(setq auto-save-file-name-transforms
      `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		 (concat user-emacs-directory "backups")))))

;; hide startup buffer and scratch buffer comment
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)
