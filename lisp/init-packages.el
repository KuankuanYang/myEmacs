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
		      ;; --- Major Mode ---
		      ;;js2-mode
		      ;; --- Minor Mode ---
		      ;;nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;;solarized-theme
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

;;-------------------------------------------------------------------------------------------------

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

(provide 'init-packages)
