;;; org-roam-timestamps-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-roam-timestamps" "org-roam-timestamps.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from org-roam-timestamps.el

(defvar org-roam-timestamps-mode nil "\
Non-nil if Org-Roam-Timestamps mode is enabled.
See the `org-roam-timestamps-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `org-roam-timestamps-mode'.")

(custom-autoload 'org-roam-timestamps-mode "org-roam-timestamps" nil)

(autoload 'org-roam-timestamps-mode "org-roam-timestamps" "\
Automatically add creation and modification timestamps to org-roam nodes.

If called interactively, enable Org-Roam-Timestamps mode if ARG
is positive, and disable it if ARG is zero or negative.  If
called from Lisp, also enable the mode if ARG is omitted or nil,
and toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "org-roam-timestamps" '("org-roam-timestamps-")))

;;;***

;;;### (autoloads nil nil ("org-roam-timestamps-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-roam-timestamps-autoloads.el ends here
