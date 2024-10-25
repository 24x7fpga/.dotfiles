;;; elpaca-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "elpaca" "elpaca.el" (0 0 0 0))
;;; Generated autoloads from elpaca.el

(autoload 'elpaca-menu-item "elpaca" "\
Return menu item matching SYMBOL in ITEMS or `elpaca-menu-functions' cache.
If INTERACTIVE is non-nil or SYMBOL is t, prompt for item.

\(fn SYMBOL &optional ITEMS INTERACTIVE)" t nil)

(autoload 'elpaca-update-menus "elpaca" "\
Update all menus in MENUS or `elpaca-menu-functions'.
When called interactively with \\[universal-argument] update all menus.

\(fn &rest MENUS)" t nil)

(autoload 'elpaca-recipe "elpaca" "\
Return recipe computed from ORDER.
ORDER is any of the following values:
  - nil. The order is prompted for.
  - an item symbol, looked up in ITEMS or `elpaca-menu-functions' cache.
  - an order list of the form: \\='(ITEM . PROPS).
When INTERACTIVE is non-nil, `yank' the recipe to the clipboard.

\(fn ORDER &optional ITEMS INTERACTIVE)" t nil)

(autoload 'elpaca-split-queue "elpaca" "\
Split remaining elpacas into new queue with ARGS.

\(fn &rest ARGS)" nil nil)

(autoload 'elpaca-queue "elpaca" "\
Execute BODY in new queue.

\(fn &rest BODY)" nil t)

(defvar elpaca-no-symlink-mode nil "\
Non-nil if Elpaca-No-Symlink mode is enabled.
See the `elpaca-no-symlink-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `elpaca-no-symlink-mode'.")

(custom-autoload 'elpaca-no-symlink-mode "elpaca" nil)

(autoload 'elpaca-no-symlink-mode "elpaca" "\
Global minor mode which installs build files by copying.

If called interactively, enable Elpaca-No-Symlink mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'elpaca-dependencies "elpaca" "\
Return recursive list of ITEM's dependencies.
IGNORE may be a list of symbols which are not included in the resulting list.
RECURSE is used to track recursive calls.
When INTERACTIVE is non-nil, message the list of dependencies.

\(fn ITEM &optional IGNORE INTERACTIVE RECURSE)" t nil)

(autoload 'elpaca-dependents "elpaca" "\
Return recursive list of packages which depend on ITEM.
When MESSAGE is non-nil, message the list of dependents.

\(fn ITEM &optional MESSAGE)" t nil)

(autoload 'elpaca "elpaca" "\
Queue ORDER for installation/activation, defer execution of BODY.
If ORDER is `nil`, defer BODY until orders have been processed.

\(fn ORDER &rest BODY)" nil t)

(function-put 'elpaca 'lisp-indent-function '1)

(autoload 'elpaca-wait "elpaca" "\
Block until currently queued orders are processed.
When quit with \\[keyboard-quit], running sub-processes are not stopped." nil nil)

(autoload 'elpaca-try "elpaca" "\
Try ORDER.
Install the repo/build files on disk.
Activate the corresponding package for the current session.
ORDER's package is not made available during subsequent sessions.
When INTERACTIVE is non-nil, immediately process ORDER, otherwise queue ORDER.

\(fn ORDER &optional INTERACTIVE)" t nil)

(autoload 'elpaca-process-queues "elpaca" "\
Process the incomplete queues.
FILTER must be a unary function which accepts and returns a queue list.

\(fn &optional FILTER)" nil nil)

(autoload 'elpaca-delete "elpaca" "\
Remove a package associated with ITEM from cache and disk.
If DEPS is non-nil (interactively with \\[universal-argument]) delete dependencies.
If FORCE is non-nil (interactively with \\[universal-argument] \\[universal-argument])
do not confirm before deleting package and DEPS.

\(fn ITEM &optional FORCE DEPS IGNORED)" t nil)

(autoload 'elpaca-rebuild "elpaca" "\
Rebuild ITEM's associated package.
When INTERACTIVE is non-nil, prompt for ITEM, immediately process.
With a prefix argument, rebuild current file's package or prompt if none found.

\(fn ITEM &optional INTERACTIVE)" t nil)

(autoload 'elpaca-fetch "elpaca" "\
Fetch ITEM's associated package remote commits.
This does not merge changes or rebuild the packages.
If INTERACTIVE is non-nil immediately process, otherwise queue.

\(fn ITEM &optional INTERACTIVE)" t nil)

(autoload 'elpaca-fetch-all "elpaca" "\
Fetch queued elpaca remotes. If INTERACTIVE is non-nil, process queues.

\(fn &optional INTERACTIVE)" t nil)

(autoload 'elpaca-update "elpaca" "\
Update ITEM's associated package.
If INTERACTIVE is non-nil, the queued order is processed immediately.

\(fn ITEM &optional INTERACTIVE)" t nil)

(autoload 'elpaca-update-all "elpaca" "\
Update all queued packages. If INTERACTIVE is non-nil, process queues.

\(fn &optional INTERACTIVE)" t nil)

(autoload 'elpaca-with-dir "elpaca" "\
Set `default-directory' for duration of BODY.
TYPE is either `repo' or `build' for ITEM's repo or build directory.

\(fn ITEM TYPE &rest BODY)" nil t)

(function-put 'elpaca-with-dir 'lisp-indent-function '2)

(autoload 'elpaca-visit "elpaca" "\
Open ITEM's local repository directory.
When BUILD is non-nil visit ITEM's build directory.

\(fn &optional ITEM BUILD)" t nil)

(autoload 'elpaca-browse "elpaca" "\
Browse ITEM's :url.

\(fn ITEM)" t nil)

(autoload 'elpaca-version "elpaca" "\
Return Elpaca version information string.
OUTPUT may be any of the following:
  - nil Return raw alist of form ((category . info) ...)
  - `string' Return formmatted string.
  - `message' (used when called interactively) to message formatted string.

\(fn &optional OUTPUT)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca" '("elpaca")))

;;;***

;;;### (autoloads nil "elpaca-info" "elpaca-info.el" (0 0 0 0))
;;; Generated autoloads from elpaca-info.el

(autoload 'elpaca-info "elpaca-info" "\
Display package info for ITEM from SOURCE in a dedicated buffer.

\(fn ITEM &optional SOURCE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-info" '("elpaca-")))

;;;***

;;;### (autoloads nil "elpaca-log" "elpaca-log.el" (0 0 0 0))
;;; Generated autoloads from elpaca-log.el

(autoload 'elpaca-log-defaults "elpaca-log" "\
Return contextual logging queries." nil nil)

(autoload 'elpaca-log "elpaca-log" "\
Display `elpaca-log-buffer' filtered by QUERY.

\(fn &optional QUERY)" t nil)

(autoload 'elpaca-status "elpaca-log" "\
Log most recent events for packages." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-log" '("elpaca-log-")))

;;;***

;;;### (autoloads nil "elpaca-manager" "elpaca-manager.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from elpaca-manager.el

(autoload 'elpaca-manager "elpaca-manager" "\
Display elpaca's package management UI.
If RECACHE is non-nil, recompute menu items from `elpaca-menu-functions'.

\(fn &optional RECACHE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-manager" '("elpaca-manager-")))

;;;***

;;;### (autoloads nil "elpaca-menu-elpa" "elpaca-menu-elpa.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from elpaca-menu-elpa.el

(autoload 'elpaca-menu-gnu-elpa "elpaca-menu-elpa" "\
Fulfill GNU ELPA menu `index` or `update` REQUEST.

\(fn REQUEST)" nil nil)

(autoload 'elpaca-menu-gnu-devel-elpa "elpaca-menu-elpa" "\
Fulfill GNU ELPA-devel menu `index` or `update` REQUEST.

\(fn REQUEST)" nil nil)

(autoload 'elpaca-menu-non-gnu-elpa "elpaca-menu-elpa" "\
Fulfill menu NonGNU ELPA `index` or `update` REQUEST.

\(fn REQUEST)" nil nil)

(autoload 'elpaca-menu-non-gnu-devel-elpa "elpaca-menu-elpa" "\
Fulfill menu NonGNU ELPA-devel `index` or `update` REQUEST.

\(fn REQUEST)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-menu-elpa" '("elpaca-menu-")))

;;;***

;;;### (autoloads nil "elpaca-menu-melpa" "elpaca-menu-melpa.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from elpaca-menu-melpa.el

(autoload 'elpaca-menu-melpa "elpaca-menu-melpa" "\
Delegate REQUEST.
If REQUEST is `index`, return a recipe candidate alist.
If REQUEST is `update`, update the MELPA recipe cache.

\(fn REQUEST)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-menu-melpa" '("elpaca-menu-melpa--")))

;;;***

;;;### (autoloads nil "elpaca-menu-org" "elpaca-menu-org.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from elpaca-menu-org.el

(autoload 'elpaca-menu-org "elpaca-menu-org" "\
If REQUEST is `index`, return Org recipe candidate list.

\(fn REQUEST)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-menu-org" '("elpaca-menu-org--")))

;;;***

;;;### (autoloads nil "elpaca-process" "elpaca-process.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from elpaca-process.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-process" '("elpaca-")))

;;;***

;;;### (autoloads nil "elpaca-test" "elpaca-test.el" (0 0 0 0))
;;; Generated autoloads from elpaca-test.el

(autoload 'elpaca-test-log "elpaca-test" "\
Print `elpaca-log' QUERIES.

\(fn &rest QUERIES)" nil nil)

(autoload 'elpaca-test-timeout "elpaca-test" "\
Cancel pending orders." nil nil)

(autoload 'elpaca-test "elpaca-test" "\
Test Elpaca in a clean environment.
BODY is a plist which allows multiple values for certain keys.
The following keys are recognized:
  :name description of the test

  :ref git ref to check out or `local' to use local copy in current repo state

  :dir `user-emacs-directory' name.
    Expanded in temporary filedirectory if it is a relative path or nil.
    Otherwise, the absolute file path is used.

  :init `user', (:file \"path/to/init.el\") or forms...
    Content of the init.el file.
    `user' is shorthand for `user-emacs-diretory'/init.el.

  :early-init Content of the init.el file. Accepts same args as :init.

  :interactive t or nil. When non-nil, start an interactive Emacs session.

  :args String... Emacs subprocess command line args

  :keep t or nil. When non-nil, prevent test environment deletion after test

  :timeout N. A number or seconds to wait for package installations to complete.
              Pending orders are failed after this time.

\(fn &rest BODY)" nil t)

(function-put 'elpaca-test 'lisp-indent-function '0)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-test" '("elpaca-")))

;;;***

;;;### (autoloads nil "elpaca-ui" "elpaca-ui.el" (0 0 0 0))
;;; Generated autoloads from elpaca-ui.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "elpaca-ui" '("elpaca-")))

;;;***

(provide 'elpaca-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; elpaca-autoloads.el ends here
