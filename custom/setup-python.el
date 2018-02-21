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
  (use-package importmagic)
  (use-package jedi-direx)
  (use-package ob-ipython)
  (use-package py-import-check)
  ;; (use-package py-yapf)
  (use-package yapfify)
  (use-package pydoc-info)
  (use-package sphinx-doc)
)
(provide 'setup-python)
