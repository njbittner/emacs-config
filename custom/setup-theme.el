(use-package powerline)
(use-package doom-themes)
(use-package moe-theme
  :config
  (progn
    ;; Show highlighted buffer-id as decoration. (Default: nil)
    (setq moe-theme-highlight-buffer-id t)

    ;; Resize titles (optional).
    ;; (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
    ;; (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
    ;; (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

    ;; Choose a color for mode-line.(Default: blue)
    ;; (moe-theme-set-color 'cyan)

    ;; Finally, apply moe-theme now.
    ;; Choose what you like, (moe-light) or (moe-dark)
    (moe-theme-set-color 'orange)
    ;; (Available colors: blue, orange, green ,magenta, yellow, purple, red, cyan, w/b.)
    (moe-dark)
    (powerline-moe-theme)
    )
  )
(provide 'setup-theme)
