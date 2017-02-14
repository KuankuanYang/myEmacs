;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-func)
(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-keybindings)
(require 'init-org)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

;;;;;;;;;;;;;;;;;
;;auctex
;;;;;;;;;;;;;;;;;
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(mapc (lambda (mode)
	(add-hook 'LaTeX-mode-hook mode))
      (list 'auto-complete-mode
	    'auto-fill-mode
	    'LaTeX-math-mode
	    'turn-on-reftex
	    'linum-mode))
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
					; set pdf view tool
(setq TeX-view-program-list '(("Evince" "evince %o")))
(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "SumatraPDF")
                                                 (output-dvi "Yap"))))))

 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Evince")
                                                 (output-dvi "Evince")))))))
					; XeLaTeX
(add-hook 'LaTeX-mode-hook (lambda()
			     (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
			     (setq TeX-command-default "XeLaTeX")
			     (setq TeX-save-query  nil )
			     (setq TeX-show-compilation t)
			     ))

