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

(defun indent-buffer()
  "indent the currently visited buffer"
  (interactive)
  (indent-region (point-min) (point-max))
)
(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	    (progn
	      (indent-region (region-beginning) (region-end))
	      (message "indented selected region."))
        (progn
	        (indent-buffer)
	        (message "Indented buffer."))
    )
   )
)
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)


(fset 'yes-or-no-p 'y-or-n-p)


(put 'dired-find-alternate-file 'disabled nil)

(require 'dired-x)


(setq dired-dwim-target t)

(provide 'init-better-defaults)
