;;; org-clock-today-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "org-clock-today" "org-clock-today.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from org-clock-today.el

(defvar org-clock-today-mode nil "\
Non-nil if Org-Clock-Today mode is enabled.
See the `org-clock-today-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `org-clock-today-mode'.")

(custom-autoload 'org-clock-today-mode "org-clock-today" nil)

(autoload 'org-clock-today-mode "org-clock-today" "\
Minor mode to show the total clocked time of the current day in the mode line.

This is a minor mode.  If called interactively, toggle the
`Org-Clock-Today mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='org-clock-today-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "org-clock-today" '("org-clock-today-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-clock-today-autoloads.el ends here
