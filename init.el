(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

(defvar startup/file-name-handler-alist file-name-handler-alist)
    (setq file-name-handler-alist nil)

(defun startup/revert-file-name-handler-alist () (setq file-name-handler-alist startup/file-name-handler-alist))

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

;(set-frame-font "Hasklug Nerd Font 13")
(set-frame-font "Iosevka Nerd Font 15")

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


;which key
(use-package which-key
  :ensure t
  :init (which-key-mode)
  )


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
;; magit
;;
(use-package magit
  :ensure t
  :bind (("\C-x g" . magit-status))
  )






(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'my-ui)
(require 'my-web)
(require 'my-ivy)
(require 'my-org)
(require 'my-company)











(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("1ed5c8b7478d505a358f578c00b58b430dde379b856fbcb60ed8d345fc95594e" "6231254e74298a1cf8a5fee7ca64352943de4b495e615c449e9bb27e2ccae709" "a339f231e63aab2a17740e5b3965469e8c0b85eccdfb1f9dbd58a30bdad8562b" "774aa2e67af37a26625f8b8c86f4557edb0bac5426ae061991a7a1a4b1c7e375" "72fda75af7caddec17ba9b49d2f99703c20a5f5f5c4dcec641d34a0b83569e88" "7f791f743870983b9bb90c8285e1e0ba1bf1ea6e9c9a02c60335899ba20f3c94" "a038af4fff7330f27f4baec145ef142f8ea208648e65a4b0eac3601763598665" "d71aabbbd692b54b6263bfe016607f93553ea214bc1435d17de98894a5c3a086" "001e4dbbdb8d01bb299c0244c489504d51ef5939ace24049079b377294786f7c" "0ad7f1c71fd0289f7549f0454c9b12005eddf9b76b7ead32a24d9cb1d16cbcbd" "c520bbbddca1d7362d046635c5cc023b5f151b250ac9f8d6ce763afa804b7d1d" "6de37d6d573e18138aa948683c8ff0e72b89e90d1cdbf683787ea72f8e6295ab" "9743d1941d0559264aa21a542e55043c032d779024cd70468d1123c320699fd1" "c83c095dd01cde64b631fb0fe5980587deec3834dc55144a6e78ff91ebc80b19" "d1c7f2db070c96aa674f1d61403b4da1fff2154163e9be76ce51824ed5ca709c" "07e3a1323eb29844e0de052b05e21e03ae2f55695c11f5d68d61fb5fed722dd2" "6e2d579b02aadc933f434003f49d269d004f5c7094eb53658afbacc817761d83" "cb96a06ed8f47b07c014e8637bd0fd0e6c555364171504680ac41930cfe5e11e" "2cdc13ef8c76a22daa0f46370011f54e79bae00d5736340a5ddfe656a767fddf" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "559b28ae6deb74713fee9064e7ece54cb71ba645f44acbf81ad7916a4f947815" "845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" "88a3c267ce2132defd46f2a4761925983dcbc35b1c3cfff1dded164ce169fed4" "ca849ae0c889eb918785cdc75452b1e11a00848a5128a95a23872e0119ccc8f4" "6bacece4cf10ea7dd5eae5bfc1019888f0cb62059ff905f37b33eec145a6a430" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" "bc836bf29eab22d7e5b4c142d201bcce351806b7c1f94955ccafab8ce5b20208" "1c8171893a9a0ce55cb7706766e57707787962e43330d7b0b6b0754ed5283cda" "0809c08440b51a39c77ec5529f89af83ab256a9d48107b088d40098ce322c7d8" "1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "5e0b63e0373472b2e1cf1ebcc27058a683166ab544ef701a6e7f2a9f33a23726" "6cbf6003e137485fb3f904e76fb15bc48abc386540f43f54e2a47a9884e679f6" "a4fa3280ffa1f2083c5d4dab44a7207f3f7bcb76e720d304bd3bd640f37b4bef" "dd854be6626a4243375fd290fec71ed4befe90f1186eb5b485a9266011e15b29" "0fe9f7a04e7a00ad99ecacc875c8ccb4153204e29d3e57e9669691e6ed8340ce" "eb94e44599a45c495ad472ad551a40b87cbc4bae9631211e7a78d72b102c61b1" "bc99493670a29023f99e88054c9b8676332dda83a37adb583d6f1e4c13be62b8" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "5c9a906b076fe3e829d030a404066d7949e2c6c89fc4a9b7f48c054333519ee7" "e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" default)))
 '(package-selected-packages
   (quote
    (company-prescient vterm company-web company use-package evil doom-themes diminish auto-package-update))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:family "Iosevka")))))
