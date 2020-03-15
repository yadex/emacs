;;;
;;;ivy
;;;
(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")
  :config
  (ivy-mode 1)
  (setq ivy-use-virutal-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq ivy-height 10)
  (setq ivy-initial-inputs-alist nil)
  (setq ivy-count-format "%d/%d")
  (setq ivy-re-builders-alist
        `((t . ivy--regex-ignore-order)))
  )

;;
;; swiper
;;
(use-package swiper
  :ensure t
  :bind (("\C-s" . swiper))
  )

(use-package ivy-posframe
  :ensure t
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
  (setq ivy-posframe-height-alist '((swiper . 11)
                                    (t      . 8)))
  (setq ivy-posframe-height 24)
  (setq ivy-posframe-width 50)
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))

(setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))



  ;(custom-set-faces '(ivy-posframe ((t (:background "#161719")))))
  (setq ivy-posframe-font "BlexMono Nerd Font 16")
  (ivy-posframe-mode 1)
)


(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))

(use-package counsel
  :ensure t
  :init (counsel-mode 1)
  )




(use-package counsel-projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )





(provide 'my-ivy)
