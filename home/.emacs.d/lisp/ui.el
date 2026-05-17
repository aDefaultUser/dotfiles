(load-theme 'gruvbox-dark-hard t)

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "CLOUDMACS")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-items '((recents . 8) (bookmarks . 5) (projects . 5) (agenda . 5)))
  (dashboard-setup-startup-hook)
  :hook
  (dashboard-mode . (lambda ()
                      (setq-local line-spacing 2)
                      (set-face-attribute 'dashboard-banner-logo-title nil :height 320 :weight 'bold))))

(provide 'ui)
