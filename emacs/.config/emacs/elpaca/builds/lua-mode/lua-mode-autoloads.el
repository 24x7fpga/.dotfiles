;;; lua-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "lua-mode" "lua-mode.el" (0 0 0 0))
;;; Generated autoloads from lua-mode.el

(autoload 'lua-mode "lua-mode" "\
Major mode for editing Lua code.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-mode))

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(defalias 'run-lua #'lua-start-process)

(autoload 'lua-start-process "lua-mode" "\
Start a Lua process named NAME, running PROGRAM.
PROGRAM defaults to NAME, which defaults to `lua-default-application'.
When called interactively, switch to the process buffer.

\(fn &optional NAME PROGRAM STARTFILE &rest SWITCHES)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "lua-mode" '("lua-")))

;;;***

(provide 'lua-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; lua-mode-autoloads.el ends here
