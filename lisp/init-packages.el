;; 所有与 package 相关的配置内容都放在该文件内


;; 将 melpa 设为软件源 
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar ykk/packages '(
		       ;; --- Auto-completion ---
		       company
		       ;; --- Better Editor ---
		       hungry-delete
		       swiper
		       counsel
		       smartparens
		       popwin
		       ;;ac-php ;; 安装需参考ac-php的GitHub页面
		       ;; --- Major Mode ---
		       web-mode
		       php-mode
		       ;;js2-mode
		       ;;auctex-latexmk
		       ;; --- Minor Mode ---
		       ;;nodejs-repl
		       exec-path-from-shell
		       ;; --- Themes ---
		       monokai-theme
		       ;;solarized-theme
		       ;; --- plug-in ----
		       reveal-in-osx-finder
		       ) "Default packages")

(setq package-selected-packages ykk/packages)

(defun ykk/packages-installed-p ()
  (loop for pkg in ykk/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (ykk/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg ykk/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; --------------------------------------------------------------------------

;; 开启全局 Company 补全
(global-company-mode 1)

;; 配置 hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;; 配置 counsel 和 swiper
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;; 配置 smartparens
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;; (smartparens-global-mode t)

;; 配置 popwin
(require 'popwin)
(popwin-mode 1)

;; 载入主题 monokai
(load-theme 'monokai t)

;; 配置 auctex-latexmk
;;(require 'auctex-latexmk)
;;(auctex-latexmk-setup)

;; 配置 reveal-in-osx-finder
;; To load at the start up
(require 'reveal-in-osx-finder)

;; 配置 php-mode
(eval-after-load 'php-mode
  '(require 'php-ext))

;; 配置 ac-php
;;(add-hook 'php-mode-hook
;;            '(lambda ()
;;               (auto-complete-mode t)
;;               (require 'ac-php)
;;               (setq ac-sources  '(ac-source-php ) )
;;               (yas-global-mode 1)
;;               (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
;;               (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
;;               ))

;; 配置 web-mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Using web-mode for editing plain HTML files
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;; --------------------------------------------------------------------------
(provide 'init-packages)
