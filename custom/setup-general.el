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
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
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
;; (define-key c-mode-map  [(control tab)] 'company-complete)
;; (define-key c++-mode-map  [(control tab)] 'company-complete)

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

;; (use-package real-auto-save
;;   (setq real-auto-save-interval 15)
;;   (setq make-backup-files nil)
;; )


(provide 'setup-general)
