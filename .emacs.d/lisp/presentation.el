;;; -*- lexical-binding: t -*-

(defun presentation-prev-page ()
  (interactive)
  (end-of-buffer)
  (narrow-to-page -1)
  (beginning-of-buffer))

(defun presentation-next-page ()
  (interactive)
  (beginning-of-buffer)
  (narrow-to-page 1)
  (beginning-of-buffer))

(provide 'presentation)
