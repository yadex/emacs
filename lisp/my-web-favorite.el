(defun my-setup-indent (n)
  (setq coffee-tab-width n)
  (setq javascript-indent-level n)
  (setq js-indent-level n)
  (setq js2-basic-offset n)
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
(add-hook 'before-save-hook 'tide-format-before-save)


(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'js-mode-hook #'setup-tide-mode)
(add-hook 'js2-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)





(use-package tide
  :ensure t
  :after (typescript-mode company flycheck)
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)
         )
  :config   (setq tide-completion-enable-autoimport-suggestions t)

  )


(provide 'my-web)
