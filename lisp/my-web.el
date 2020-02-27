(defun my-setup-indent (n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
  (setq javascript-indent-level n)
  (setq typescript-indent-level n)
  (setq web-mode-markup-indent-offset n)
  (setq web-mode-css-indent-offset n)
  (setq web-mode-code-indent-offset n)
  (setq css-indent-offset n))
(my-setup-indent 2)



;;+++++++++++++++++++++++++++++++++++++++++++
;;    
;;  web
;; 
;;+++++++++++++++++++++++++++++++++++++++++++

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  )
(use-package emmet-mode
  :ensure t
  :config
  (define-key emmet-mode-keymap(kbd "C-l") 'emmet-expand-line)
  )

;;;
;;;js
;;;

(use-package js2-mode
  :ensure t
  :mode  ("\\.js\\'" . js2-mode)
  :config
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  )

(use-package rjsx-mode
  :ensure t
  )

(use-package json-mode
  :ensure t
  )

;;;
;;; typescript 
;;;
(defun setup-tide-mode ()
  (interactive)
  (message "setup tide mode")
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(setq company-tooltip-align-annotations t)

;;;use prettier-js instead of tide-format
;(add-hook 'before-save-hook 'tide-format-before-save)


(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)

(use-package prettier-js
  :ensure t
  :config 
  (define-key js2-mode-map(kbd "C-c C-c p") 'prettier-js)
  (define-key js-mode-map(kbd "C-c C-c p") 'prettier-js)
  (define-key rjsx-mode-map(kbd "C-c C-c p") 'prettier-js)
  )



(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         ;(before-save . tide-format-before-save)
         )
  :config
  ;(setq tide-completion-enable-autoimport-suggestions t)
  (setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))
  ;(setq tide-tsserver-executable "~/node_modules/typescript/bin/tsserver")
  (setq create-lockfiles nil)
  )


(provide 'my-web)
