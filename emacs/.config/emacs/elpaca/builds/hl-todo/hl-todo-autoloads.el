;;; hl-todo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "hl-todo" "hl-todo.el" (0 0 0 0))
;;; Generated autoloads from hl-todo.el

(autoload 'hl-todo-mode "hl-todo" "\
Highlight TODO and similar keywords in comments and strings.

If called interactively, enable Hl-Todo mode if ARG is positive,
and disable it if ARG is zero or negative.  If called from Lisp,
also enable the mode if ARG is omitted or nil, and toggle it if
ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'global-hl-todo-mode 'globalized-minor-mode t)

(defvar global-hl-todo-mode nil "\
Non-nil if Global Hl-Todo mode is enabled.
See the `global-hl-todo-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-hl-todo-mode'.")

(custom-autoload 'global-hl-todo-mode "hl-todo" nil)

(autoload 'global-hl-todo-mode "hl-todo" "\
Toggle Hl-Todo mode in all buffers.
With prefix ARG, enable Global Hl-Todo mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hl-Todo mode is enabled in all buffers where
`hl-todo--turn-on-mode-if-desired' would do it.
See `hl-todo-mode' for more information on Hl-Todo mode.

\(fn &optional ARG)" t nil)

(autoload 'hl-todo-next "hl-todo" "\
Jump to the next TODO or similar keyword.
The prefix argument ARG specifies how many keywords to move.
A negative argument means move backward that many keywords.

\(fn ARG)" t nil)

(autoload 'hl-todo-previous "hl-todo" "\
Jump to the previous TODO or similar keyword.
The prefix argument ARG specifies how many keywords to move.
A negative argument means move forward that many keywords.

\(fn ARG)" t nil)

(autoload 'hl-todo-occur "hl-todo" "\
Use `occur' to find all TODO or similar keywords.
This actually finds a superset of the highlighted keywords,
because it uses a regexp instead of a more sophisticated
matcher.  It also finds occurrences that are not within a
string or comment." t nil)

(autoload 'hl-todo-rgrep "hl-todo" "\
Use `rgrep' to find all TODO or similar keywords.
This actually finds a superset of the highlighted keywords,
because it uses a regexp instead of a more sophisticated
matcher.  It also finds occurrences that are not within a
string or comment.  See `rgrep' for the meaning of REGEXP,
FILES, DIR and CONFIRM, except that the type of prefix
argument does not matter; with any prefix you can edit the
constructed shell command line before it is executed.
Also see option `hl-todo-keyword-faces'.

\(fn REGEXP &optional FILES DIR CONFIRM)" t nil)

(autoload 'hl-todo-flymake "hl-todo" "\
Flymake backend for `hl-todo-mode'.
Diagnostics are reported to REPORT-FN.  Use `add-hook' to
register this function in `flymake-diagnostic-functions' before
enabling `flymake-mode'.

\(fn REPORT-FN &rest PLIST)" nil nil)

(autoload 'hl-todo-insert "hl-todo" "\
Insert TODO or similar keyword.
If point is not inside a string or comment, then insert a new
comment.  If point is at the end of the line, then insert the
comment there, otherwise insert it as a new line before the
current line.  When called interactively the KEYWORD is read via
`completing-read'.

\(fn KEYWORD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "hl-todo" '("hl-todo-")))

;;;***

(provide 'hl-todo-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; hl-todo-autoloads.el ends here
