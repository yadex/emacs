;+++++++++++++++
;+++主 ++ 题 +++
;+++++++++++++++
(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold nil   ;禁用粗体
        doom-themes-enable-italic nil) ;禁用斜体
  (load-theme 'doom-moonlight t)
  (set-face-background hl-line-face "#161a2a") ;;高亮行号颜色
  )

(use-package doom-modeline
      :ensure t
      ;:hook (after-init . doom-modeline-mode)
      :config
      (setq doom-modeline-height 1)
      (set-face-attribute 'mode-line nil :height 150)
      (set-face-attribute 'mode-line-inactive nil :height 150)
      (setq doom-modeline-modal-icon nil)
      (doom-modeline-mode 1)
      )

;all-the-icons
(use-package all-the-icons :ensure t)




(use-package dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-banner-logo-title "最 是 人 间 留 不 住")
  (setq dashboard-center-content t)
  (setq dashboard-startup-banner "~/.emacs.d/img/ue-green.png")
  (setq dashboard-items '((recents  . 3)
                                        ;(agenda . 3)
                                        ;(bookmarks . 3)
                                        ;(projects . 5)
                                        ;(registers . 3)
                          ))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  (setq dashboard-set-init-info t)
  (setq dashboard-footer "凡是过往，皆为序章!")
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                     :height 1.1
                                                     :v-adjust -0.05
                                                     :face 'font-lock-keyword-face))

  )
(provide 'my-ui)

