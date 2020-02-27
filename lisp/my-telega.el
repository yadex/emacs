(use-package telega
  :ensure t
  :config
  (setq telega-proxies (list'(:server "127.0.0.1" :port 1080 :enable t:type (:@type "proxyTypeSocks5"))))

  (global-set-key (kbd "C-c t") 'telega)
  (telega-mode-line-mode 1)


(setq telega-use-tracking-for nil
        telega-known-inline-bots '("@shufmbot")
        telega-sticker-set-download t
        telega-chat-button-width 28
        ;;telega-root-fill-column 48
        telega-chat-fill-column 37
        telega-chat-button-width 37)

  

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
  (set-face-attribute 'my-telega-face nil :font "Sarasa Term SC 15")
  (setq buffer-face-mode-face 'my-telega-face)
  (buffer-face-mode))
(add-hook 'telega-root-mode-hook 'telega-buffer-face-mode-variable)
(add-hook 'telega-webpage-mode-hook 'telega-buffer-face-mode-variable)
(add-hook 'telega-chat-mode-hook 'telega-buffer-face-mode-variable)
)






(provide 'my-telega)

