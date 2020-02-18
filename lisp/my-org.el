;;;
;;;org-mode
;;;
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )

; Org table font
(custom-set-faces
 '(org-table ((t (:family "Iosevka")))))

(provide 'my-org)
