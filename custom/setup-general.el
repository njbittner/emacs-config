;; Set font-size
(if (string-equal system-name "avalon")
    (set-face-attribute 'default nil :height 100)
  (set-face-attribute 'default nil :height 75))

(global-linum-mode t)
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up multiple cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)
(global-set-key (kbd "C-x C-SPC") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "s->") 'mc/mark-all-like-this)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; scrollers
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key  "\S-\M-n" (lambda () (interactive) (scroll-up 3)))
(global-set-key  "\S-\M-p" (lambda () (interactive) (scroll-down 3)))

(global-set-key (kbd "M-n") (lambda () (interactive) (next-line 5)))
(global-set-key (kbd "M-p") (lambda () (interactive) (previous-line 5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Set default Broswer as Chrome instead of Firefox
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (string-equal system-name "avalon")
    (setq browse-url-browser-function 'browse-url-generic
	  browse-url-generic-program "google-chrome")
  (setq browse-url-browser-function 'browse-url-generic
	browse-url-generic-program "google-chrome"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CUSTOM FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))




;; (use-package rainbow-mode)
;; (use-package s)
;; (use-package recentf
;;   :config
;;   (setq recentf-exclude
;;         '("COMMIT_MSG" "COMMIT_EDITMSG" "github.*txt$"
;;           ".*png$" "\\*message\\*" "auto-save-list\\*"))
;;   (setq recentf-max-saved-items 60))

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



;; ;;;;; aesthetics
;; (use-package color-theme
;;   :init
;;   (progn
;;   (color-theme-initialize)
;;   (setq color-theme-is-global t)
;;   )
;;   :config
;;   (progn
;;     (use-package color-theme-sanityinc-solarized
;;       :config

;;       (color-theme-sanityinc-solarized))

;;     (custom-set-faces
;;      '(default ((t (:overline nil :inherit nil :stipple nil :background "gray2"
;;                               :foreground "#FFF991" :inverse-video nil :box nil
;;                               :strike-through nil :underline nil
;;                               :slant normal :weight normal :height 83 :width normal
;;                               :foundry "unknown" :family "DejaVu Sans Mono"))))
;;      '(border ((t nil)))
;;      '(cursor ((t (:background "firebrick1" :foreground "black"))))
;;      '(font-lock-comment-delimiter-face
;;        ((default (:inherit font-lock-comment-face :weight ultra-bold))
;;         (((class color) (min-colors 16)) nil)))
;;      '(font-lock-comment-face ((t (:foreground "lime green"))))
;;      '(font-lock-doc-face ((t (:foreground "tomato" :slant italic))))
;;      '(font-lock-function-name-face
;;        ((t (:foreground "deep sky blue" :underline t :weight bold))))
;;      '(font-lock-keyword-face ((t (:foreground "gold" :weight bold))))
;;      '(font-lock-string-face ((t (:foreground "tomato" :slant italic))))
;;      '(fringe ((nil (:background "black"))))
;;      '(highlight ((t (:background "khaki1" :foreground "black"
;;                                   :box (:line-width -1 :color "firebrick1")))))
;;      '(highlight-current-line-face ((t (:inherit highlight))))
;;      '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
;;      '(link ((t (:foreground "DodgerBlue3" :underline t))))
;;      '(menu ((t (:background "gray2" :foreground "#FFF991"))))
;;      '(minibuffer-prompt ((t (:foreground "royal blue"))))
;;      '(mode-line ((t (:background "dark olive green"
;;                                   :foreground "dark blue"
;;                                   :box (:line-width -1 :color "gray75")
;;                                   :weight bold))))
;;      '(mode-line-buffer-id ((t (:background "dark olive green" :foreground "beige"))))
;;      '(mode-line-highlight ((((class color) (min-colors 88)) nil)))
;;      '(mode-line-inactive ((t (:background "dark olive green"
;;                                            :foreground "dark khaki" :weight light))))
;;      '(mouse ((t (:background "Grey" :foreground "black"))))
;;      '(trailing-whitespace ((((class color) (background dark))
;;                              (:background "firebrick1")))))

;;                                         ; make sure the frames have the dark background mode by default
;;     (setq default-frame-alist (quote (
;;                                       (frame-background-mode . dark)
;;                                       )))
;;     )
;;   )




(provide 'setup-general)
