;; Set font-size
(if (string-equal system-name "avalon")
    (set-face-attribute 'default nil :height 100)
  (set-face-attribute 'default nil :height 75))

(menu-bar-mode -1)			; disable menu bar
(tool-bar-mode -1)			; disable toolbar
;; (scroll-bar-mode -1)			; disable scrollbar
(setq inhibit-splash-screen t)		; disable startup splash screen
(setq inhibit-startup-message t)	; No start message
(setq ring-bell-function 'ignore)	; stop annoying emacs ding
(column-number-mode t)
(show-paren-mode t)
(defalias 'yes-or-no-p 'y-or-n-p)	; input y/n instead of yes/no
(set-default 'truncate-lines nil)	        ; Don't truncate lines
(setq gc-cons-threshold 100000000)	; Garbage collection related
;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook
          (lambda () (interactive)
            (setq show-trailing-whitespace 1)))
;; Compilation
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (setq-local compilation-read-command nil)
                               (call-interactively 'compile)))
;; setup GDB
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

;; company
(use-package company
  :init
  (global-company-mode 1)
  (delete 'company-semantic company-backends))

;; Package: projejctile
(use-package projectile
  :init
  (projectile-global-mode)
  (setq projectile-enable-caching t))

;; Package zygospore
(use-package zygospore
  :bind (("C-x 1" . zygospore-toggle-delete-other-windows)
         ("RET" .   newline-and-indent)))
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-c w") 'whitespace-mode)
(windmove-default-keybindings)
(use-package diminish)

(use-package real-auto-save
  :init
  (setq real-auto-save-interval 15)
  (setq make-backup-files nil)
  )

(use-package magit
  :pin melpa-stable)

(use-package org-edit-latex)
;; (use-package ov)
(use-package pdf-tools)
(use-package pydoc)
(use-package ace-window
  :bind (("C-x o" . ace-window)))
;; (use-package rainbow-mode)
;; (use-package s)
;; (use-package recentf
;;   :config
;;   (setq recentf-exclude
;;         '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
;;           ".*png$" "\\*message\\*" "auto-save-list\\*"))
;;   (setq recentf-max-saved-items 60))

;; (use-package smart-mode-line
;;   :config
;;   (setq sml/no-confirm-load-theme t)
;;   (setq sml/theme 'light)
;;   (sml/setup))

;; (use-package ov-highlight
;;   :ensure nil
;;   :load-path (lambda () (expand-file-name "ov-highlight" scimax-dir))
;;   :bind ("H-h" . ov-highlight/body)
;;   :init
;;   (add-to-list 'load-path
;;                (expand-file-name "ov-highlight" scimax-dir)))



(provide 'setup-general)
