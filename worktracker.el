(defun get--activity ()
  "return a suggestion for the current activity, based on the file extension
 of the currently open file"
  (if (stringp (buffer-file-name))
      (let ((ext (file-name-extension (buffer-file-name))))
           (cond ((equal ext "el") "emacs")
                 ((equal ext "rs") "rust")
                 ((equal ext "py") "python")
                 ((equal ext "gd") "godot")
                 (t "none")))
    "none"))


(defun worktracker--status ()
  "return worktracker status as a string"
  (shell-command-to-string "worktracker --status"))


(defun worktracker-start (activity)
  "start tracking an activity"
  (interactive
   (list (read-string (format "start tracking [%s]: " (get--activity)) nil nil (get--activity))))

  (message
   (shell-command-to-string
    (concat "worktracker --start " "\"" activity "\""))))


(defun worktracker-stop ()
  "stop tracking"
  (interactive)
  (message
   (shell-command-to-string "worktracker --stop")))


(defun worktracker-today ()
  "print time worked today"
  (interactive)
  (message
   (shell-command-to-string "worktracker --today")))


(defun worktracker-status ()
  "print worktracker status"
  (interactive)
  (message (worktracker--status)))
