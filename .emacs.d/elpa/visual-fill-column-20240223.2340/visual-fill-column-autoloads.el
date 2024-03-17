;;; visual-fill-column-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "visual-fill-column" "visual-fill-column.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from visual-fill-column.el

(autoload 'visual-fill-column-mode "visual-fill-column" "\
Soft-wrap lines according to `fill-column'.
This minor mode narrows the text area.  Its primary use is in
conjunction with `visual-line-mode', to enable soft word-wrapping
of long lines, but it can also be used in other contexts, e.g.,
to center the text in a window.  To activate it together with
`visual-line-mode', it is usually best to use
`visual-line-fill-column-mode'.

This is a minor mode.  If called interactively, toggle the
`Visual-Fill-Column mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `visual-fill-column-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(put 'global-visual-fill-column-mode 'globalized-minor-mode t)

(defvar global-visual-fill-column-mode nil "\
Non-nil if Global Visual-Fill-Column mode is enabled.
See the `global-visual-fill-column-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-visual-fill-column-mode'.")

(custom-autoload 'global-visual-fill-column-mode "visual-fill-column" nil)

(autoload 'global-visual-fill-column-mode "visual-fill-column" "\
Toggle Visual-Fill-Column mode in all buffers.
With prefix ARG, enable Global Visual-Fill-Column mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Visual-Fill-Column mode is enabled in all buffers where
`turn-on-visual-fill-column-mode' would do it.

See `visual-fill-column-mode' for more information on
Visual-Fill-Column mode.

\(fn &optional ARG)" t nil)

(autoload 'visual-line-fill-column-mode "visual-fill-column" "\
Enable `visual-line-mode' and soft-wrap lines according to `fill-column'.
Use this mode to activate and deactivate `visual-line-mode' and
`visual-fill-column-mode' in conjunction.

This is a minor mode.  If called interactively, toggle the
`Visual-Line-Fill-Column mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `visual-line-fill-column-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(autoload 'visual-fill-column-split-window-sensibly "visual-fill-column" "\
Split WINDOW sensibly, unsetting its margins first.
This function unsets the window margins and calls
`split-window-sensibly'.

By default, `split-window-sensibly' does not split a window in
two side-by-side windows if it has wide margins, even if there is
enough space for a vertical split.  This function is used as the
value of `split-window-preferred-function' to allow
`display-buffer' to split such windows.

\(fn &optional WINDOW)" nil nil)

(register-definition-prefixes "visual-fill-column" '("turn-on-visual-fill-column-mode" "visual-fill-column-"))

;;;***

;;;### (autoloads nil nil ("visual-fill-column-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; visual-fill-column-autoloads.el ends here
