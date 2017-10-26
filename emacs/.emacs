;;; .emacs --- emacs configuration

;;; Commentary:

;;; Code:
;; disable tool-bar, scroll-bar and menu-bar early
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

;; add shell path to exec-path
(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(when (memq window-system '(mac ns x))
  ;; make things like ⌘-h work on a mac
  (setq mac-pass-command-to-system nil)
  ;; ligatures for fonts
  (mac-auto-operator-composition-mode))

;; needed to hide/rename minor-modes
(use-package diminish)

;; smex sorts M-x by usage
(use-package smex)

;; counsel pulls ivy and swiper, better M-x and C-x C-f and C-s
(use-package counsel
  :diminish ivy-mode
  :init
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) ")
  :bind (("C-s" . swiper)
	 ("M-x" . counsel-M-x)
	 ("C-x C-F" . counsel-find-file))
  :config
  (ivy-mode 1))

;; shows help for keybinds
(use-package which-key
  :diminish which-key-mode
  :init
  (which-key-mode))

;; Git!
(use-package magit
  :init
  :bind ("C-x g" . magit-status))

;; do not prompt to follow symlinks
(setq vc-follow-symlinks t)

;; okay-ish looking theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-light t))

;; nice mode-line
(use-package spaceline-config
  :ensure spaceline
  :init
  (setq powerline-default-separator 'slant
	ns-use-srgb-colorspace nil)
  :config
  (setq line-number-mode 1
	column-number-mode 1)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-buffer-encoding-abbrev-off)
  (spaceline-compile)
  (spaceline-emacs-theme))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; all the other modes
(use-package org
  :config
  (setq org-log-done t))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md\\'" . gfm-mode)
	 ("\\.markdown\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package deft
  :commands deft
  :config
  (setq deft-extensions '("org" "md")
	deft-default-extension "org"
	deft-text-mode 'org-mode
	deft-directory "~/Dropbox/org"
	deft-org-mode-title-prefix t
	deft-recursive t
	deft-use-filter-string-for-filename t
	deft-file-naming-rules '((noslash . "-")
				 (nospace . "-")
				 (case-fn . downcase)))
  :bind
  ("C-c n" . deft)
  ("C-c C-g" . deft-find-file))

(use-package anaconda-mode
  :init
  (add-hook 'python-mode-hook 'anaconda-mode))

(use-package company-anaconda
  :init (add-to-list 'company-backends 'company-anaconda))

(use-package terraform-mode)

;; docker
(use-package docker
  :commands docker-mode
  :config
  (docker-global-mode))

(use-package dockerfile-mode
  :mode "Dockerfile.*\\'")

;; Project management
(use-package projectile
  :diminish projectile-mode "p"
  :init
  (setq projectile-completion-system 'ivy)
  :config
  (projectile-mode))

(use-package company
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package flycheck
  :diminish flycheck-mode "f"
  :init (global-flycheck-mode))

;; save recent files
(use-package recentf
  :init
  (recentf-mode))

;; save recent files
(recentf-mode)

(use-package expand-region
  :bind ("C-=" . er/expand-region))

(setq show-paren-mode t
      show-trailing-whitespace t
      size-indication-mode t
      desktop-restore-eager 10
      desktop-save (quote if-exists)
      desktop-save-mode t)

;; move between windows with shift+arrowkeys
(windmove-default-keybindings)

;; fullscreen on C-c f
(bind-key "C-c f" 'toggle-frame-fullscreen)

;; set font
(let ((default-font "Fira Code-13"))
  (assq-delete-all 'font default-frame-alist)
  (add-to-list 'default-frame-alist
	       `(font . ,default-font))
  (set-frame-font default-font))

;; save temporary/backup files in emacs directory
(defvar --backup-directory (concat user-emacs-directory "backups"))
(if (not (file-exists-p --backup-directory))
    (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      delete-by-moving-to-trash t
      kept-old-versions 6
      kept-new-versions 9
      auto-save-default t
      auto-save-timeout 20
      auto-save-interval 200)

;; do not store deleted words in kill ring
(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (backward-word arg) (point))))
(global-set-key (kbd "C-M-<backspace>") 'backward-kill-word)
(global-set-key (kbd "M-<backspace>") 'backward-delete-word)

;; hide startup buffer and scratch buffer comment
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

(provide '.emacs)
;;; .emacs ends here
