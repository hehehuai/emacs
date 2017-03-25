(require 'cl)

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
)

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
				   popwin
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

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


(global-hungry-delete-mode)




;; smartparens-global-mode is autoload not need ;;(require 'smartparens-config)
;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)


(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

(global-company-mode t)

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode 1)

(provide 'init-packages)
