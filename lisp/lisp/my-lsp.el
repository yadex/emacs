(use-package lsp-mode
  :ensure t
  :init (setq lsp-keymap-prefix "s-l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (js2-mode . lsp)
         (web-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands lsp)

(provide 'my-lsp)
