;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

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

(el-get-bundle smooth-scrolling)

(el-get-bundle company-mode
  (company-mode 1))

(el-get-bundle emacs-powerline)
(setq powerline-arrow-shape 'arrow)

;; ------------------------------------------
;; Functions
;; ------------------------------------------
(defun paste-from-clipboard()
  (interactive)
  (setq x-select-enable-clipboard)
  (yank)
  (setq x-select-enable-clipboard nil))

(defun copy-to-clipboard()
  (interactive)
  (setq x-select-enable-clipboard)
  (kill-ring-save (region-beginning) (region-end))
  (setq x-select-enable-clipboard nil))

;; ------------------------------------------
;; General configs
;; ------------------------------------------
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

(setq backup-directory-alist `(("." . "~/.Emacs-backup-files")))
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-emacs-directory))
(load-theme 'gruvbox t)

;; Hide toolbar
(tool-bar-mode 0)

;; ------------------------------------------
;; Keybindings
;; ------------------------------------------
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)

(define-key evil-normal-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-visual-state-map (kbd "H") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
(define-key evil-visual-state-map (kbd "L") 'evil-end-of-line)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))
