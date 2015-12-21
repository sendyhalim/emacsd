;; El-Get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")

;; Packages
(el-get-bundle evil
  (evil-mode 1))

(el-get-bundle neotree
  (global-set-key [f8] 'neotree-toggle))

(el-get-bundle multiple-cursors)

(el-get-bundle flycheck)

(el-get-bundle emacs-powerline
  (setq powerline-arrow-shape 'arrow))

;; General configs
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox t)

;; Define keybindings
(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
            (lambda ()
              (interactive)
              (evil-delete (point-at-bol) (point))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9e8cee2fa4014ffcfb646fdd44145ad32702b32f8d48ec2b62bc65d8d3ee68ac" "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855" "cb5bcb85acf20642c4b4636de92ac45c029f66fe58d46fd78d965c3b95287e10" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
