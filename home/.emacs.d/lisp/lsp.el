(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (python-mode . lsp-deferred)
  (python-ts-mode . lsp-deferred)
  (rust-mode . lsp-deferred)
  (rust-ts-mode . lsp-deferred)
  (c-mode . lsp-deferred)
  (c++-mode . lsp-deferred)
  (lua-mode . lsp-deferred)
  (lua-ts-mode . lsp-deferred)
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  (setq lsp-modeline-code-actions-enable t)
  (setq lsp-modeline-diagnostics-enable t)
  (setq lsp-clients-clangd-args '("--header-insertion=never" "--inlay-hints"))
  (setq lsp-rust-analyzer-server-display-inlay-hints t)
  (setq lsp-lua-hint-enable t)
  (setq lsp-pyright-server-settings
        '((python.analysis.inlayHints.variableTypes . t)
          (python.analysis.inlayHints.functionReturnTypes . t)
          (python.analysis.inlayHints.pytestParameters . t)))
  (setq lsp-enable-on-type-formatting nil)
  (add-hook 'lsp-mode-hook (lambda ()
                             (add-hook 'before-save-hook #'lsp-format-buffer nil t)
                             (add-hook 'before-save-hook #'lsp-organize-imports nil t)))
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-enable t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-doc-enable t)
  (setq lsp-ui-doc-show-with-cursor t)
  (setq lsp-ui-doc-position 'at-point)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(provide 'lsp)
