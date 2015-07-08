;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (htmlize-many-files-dired htmlize-many-files htmlize-file
;;;;;;  htmlize-region htmlize-buffer) "htmlize/htmlize" "htmlize/htmlize.el"
;;;;;;  (21908 44429 616146 631000))
;;; Generated autoloads from htmlize/htmlize.el

(autoload 'htmlize-buffer "htmlize/htmlize" "\
Convert BUFFER to HTML, preserving colors and decorations.

The generated HTML is available in a new buffer, which is returned.
When invoked interactively, the new buffer is selected in the current
window.  The title of the generated document will be set to the buffer's
file name or, if that's not available, to the buffer's name.

Note that htmlize doesn't fontify your buffers, it only uses the
decorations that are already present.  If you don't set up font-lock or
something else to fontify your buffers, the resulting HTML will be
plain.  Likewise, if you don't like the choice of colors, fix the mode
that created them, or simply alter the faces it uses.

\(fn &optional BUFFER)" t nil)

(autoload 'htmlize-region "htmlize/htmlize" "\
Convert the region to HTML, preserving colors and decorations.
See `htmlize-buffer' for details.

\(fn BEG END)" t nil)

(autoload 'htmlize-file "htmlize/htmlize" "\
Load FILE, fontify it, convert it to HTML, and save the result.

Contents of FILE are inserted into a temporary buffer, whose major mode
is set with `normal-mode' as appropriate for the file type.  The buffer
is subsequently fontified with `font-lock' and converted to HTML.  Note
that, unlike `htmlize-buffer', this function explicitly turns on
font-lock.  If a form of highlighting other than font-lock is desired,
please use `htmlize-buffer' directly on buffers so highlighted.

Buffers currently visiting FILE are unaffected by this function.  The
function does not change current buffer or move the point.

If TARGET is specified and names a directory, the resulting file will be
saved there instead of to FILE's directory.  If TARGET is specified and
does not name a directory, it will be used as output file name.

\(fn FILE &optional TARGET)" t nil)

(autoload 'htmlize-many-files "htmlize/htmlize" "\
Convert FILES to HTML and save the corresponding HTML versions.

FILES should be a list of file names to convert.  This function calls
`htmlize-file' on each file; see that function for details.  When
invoked interactively, you are prompted for a list of files to convert,
terminated with RET.

If TARGET-DIRECTORY is specified, the HTML files will be saved to that
directory.  Normally, each HTML file is saved to the directory of the
corresponding source file.

\(fn FILES &optional TARGET-DIRECTORY)" t nil)

(autoload 'htmlize-many-files-dired "htmlize/htmlize" "\
HTMLize dired-marked files.

\(fn ARG &optional TARGET-DIRECTORY)" t nil)

;;;***

;;;### (autoloads (o-blog-publish-async o-blog-publish) "o-blog/lisp/o-blog"
;;;;;;  "o-blog/lisp/o-blog.el" (21908 44463 352147 914000))
;;; Generated autoloads from o-blog/lisp/o-blog.el

(autoload 'o-blog-publish "o-blog/lisp/o-blog" "\
Publish FILE using o-blog BACKEND.

If FILE is not provided, try to guess FILE and BACKEND from
current buffer.

\(fn &optional FILE BACKEND)" t nil)

(autoload 'o-blog-publish-async "o-blog/lisp/o-blog" "\
Publish FILE synchronously using BACKEND.

\(fn FILE)" nil nil)

;;;***

;;;### (autoloads (ob:gettext) "o-blog/lisp/o-blog-i18n" "o-blog/lisp/o-blog-i18n.el"
;;;;;;  (21908 44463 348147 914000))
;;; Generated autoloads from o-blog/lisp/o-blog-i18n.el

(autoload 'ob:gettext "o-blog/lisp/o-blog-i18n" "\
Return part of `o-blog-i18n' that matches TEXT in LANG.

If LANG is not defined, the blog \"#+LANGUAGE:\" header would be
used. If not found, English (en) is used as a fall-back.

\(fn TEXT &optional LANG)" nil nil)

;;;***

;;;### (autoloads nil nil ("o-blog/lisp/o-blog-backend-markdown.el"
;;;;;;  "o-blog/lisp/o-blog-backend-org.el" "o-blog/lisp/o-blog-backend.el"
;;;;;;  "o-blog/lisp/o-blog-entry.el" "o-blog/lisp/o-blog-framework.el"
;;;;;;  "o-blog/lisp/o-blog-obsolete.el" "o-blog/lisp/o-blog-tag.el"
;;;;;;  "o-blog/lisp/o-blog-utils.el") (21908 44463 974144 829000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
