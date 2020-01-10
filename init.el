(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
    (setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist ()
    (setq file-name-handler-alist startup/file-name-handler-alist))

(defun startup/reset-gc ()
    (setq gc-cons-threshold 16777216
	gc-cons-percentage 0.1))

(add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
(add-hook 'emacs-startup-hook 'startup/reset-gc)



(setq inhibit-startup-message t)

;高亮行号
(global-hl-line-mode t)


(setq backup-directory-alist (quote (("." . "~/.config/emacs/.emacs-backups"))))

(add-to-list 'default-frame-alist '(width.90))

(add-to-list 'default-frame-alist '(height.40))



(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize) 

(set-frame-font "Hasklug Nerd Font 13")
;(set-frame-font "Iosevka 13")

(set-face-italic 'font-lock-comment-face nil) 

(set-frame-parameter nil 'undecorated t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)
;行号
;(global-display-line-numbers-mode 1)
;高亮括号
(show-paren-mode 1)

;;
;; use use-package
;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(use-package diminish :ensure t)
(use-package bind-key :ensure t)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


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

;all-the-icons
(use-package all-the-icons :ensure t)

;;powerline
(use-package powerline :ensure t)
(powerline-default-theme)


;;dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

(setq dashboard-banner-logo-title "最 是 人 间 留 不 住")
(setq dashboard-center-content t)

;(setq dashboard-startup-banner "~/Downloads/gnu.png")
(setq dashboard-startup-banner "~/.config/emacs/img/github.jpeg")
(setq dashboard-items '((recents  . 5)
                        ;(bookmarks . 5)
                        ;(projects . 5)
                        ;(agenda . 5)
                        ;(registers . 5)
                        ))
(setq dashboard-set-init-info t)
(setq dashboard-footer "凡是过往，皆为序章!")
(setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face))



;which key
(use-package which-key
  :ensure t
  :init (which-key-mode)
  )


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
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:family "Iosevka")))))

;;;markdown
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))



;;beacon
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1)
  :config
  (setq beacon-color "#bd93f9")
  )


;vi 模式
(use-package evil :ensure t)
(evil-mode 1)

;;
;; company
;;
(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-backends
        '((company-files
           company-keywords
           company-capf
           company-yasnippet
           )
          (company-abbrev company-dabbrev))))

(add-hook 'emacs-lisp-mode-hook (lambda () (set (make-local-variable 'company-backends) '(company-elisp))))

;;
;; change C-n C-p
;;
(with-eval-after-load 'company
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil))


;; ivy mode
;;
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
















(setq custom-file "~/.config/emacs/custom-variables.el")
(when (file-exists-p custom-file)
    (load custom-file))




(load "~/.config/emacs/custom/web.el")
(provide 'init)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6" "a4fa3280ffa1f2083c5d4dab44a7207f3f7bcb76e720d304bd3bd640f37b4bef" "dd854be6626a4243375fd290fec71ed4befe90f1186eb5b485a9266011e15b29" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "eb94e44599a45c495ad472ad551a40b87cbc4bae9631211e7a78d72b102c61b1" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "5c9a906b076fe3e829d030a404066d7949e2c6c89fc4a9b7f48c054333519ee7" "e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" default))
 '(package-selected-packages
   '(company use-package evil doom-themes diminish auto-package-update)))

