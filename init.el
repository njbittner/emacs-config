;; Emacs Config.
(setq user-full-name "Nathan Bittner"
      user-mail-address "njbittner@gmail.com")
  
; add MELPA to repository list
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))
(package-initialize)
; if nothing shows up, refresh
(when (not package-archive-contents)
  (package-refresh-contents))

; Ensure use-package is installed
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Custom Packages in /lisp
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'setup-general)
(require 'setup-latex)
(require 'setup-helm)
(require 'setup-cedet)
(require 'setup-editing)
(require 'setup-helm-gtags)

(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; BEGIN ORG-MODE SETUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;                      ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(with-eval-after-load 'org
  (require 'org-journal)
  (require 'org-bullets)
  (add-hook 'org-mode-hook 'org-bullets-mode)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; org2jekyll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'org2jekyll)
;; (custom-set-variables '(org2jekyll-blog-author "Nathan Bittner")
;;                       '(org2jekyll-source-directory (expand-file-name "~/Dropbox/jekyll/"))
;;                       '(org2jekyll-jekyll-directory (expand-file-name "~/Dropbox/public_html/"))
;;                       '(org2jekyll-jekyll-drafts-dir "/drafts")
;;                       '(org2jekyll-jekyll-posts-dir "_posts/")
;;                       '(org-publish-project-alist
;;                         `(("default"
;;                            :base-directory ,(org2jekyll-input-directory)
;;                            :base-extension "org"
;;                            :publishing-directory ,(org2jekyll-output-directory)
;;                            :publishing-function org-html-publish-to-html
;;                            :headline-levels 4
;;                            :section-numbers nil
;;                            :with-toc nil
;;                            :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
;;                            :html-preamble t
;;                            :recursive t
;;                            :make-index t
;;                            :html-extension "html"
;;                            :body-only t)
;;                           ("post"
;;                            :base-directory ,(org2jekyll-input-directory)
;;                            :base-extension "org"
;;                            :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
;;                            :publishing-function org-html-publish-to-html
;;                            :headline-levels 4
;;                            :section-numbers nil
;;                            :with-toc nil
;;                            :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
;;                            :html-preamble t
;;                            :recursive t
;;                            :make-index t
;;                            :html-extension "html"
;;                            :body-only t)
;;                           ("images"
;;                            :base-directory ,(org2jekyll-input-directory "img")
;;                            :base-extension "jpg\\|gif\\|png"
;;                            :publishing-directory ,(org2jekyll-output-directory "img")
;;                            :publishing-function org-publish-attachment
;;                            :recursive t)
;;                           ("js"
;;                            :base-directory ,(org2jekyll-input-directory "js")
;;                            :base-extension "js"
;;                            :publishing-directory ,(org2jekyll-output-directory "js")
;;                            :publishing-function org-publish-attachment
;;                            :recursive t)
;;                           ("css"
;;                            :base-directory ,(org2jekyll-input-directory "css")
;;                            :base-extension "css\\|el"
;;                            :publishing-directory ,(org2jekyll-output-directory "css")
;;                            :publishing-function org-publish-attachment
;;                            :recursive t)
;;                           ("web" :components ("images" "js" "css")))))
;; (setq org2jekyll-mode-map
;;       (let ((map (make-sparse-keymap)))
;;         (define-key map (kbd "C-c . n") 'org2jekyll-create-draft)
;;         (define-key map (kbd "C-c . p") 'org2jekyll-publish-post)
;;         (define-key map (kbd "C-c . P") 'org2jekyll-publish-posts)
;;         (define-key map (kbd "C-c . l") 'org2jekyll-list-posts)
;;         (define-key map (kbd "C-c . d") 'org2jekyll-list-drafts)
;;         map))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; ORG GCAL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq package-check-signature nil)
(use-package "org-gcal"
  :ensure t
  :config
  (setq org-gcal-client-id "304124820941-1o6dv7pq285ogf0bpqu7vfedml83ba7r.apps.googleusercontent.com"
	org-gcal-client-secret "eUVFNo9E3dvqgo5osJmvn7kp"
	org-gcal-file-alist '(("bittn037@umn.edu" .  "~/Dropbox/org/gcal.org"))))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org capture
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-iswitchb)

  (setq org-default-notes-file "~/Dropbox/org/in-list.org")

(setq org-agenda-files (list "~/Dropbox/org/in-list.org"
    "~/Dropbox/courses/WRIT1301/1301.org"
    "~/Dropbox/courses/CSCI4061/4061.org"
    "~/Dropbox/courses/PSY3011/3011.org"
    "~/Dropbox/courses/CSCI5801/5801.org"
    "~/Dropbox/courses/PHIL8602/8602.org"
    "~/Dropbox/courses/CSCI5552/5552.org"
    "~/Dropbox/research_journal/courses"
    "~/Dropbox/org"))


  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "HOLD(h)" "|" "CANCELED(c)" "DONE(d)")
                            (type "|" "MEETING(m)" "CALL(p)" "EVENT")))

  (setq org-use-fast-todo-selection t
        org-enforce-todo-dependencies t)

  (setq org-todo-keyword-faces '(("TODO"     . (:foreground "red"     :weight bold))
                                 ("NEXT"     . (:foreground "blue"    :weight bold))
                                 ("WAITING"  . (:foreground "orange"  :weight bold))
                                 ("HOLD"     . (:foreground "orange"  :weight bold))
                                 ("CANCELED" . (:foreground "orange"  :weight bold))
                                 ("DONE"     . (:foreground "green"   :weight bold))
                                 ("EVENT"    . (:foreground "magenta" :weight bold))
                                 ("CALL"     . (:foreground "magenta" :weight bold))
                                 ("MEETING"  . (:foreground "magenta" :weight bold))))

  (setq org-capture-templates
        '(("t" "To do" entry (file "~/Dropbox/org/in-list.org") "* TODO %?\n")
          ("n" "Note" plain (file "~/Dropbox/org/in-list.org") "* %i%?\n")
          ("v" "Vocab" entry (file "~/Dropbox/org/vocab.org") "* %? :drill:\n")
          ("a" "assignment" entry (file  "~/Dropbox/org/gcal.org" )
	   "* %?\n\n%^T\n\n:PROPERTIES:\n\n:END:\n\n")
	  ("m" "math term" entry (file "~/Dropbox/org/mathematics-dictionary.org") "* %?\n")
	  ))
  
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
(setq org-reverse-note-order 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; org brain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package org-brain :ensure t
  :init
  (setq org-brain-path "~/Dropbox/brain")
  :config
  (setq org-id-track-globally t)
  (setq org-id-locations-file "~/Dropbox/.org-id-locations")
  (push '("b" "Brain" plain (function org-brain-goto-end)
          "* %i%?" :empty-lines 1)
        org-capture-templates)
  (setq org-brain-visualize-default-choices 'all)
  (setq org-brain-title-max-length 12))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;      END ORG MODE SETUP     ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up multiple cursors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'multiple-cursors)
(global-set-key (kbd "C-x C-SPC") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "s->") 'mc/mark-all-like-this)


; This would be to change font to "input" font.
;(modify-all-frames-parameters '((font . "Input")))


;; Set global-company to true by default
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'after-init-hook 'global-company-mode)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable Auto-save
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-enabled-themes (quote (ample-zen)))
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "2fb337439962efc687d9f9f2bf7263e6de3e6b4b910154a02927c2a70acf496c" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(easy-jekyll-basedir "~/myblog/_site")
 '(fci-rule-color "#37474f")
 '(global-company-mode t)
 '(hl-sexp-background-color "#1c1f26")
 '(org-journal-date-prefix "* ")
 '(org-journal-dir "~/Dropbox/research_journal")
 '(org-journal-encrypt-on t)
 '(package-selected-packages
   (quote
    (ac-c-headers ac-c-headers auto-complete-clang auto-dim-other-buffers swoop yaml-mode easy-jekyll jekyll-modes ample-zen-theme org2jekyll ein writegood-mode auto-complete-auctex org-brain org-clock-convenience org-drill-table request request-deferred org-gcal real-auto-save google-c-style helm-google google-this helm-org-rifle ggtags default-text-scale org-journal org-download org-bullets orca org-ac org-notebook org-pomodoro ob-ipython org-babel-eval-in-repl challenger-deep-theme company-auctex sx better-defaults org-beautify-theme ledger-mode haskell-mode expand-region disable-mouse csv-mode auctex-latexmk magit magit-filenotify latex-preview-pane auctex helm-spotify-plus helm-spotify zygospore ws-butler volatile-highlights undo-tree material-theme iedit helm-projectile helm-gtags function-args dtrt-indent counsel-projectile company clean-aindent-mode anzu ace-mc abyss-theme)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil)
 '(yas-snippet-dirs (quote ("/home/potato/Dropbox/.emacs.d/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-string-face ((t (:foreground "orange red")))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SETUP ACE WINDOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-p") 'ace-window)

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


;;;;;;;;---------------------
;;;;;;;;  C MODIFICATIONS
;;;;;;;;--------------



; start flymake-google-cpplint-load
; let's define a function for flymake initialization
(defun my:flymake-google-init () 
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode 
(global-ede-mode 1)
; create a project for our program.
;; (ede-cpp-root-project "my project" :file "~/desrc/main.cpp"
;; 		      :include-path '("/../my_inc"))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)

;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (let ((yas-fallback-behavior nil))
;;     (unless (yas-expand)
;;       (call-interactively #'company-complete-common))))
;; (add-hook 'company-mode-hook (lambda ()
;;   (substitute-key-definition 'company-complete-common
;;                              'company-yasnippet-or-completion
;;                              company-active-map)))

(find-file "~/Dropbox/")