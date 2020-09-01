(setq url-proxy-services
      '(("http" . "127.0.0.1:10000")
        ("https" . "127.0.0.1:10000")))

;; org-modeによる設定
(setq org-src-tab-acts-natively t)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
