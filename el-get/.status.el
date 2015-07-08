((2048\.el status "required" recipe nil)
 (el-get status "required")
 (htmlize status "installed" recipe
          (:type github :pkgname "emacsmirror/htmlize" :name htmlize :website "http://www.emacswiki.org/emacs/Htmlize" :description "Convert buffer text and decorations to HTML." :type emacsmirror :localname "htmlize.el"))
 (o-blog status "installed" recipe
         (:name o-blog :type github :description "Stand alone org-mode blog exporter." :load-path
                ("lisp")
                :pkgname "renard/o-blog" :depends htmlize)))
