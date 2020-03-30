(use-package telega
  :ensure t
  :config
  ;(setq telega-proxies (list' (:server "127.0.0.1" :port 1080 :enable t:type (:@type "proxyTypeSocks5"))))
  (setq telega-proxies (list' (:server "127.0.0.1" :port 1080 :enable t :type (:@type "proxyTypeSocks5"))))

  (global-set-key (kbd "C-c t") 'telega)
  (telega-mode-line-mode 1)

 (defun lg-telega-root-mode ()
    (hl-line-mode 1))
  (defun lg-telega-chat-update (chat)
    (with-telega-root-buffer
      (hl-line-highlight)))
  (add-hook 'telega-chat-update-hook 'lg-telega-chat-update)
  (add-hook 'telega-root-mode-hook 'lg-telega-root-mode)



  
(add-hook 'telega-chat-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends)
                 (append '(telega-company-emoji
                           telega-company-username
                           telega-company-hashtag)
                         (when (telega-chat-bot-p telega-chatbuf--chat)
                           '(telega-company-botcmd))))
            (company-mode 1)))


(add-to-list 'all-the-icons-mode-icon-alist
             '(telega-root-mode all-the-icons-fileicon "telegram"
                                :heigt 1.0
                                :v-adjust -0.2
                                :face all-the-icons-yellow))

(add-to-list 'all-the-icons-mode-icon-alist
             '(telega-chat-mode all-the-icons-fileicon "telegram"
                                :heigt 1.0
                                :v-adjust -0.2
                                :face all-the-icons-blue))


(defun telega-buffer-face-mode-variable ()
    (interactive)
    (make-face 'my-telega-face)
    (set-face-attribute 'my-telega-face nil :font "Noto Sans Mono CJK SC 17")
    (make-face 'my-xxxx-face)
    (set-face-attribute 'my-xxxx-face nil :font "Noto Sans Mono CJK SC 17")
    (setq buffer-face-mode-face 'my-xxxx-face)
    (buffer-face-mode)
    )
(add-hook 'telega-root-mode-hook 'telega-buffer-face-mode-variable)
(add-hook 'telega-webpage-mode-hook 'telega-buffer-face-mode-variable)
(add-hook 'telega-chat-mode-hook 'telega-buffer-face-mode-variable)


)

(provide 'my-telega)





