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

(provide 'init-better-defaults)
