(use-package auctex
    :mode
    ("\\.tex\\'" . latex-mode)
    :bind
    (:map LaTeX-mode-map
          ("M-<delete>" . TeX-remove-macro)
          ("C-c C-r" . reftex-query-replace-document)
          ("C-c C-g" . reftex-grep-document))
    :init
    ;; A function to delete the current macro in AUCTeX.
    ;; Note: keybinds won't be added to TeX-mode-hook if not kept at the end of the AUCTeX setup!
    (defun TeX-remove-macro ()
        "Remove current macro and return TRUE, If no macro at point, return Nil."
        (interactive)
        (when (TeX-current-macro)
            (let ((bounds (TeX-find-macro-boundaries))
                  (brace  (save-excursion
                              (goto-char (1- (TeX-find-macro-end)))
                              (TeX-find-opening-brace))))
                (delete-region (1- (cdr bounds)) (cdr bounds))
                (delete-region (car bounds) (1+ brace)))
            t))
    :config
    (add-to-list 'TeX-command-list
                 '("Makeglossaries" "makeglossaries %s" TeX-run-command nil
                   (latex-mode)
                   :help "Run makeglossaries script, which will choose xindy or makeindex") t)

    (setq-default TeX-master nil ; by each new fie AUCTEX will ask for a master fie.
                  TeX-PDF-mode t
                  TeX-engine 'xetex)     ; optional

    (setq TeX-auto-save t
          TeX-save-query nil       ; don't prompt for saving the .tex file
          TeX-parse-self t
          TeX-PDF-mode t
          TeX-show-compilation nil         ; if `t`, automatically shows compilation log
          reftex-plug-into-AUCTeX t
          LaTeX-babel-hyphen nil ; Disable language-specific hyphen insertion.
          ;; `"` expands into csquotes macros (for this to work, babel pkg must be loaded after csquotes pkg).
          LaTeX-csquotes-close-quote "}"
          LaTeX-csquotes-open-quote "\\enquote{"
          TeX-file-extensions '("Rnw" "rnw" "Snw" "snw" "tex" "sty" "cls" "ltx" "texi" "texinfo" "dtx")

          TeX-output-view-style (quote
                                 (("^pdf$" "." "evince -f %o")
                                  ("^html?$" "." "iceweasel %o")))
          )

    ;; Font-lock for AuCTeX
    ;; Note: '«' and '»' is by pressing 'C-x 8 <' and 'C-x 8 >', respectively
    (font-lock-add-keywords 'latex-mode (list (list "\\(«\\(.+?\\|\n\\)\\)\\(+?\\)\\(»\\)" '(1 'font-latex-string-face t) '(2 'font-latex-string-face t) '(3 'font-latex-string-face t))))
    ;; Add standard Sweave file extensions to the list of files recognized  by AuCTeX.
    (add-hook 'TeX-mode-hook (lambda () (reftex-isearch-minor-mode)))
    (add-hook 'LaTeX-mode-hook 'visual-line-mode)
    (add-hook 'LaTeX-mode-hook 'flyspell-mode)
    (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
    (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
    (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

    )
(provide 'setup-latex)
