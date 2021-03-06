;; Random font settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 98 :width normal :foundry "outline" :family "Source Code Pro")))))

;; packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; color scheme
(add-to-list 'custom-theme-load-path
	     (file-name-as-directory "~/.emacs.d/themes"))
(load-theme 'bharadwaj-slate t t)
(load-theme 'aalto-light t t)
(load-theme 'kingsajz t t)
(load-theme 'dark-blue2 t t)
(enable-theme 'dark-blue2)

;; allow line numbers
(require 'linum)
(define-globalized-minor-mode my-global-linum-mode linum-mode
  (lambda () (linum-mode 1)))
(my-global-linum-mode 1)

;; disable the scroll bar
(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; rainbow mode
(require 'rainbow-mode)
(define-globalized-minor-mode my-global-rainbow-mode rainbow-mode
  (lambda () (rainbow-mode 1)))
(my-global-rainbow-mode 1)

;; screen resizing to meet the golden ration
(golden-ratio-mode 1)

;; projectile
(projectile-global-mode 1)
(setq projectile-indexing-method 'native)
;; use grizzl for fuzzy searching
(setq projectile-completion-system 'grizzl)

;; helm
(require 'helm)
(require 'helm-config)

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key help-map (kbd "C-z") 'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source
      helm-ff-search-library-in-sexp t ; search for library in 'require' and 'declare-function' sexp
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)

;; enable flyspell
(add-to-list 'exec-path "c:/Program Files (x86)/Aspell/bin/")
(setq ispell-program-name "aspell.exe")
(setq text-mode-hook '(lambda() (flyspell-mode 1)))

;; emacs soft text wrapping
(global-visual-line-mode 1)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'text-mode-hook
	  '(lambda() (set-fill-column 80)))

;; markdown mode hooks
(add-hook 'markdown-mode-hook
	  '(lambda()
	     (set (make-local-variable 'company-backends) '(company-dabbrev))
	     (linum-mode -1) ;; There is a bug in olivetti that does not work with this mode
	     (olivetti-mode 1)
	     (flyspell-mode 1)
	     (visual-fill-column-mode 1)))

;; Org mode setting
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
             ("NEXT" :foreground "blue" :weight bold)
             ("DONE" :foreground "sea green" :weight bold)
             ("WAITING" :foreground "orange" :weight bold)
             ("HOLD" :foreground "magenta" :weight bold)
             ("CANCELED" :foreground "purple" :weight bold)
             ("MEETING" :foreground "tomato" :weight bold)
             ("PHONE" :foreground "forest green" :weight bold))))


