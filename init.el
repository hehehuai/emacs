(package-initialize)
(add-to-list 'load-path "~/.emacs.d/lisp")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))


(require 'init-packages)
(require 'init-ui)
(require 'init-org)
(require 'init-keybindings)
(require 'init-better-defaults)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;;(setq enable-recursive-minibuffers t)


;;(require 'nodejs-repl)

