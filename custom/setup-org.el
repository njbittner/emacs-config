(use-package org-plus-contrib
  :mode ("\\.org\\" . org-mode
  :init
  (progn
    (use-package org-edna
      :init (org-edna-load))
  (use-package org-journal)
  (use-package org-bullets)
  (use-package org2jekyll
    :init
    (progn
      (custom-set-variables '(org2jekyll-blog-author "Nathan Bittner")
                      '(org2jekyll-source-directory (expand-file-name "~/Dropbox/jekyll/"))
                      '(org2jekyll-jekyll-directory (expand-file-name "~/Dropbox/public_html/"))
                      '(org2jekyll-jekyll-drafts-dir "/drafts")
                      '(org2jekyll-jekyll-posts-dir "_posts/")
                      '(org-publish-project-alist
                        `(("default"
                           :base-directory ,(org2jekyll-input-directory)
                           :base-extension "org"
                           :publishing-directory ,(org2jekyll-output-directory)
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers nil
                           :with-toc nil
                           :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index t
                           :html-extension "html"
                           :body-only t)
                          ("post"
                           :base-directory ,(org2jekyll-input-directory)
                           :base-extension "org"
                           :publishing-directory ,(org2jekyll-output-directory org2jekyll-jekyll-posts-dir)
                           :publishing-function org-html-publish-to-html
                           :headline-levels 4
                           :section-numbers nil
                           :with-toc nil
                           :html-head "<link rel=\"stylesheet\" href=\"./css/style.css\" type=\"text/css\"/>"
                           :html-preamble t
                           :recursive t
                           :make-index t
                           :html-extension "html"
                           :body-only t)
                          ("images"
                           :base-directory ,(org2jekyll-input-directory "img")
                           :base-extension "jpg\\|gif\\|png"
                           :publishing-directory ,(org2jekyll-output-directory "img")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("js"
                           :base-directory ,(org2jekyll-input-directory "js")
                           :base-extension "js"
                           :publishing-directory ,(org2jekyll-output-directory "js")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("css"
                           :base-directory ,(org2jekyll-input-directory "css")
                           :base-extension "css\\|el"
                           :publishing-directory ,(org2jekyll-output-directory "css")
                           :publishing-function org-publish-attachment
                           :recursive t)
                          ("web" :components ("images" "js" "css")))))
      (setq org2jekyll-mode-map
            (let ((map (make-sparse-keymap)))
              (define-key map (kbd "C-c . n") 'org2jekyll-create-draft)
              (define-key map (kbd "C-c . p") 'org2jekyll-publish-post)
              (define-key map (kbd "C-c . P") 'org2jekyll-publish-posts)
              (define-key map (kbd "C-c . l") 'org2jekyll-list-posts)
              (define-key map (kbd "C-c . d") 'org2jekyll-list-drafts)
              map)
            )
      )
    )

  (add-hook 'org-mode-hook 'org-bullets-mode)

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



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;;;; org brain
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (use-package org-brain :ensure t
;;   :init
;;   (setq org-brain-path "~/Dropbox/brain")
;;   :config
;;   (setq org-id-track-globally t)
;;   (setq org-id-locations-file "~/Dropbox/.org-id-locations")
;;   (push '("b" "Brain" plain (function org-brain-goto-end)
;;           "* %i%?" :empty-lines 1)
;;         org-capture-templates)
;;   (setq org-brain-visualize-default-choices 'all)
;;   (setq org-brain-title-max-length 12))

)
)
