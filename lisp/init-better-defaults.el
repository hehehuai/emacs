(setq ring-bell-function 'ignore)


(global-auto-revert-mode t)

(global-linum-mode t)


(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("kkk" "zilongshanren")
))


(setq make-backup-files nil)

(setq auto-save-default nil)


;; open recent file.
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(delete-selection-mode t)

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(provide 'init-better-defaults)
