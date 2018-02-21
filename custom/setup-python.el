(use-package elpy
  :init
  (elpy-enable)
  (use-package flycheck
    :init
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))

  (use-package py-autopep8
    :init
    (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "console --simple-prompt")
  (use-package ein)

  (use-package elpygen
    :init
    (define-key python-mode-map (kbd "C-c i") 'elpygen-implement))

  (use-package flycheck-pycheckers
    :init (progn
            global-flycheck-mode 1
            (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup)
            )
    )
  (use-package jedi)
  (use-package importmagic)
  (use-package jedi-direx)
  (use-package ob-ipython)
  (use-package py-import-check)
  ;; (use-package py-yapf)
  (use-package yapfify)
  (use-package pydoc-info)
  (use-package sphinx-doc)
  (use-package pip-requirements)
  (use-package py-isort)
  (use-package auto-virtualenv)
  )

;; Python mode
(defun my-merge-imenu ()
  (interactive)
  (let ((mode-imenu (imenu-default-create-index-function))
        (custom-imenu (imenu--generic-function imenu-generic-expression)))
    (append mode-imenu custom-imenu)))

(defun my-python-hooks()
    (interactive)
    (setq tab-width     4
          python-indent 4
          python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i")
    (if (string-match-p "rita" (or (buffer-file-name) ""))
        (setq indent-tabs-mode t)
      (setq indent-tabs-mode nil)
    )
    (add-to-list
        'imenu-generic-expression
        '("Sections" "^#### \\[ \\(.*\\) \\]$" 1))
    (setq imenu-create-index-function 'my-merge-imenu)
    ;; pythom mode keybindings
    (define-key python-mode-map (kbd "M-.") 'jedi:goto-definition)
    (define-key python-mode-map (kbd "M-,") 'jedi:goto-definition-pop-marker)
    (define-key python-mode-map (kbd "M-/") 'jedi:show-doc)
    (define-key python-mode-map (kbd "M-?") 'helm-jedi-related-names)
    ;; end python mode keybindings

    (eval-after-load "company"
        '(progn
            (unless (member 'company-jedi (car company-backends))
                (setq comp-back (car company-backends))
                (push 'company-jedi comp-back)
                (setq company-backends (list comp-back)))
            )))

(add-hook 'python-mode-hook 'my-python-hooks)
;; End Python mode

(provide 'setup-python)
