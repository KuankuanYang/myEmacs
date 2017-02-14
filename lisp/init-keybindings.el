;; 所有快捷键绑定内容

;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 这个快捷键绑定可以用之后的插件 counsel 代替
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; 快捷键绑定
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

;; 配置 counsel 和 swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

;; 绑定 counsel-git
(global-set-key (kbd "C-c g f") 'counsel-git)

;; 绑定 indent-region-or-buffer
(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; 绑定 hippie-expand（自动补全)
(global-set-key (kbd "s-/") 'hippie-expand)

;; 主动加载 Dired Mode
;;(require 'dired)
;;(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;; 绑定 reveal-in-osx-finder
(global-set-key (kbd "C-c z") 'reveal-in-osx-finder)

(provide 'init-keybindings)
