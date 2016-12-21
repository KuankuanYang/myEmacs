;; 所有与 org-mode 相关的配置内容都放在该文件内


;; org 备注高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
