(defun get--activity ()
  (if (stringp (buffer-file-name))
      (progn
        (setq ext (file-name-extension (buffer-file-name)))
        (cond ((equal ext "el") "emacs")
              ((equal ext "rs") "rust")
              ((equal ext "py") "python")
              ((equal ext "gd") "godot")
              (t "none")))
    "none"))


(defun worktracker-start (word)
  (interactive
   (list (read-string (format "start tracking [%s]: " (get--activity)) nil nil (get--activity))))

  (message
   (shell-command-to-string
    (concat "worktracker --start " word))))


(defun worktracker-stop ()
  (interactive)
  (message
   (shell-command-to-string "worktracker --stop")))
