;; Emacs Config.
(setq gc-cons-threshold 80000000) 	;; garbage colection to make init faster
(setq user-full-name "Nathan Bittner"
      user-mail-address "njbittner@gmail.com")

(require 'package)
(setq package-archives
      '(("melpa-stable" . "https://stable.melpa.org/packages/")
        ("melpa" . "https://melpa.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(setq package-archive-priorities
      '(("melpa-stable" . 20)
        ("marmalade" . 10)
        ("org" . 10)
        ("gnu" . 10)
        ("melpa" . 12)))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package moe-theme)

;; Custom Packages in /lisp
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-general)
(require 'setup-latex)
(require 'setup-helm)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm-gtags)
(require 'setup-c)
(require 'setup-python)
(require 'setup-org)
(require 'setup-theme)
