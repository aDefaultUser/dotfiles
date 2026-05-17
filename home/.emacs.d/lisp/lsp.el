(require 'lsp-mode)

(add-hook 'python-mode-hook      #'lsp-deferred)
(add-hook 'python-ts-mode-hook   #'lsp-deferred)
(add-hook 'rust-mode-hook        #'lsp-deferred)
(add-hook 'rust-ts-mode-hook     #'lsp-deferred)
(add-hook 'c-mode-hook           #'lsp-deferred)
(add-hook 'c++-mode-hook         #'lsp-deferred)
(add-hook 'lua-mode-hook         #'lsp-deferred)
(add-hook 'lua-ts-mode-hook      #'lsp-deferred)

(setq lsp-auto-guess-root t)
(setq lsp-prefer-flymake t)
(setq lsp-diagnostics-provider :flymake)
(setq lsp-modeline-code-actions-enable t)
(setq lsp-modeline-diagnostics-enable t)
(setq lsp-enable-on-type-formatting nil)

(setq lsp-clients-clangd-args '("--header-insertion=never" "--inlay-hints"))
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-lua-hint-enable t)
(setq lsp-pyright-server-settings
      '((python.analysis.inlayHints.variableTypes . t)
        (python.analysis.inlayHints.functionReturnTypes . t)
        (python.analysis.inlayHints.pytestParameters . t)))

(add-hook 'lsp-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'lsp-format-buffer nil t)
            (add-hook 'before-save-hook #'lsp-organize-imports nil t)))

(define-key lsp-mode-map (kbd "C-c l") lsp-command-map)

(require 'lsp-ui)

(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-show-with-cursor t)
(setq lsp-ui-doc-position 'at-point)

(add-hook 'lsp-mode-hook #'lsp-ui-mode)

(provide 'lsp)
