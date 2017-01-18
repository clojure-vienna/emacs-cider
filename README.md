# Emacs for Clojure

This configuration is part of the `Emacs for Clojure` presentation for
clojure-vienna.

## Usage

Either place `.emacs.d` inside you home directory or start emacs with
an alternative home directory:

    env HOME=/path/to/emacs-clojure-vienna emacs

Depending on your distribution, you might also have to copy your
`.Xauthority` file into this directory.

## Emacs terminology

- Buffer : Content holder, can be associated with a file
- Window : Pane in a frame (split)
- Frame  : An os-level Emacs window

## Emacs essential shortcuts

`C-` means hold `Ctrl` key, `M-` means hold `Alt` key.

For terminals not forwarding Alt, you can simulate `M-` by prefix
pressing `ESC`.

- General
  - C-g : Emacs' escape
  - M-x : Command prompt
  - C-l : Recenter window
  - C-x C-c : Quit Emacs
  - C-x C-f : Find file (open)
  - C-x C-s : Save file
  - C-x C-w : Write file (save-as)
  - C-/ : undo
  - M-x customize-{group,variable} : use Emacs' customization system
  - C-] : escape recursive edit (elisp debugger)

- Movement / Navigation
  - C-r, C-s : Search forward, Search backward
  - C-b, C-p, C-f, C-n : ←, ↑, →, ↓
  - M-v, C-v : PgUp ⇞, PgDwn ⇟
  - C-M-<, C-M-> : Home ↖, End ↘

## Emacs essential shortcuts, second page (sorry)

- Help
  - C-h f : describe-function
  - C-h k : describe-key
  - C-h v : describe-variable

- Buffer Management
  - C-x b : switch-buffer
  - C-x C-b : list buffers

- Window Management
  - C-x 0 : Close this window
  - C-x 1 : Close all other windows
  - C-x 2 : Split vertical
  - C-x 3 : Split horizontal
  - C-x o : Cycle through windows
  - q : in many read-only buffers, this closes the popup window

## Elisp

`;;; -*- lexical-binding: t -*-`

### Package Management

If your distro doesn't provide (m)elpa packages (most don't), use
Emacs' builtin package manager to install and update your packages.

First thing, you'll want to do is to add melpa as a package source:

    M-x customize-variable
	package-archives
	Archive name: melpa
	URL: http://melpa.milkbox.net/packages/

Then invoke `M-x list-packages` and install the packages we need for
the presentation.

- Key Bindings
  - i : mark for installation
  - d : mark for deletion
  - u : unmark
  - x : execute

- Required packages
  - cider
  - clojure-mode
  - clj-refactor
  - paredit
  - rainbow-delimiters

### Working with Elisp

- M-: : eval-expression
- C-M-x : eval-defun
- M-x eval-buffer
- M-x toggle-debug-on-error
- M-x ielm

See `Help` keybindings above on how to browse documentation.

## Clojure + Emacs


## Emacs Tips & Tricks

Use magit as a git frontend.

Use smex as an `M-x` replacement.

Use org-mode for organizing your thoughts, project planning and time
tracking.
