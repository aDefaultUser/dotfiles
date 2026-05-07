(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
                         (or (bound-and-true-p straight-base-dir)
                             user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default t)
(setq warning-suppress-log-types '((native-compiler)))

(setq org-persist-remote-files nil)
(setq org-persist-directory
      (expand-file-name "org-persist/" user-emacs-directory))

(setq x-meta-keysym 'alt)
(setq x-alt-keysym 'meta)

(setq gc-cons-threshold 100000000)
(setq inhibit-startup-screen t)

(straight-use-package 'gruvbox-theme)
(straight-use-package 'dashboard)
(straight-use-package 'meow)
(straight-use-package 'eglot)

(load-theme 'gruvbox-dark-hard t)

(use-package dashboard
  :config
  (setq dashboard-banner-logo-title "CLOUDMACS")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts t)
  (setq dashboard-items
        '((recents . 8)
          (bookmarks . 5)
          (projects . 5)
          (agenda . 5)))
  (dashboard-setup-startup-hook)

  :hook
  (dashboard-mode
   . (lambda ()
       (setq-local line-spacing 2)
       (set-face-attribute
        'dashboard-banner-logo-title
        nil
        :height 320
        :weight 'bold))))

(use-package meow
  :config
  (defun meow-setup ()
    (setq meow-cheatsheet-layout
          meow-cheatsheet-layout-qwerty)

    (meow-leader-define-key
     '("?" . meow-cheatsheet))

    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("c" . meow-change)
     '("d" . meow-delete)
     '("D" . meow-backward-delete)
     '("e" . meow-next-word)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("G" . meow-grab)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("l" . meow-right)
     '("L" . meow-right-expand)
     '("m" . meow-join)
     '("n" . meow-search)
     '("o" . meow-block)
     '("O" . meow-to-block)
     '("p" . meow-yank)
     '("q" . meow-quit)
     '("r" . meow-replace)
     '("s" . meow-kill)
     '("t" . meow-till)
     '("u" . meow-undo)
     '("v" . meow-visit)
     '("w" . meow-mark-word)
     '("x" . meow-line)
     '("y" . meow-save)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '("<escape>" . ignore)))

  (meow-setup)
  (meow-global-mode 1))

(use-package eglot
  :hook
  ((python-mode . eglot-ensure)
   (python-ts-mode . eglot-ensure)
   (js-mode . eglot-ensure)
   (typescript-mode . eglot-ensure)
   (tsx-ts-mode . eglot-ensure)
   (rust-mode . eglot-ensure)
   (rust-ts-mode . eglot-ensure)
   (go-mode . eglot-ensure)
   (c-mode . eglot-ensure)
   (c++-mode . eglot-ensure))
  :config
  (setq eglot-sync-connect 1)
  (setq eglot-autoshutdown t))


(setq initial-buffer-choice 'dashboard-open)
