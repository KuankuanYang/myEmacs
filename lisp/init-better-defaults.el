;; 优化已有功能的配置

;; 关闭声音
(setq ring-bell-function 'ignore)

;; 关闭自动备份
(setq make-backup-files nil)

;; 选中一段文字输入一个字符会替换掉被选中部分的文字
(delete-selection-mode 1)

;; 显示行号
(global-linum-mode 1)

;; 自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 缩写
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; example
					    ;;("1test" "testtest")
					    ))

;; 最近文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 高亮当前行
(global-hl-line-mode 1)

;; 重新缩进全部缓冲区的代码
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; 增强 Hippie Expand 的功能
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

;; 将询问时候的 yes 或 no 改为 y 或 n
(fset 'yes-or-no-p 'y-or-n-p)

;; 使用 dired 删除和拷贝时，默认对整个文件夹递归操作
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 使用 C-x C-j 打开当前文件的目录
(require 'dired-x)

;; 分屏时快速拷贝文件
(setq dired-dwim-target t)

;; 光标在括号内时高亮包含内容的两个括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; 所有buffer默认使用4格缩进
;;(setq-default tab-width 4)

;; php-mode 设置缩进为4个空格，关闭html的支持并使用subword-mode
(defun bs-php-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq php-template-compatibility nil)
  (subword-mode 1))
(add-hook 'php-mode-hook 'bs-php-mode-hook)

(provide 'init-better-defaults)
