
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
)
(require 'cl)


(defvar  zilongshanren/packages '(
				   company
				   monokai-theme
				   hungry-delete				   
				   swiper
				   counsel
				   smartparens
				   js2-mode
				   nodejs-repl
				   exec-path-from-shell
		     ) "Default packages")

(defun zilongshanren/packages-installed-p ()
  (loop for pkg in zilongshanren/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (zilongshanren/packages-installed-p)
  (message "%s" "Refreshing package database")
  (package-refresh-contents)
  (dolist (pkg zilongshanren/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(load-theme 'monokai t)
(require 'hungry-delete)
(global-hungry-delete-mode)

(global-company-mode t)

(global-hl-line-mode t)

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)

(setq inhibit-splash-screen t)
(global-linum-mode t)

(tool-bar-mode -1)
(scroll-bar-mode -1)

(delete-selection-mode t)

(setq initial-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(global-auto-revert-mode t)

(require 'org)
(setq org-src-fontify-natively t)


;; open recent file.
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq make-backup-files nil)
(setq auto-save-default nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


(require 'smartparens-config)
;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'nodejs-repl)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
