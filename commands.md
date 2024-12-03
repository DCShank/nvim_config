# Commands

This is intended to document my most used existing and new commands

My leader key is `<Space>`

## Existing Commands

Adding a record of vim commands that I use regularly, or want to remember to use.

A small number have been modified from standard vim -- movement commands are generally substituted with the g movement commands when it affects line wrapping. Esc has been made to exit terminal mode.

### Modes
`<Esc>` Exits all modes except normal and returns to normal.

`:` Enters command (ex) mode, from normal or visual mode.

`v` Enters visual mode from normal mode.

`V` Enters visual-line mode from normal mode.

`<Ctrl+V>` Enters visual-block mode from normal mode. Useful for mass commenting lines.

`i` Enters insert mode behind the current character from normal mode.

`I` Enters insert mode at beginning of line from normal mode.

`I` Enters insert mode in visual modes, but for visual-block mode enters insert mode at the start of the block on all lines selected.

`a` Enters insert (append) mode ahead of the current character from normal mode.

`A` Enters insert (append) mode at the end of the line from normal mode.

`A` Like `I` but appending for visual modes.

`R` Enter replace mode from normal mode.

`R` Delete selected lines and enter insert mode from visual modes.

### Movement

`h` Move left

`j` Move down

`k` Move up

`l` Move right


`0` Go to the first character on the line

`^` Go to the first non-blank character on the line

`|` Go to the nth character column. Default 1.

`f` Find a given character. `F` Reverses direction.

`t` Go until a given character. `T` Reverses direction.

`;` Repeat the last `f`, `F`, `t`, `T` command. `,` Reverses direction.


`G` Go to line N. Default last line.

`gg` Go to line N. Default first line.

`<Ctrl+O>` Go to last place you jumped from

`<Ctrl+D>` Go down half a window, or N lines.
`<Ctrl+F>` Go down (forward) N pages.

`<Ctrl+U>` Go up half a window, or N lines.
`<Ctrl+B>` Go up (back) N pages.

`zz` Center the current line. Also `z.`

`zt` Moves the current line to the top of the window. Also `z<CR>`

`zb` Moves the current line to the botton of the window. Also `z-`

#### Motions

`w` Moves forward N words to the start of a word, stopping on some punctuation.

`W` Move forward N words to the start of a word.

`e` Moves forward N words to the end of a word, stopping on some punctuation.

`E` Move forward N words to the end of a word.

`b` Move backward N words to the start of a word, stopping on some punctuation.

`B` Move backward N words to the start of a word.

`ge` Moves backward N words to the end of a word, stopping on some punctuation.

`gE` Move backward N words to the end of a word.

`%` Go to a matching pair character, like `[]` or `()`

`H` Go to the top of the screen, or N lines from the top. (High)

`M` Go to the middle of the screen. (Middle)

`L` Go to the bottom of the screen, or N lines from the bottom. (Low)

### Editing

`<Left>` Move left in insert mode.
`<Down>` Move down in insert mode.
`<Right>` Move right in insert mode.
`<Up>` Move up in insert mode.

The insert mode commands can take a number to write copies of the input. E.g. `5a` will copy whatever you write 5 times.

`d[Motion]` Deletes the moved across area.

`dd` Delete the current line N times, default 1. Stores into a register for pasting.

`D` Delete from the cursor to the end of the line. If combined with a number delete N lines after. Copies to a register for pasting.

`c[Motion]` Changes the moved area, cutting it and entering insert mode.

`cc` Changes N lines, cutting them and entering insert mode.

`C` Changes to the end of the line, cutting it and enterint insert mode. Same behavior as `D` and `Y` if a number greater than one is specified.

`s` Substitute N characters, enters insert mode

`S` Substitute N lines

`"[char]` Use `[char]` register for next yank/copy/delete/put. i.e. `"a`. 

`command :reg` Shows contents of registers

`y[Motion]` Yanks for the moved across area

`yy` Yanks the N lines for pasting.

`Y` Yanks from the current character to end of line for pasting.

`x` Cuts N characters forwards, default 1.

`X` Cuts N characters behind the cursor, default 1.

`p` Pastes the register after the current character. Default 1 times.

`P` Pastes the register before the current character. Default 1 times.

`]p` Like `p` but adjusts indentation to current line.

`[p` Like `P` but adjusts indentation to current line.

`~` change case for N characters, or in visual mode change case of highlighted text

`g~[Motion]` Change case for motion

`visual u` lowercase highlighted

`visual U` uppercase highlighted

`gu[Motion]` Lowercase for motion

`gU[Motion]` Uppercase for motion

`u` Undo

`<Ctrl+r>` Redo

`command :s` Substitute command. format is `[range]s/[regex to subtitute]/[replacement]/options`. Some helpful defaults to remember are `%` is the whole document, `g` option applies the substitute to all occurences on affected lines, and `\(\)` is used for backreferences in the search, and `\1` is used to reinsert in the output. the `1` would be swapped for the index of the substitution group. For more details I recommend the documentation.

`&` Repeat last substitutioni without range options on current line

`.` Repeat last change

`q[a-z]` Starts recording typed characters into register `[char]` for later execution. Exit recording by pressing `q` again

`q[A-Z]` like `q[char]` but appends instead of overwriting the register

`Q` Playback last recorded macro

`@[a-z]` Playback the macro in register `[a-z]` n times.

`@@` playback the last macro played from `@[a-z]`

`J` Combine line with below line

`visual J` Combine highlighted lines

`<<` Unindent text N times. Default 1.

`>>` Indent text N times. Default 1.

`visual [<< or >>]` Indent or unindent highligted text

### Searches

`/` Search forwards

`?` Search backwards

`n` Repeat last search

`N` Repeat last search in opposite direction

`*` Search forward for identifer under cursor

`#` Search backwards for identifer under cursor

`gd` Go to local declaration of identifier under cursor

`gD` Go to global declaration of identifier under cursor

`command :noh` Cancel current highlighting from searches

### Command Mode

`command :w` Write to disk

`command :q` Quit. `command :q!` to force

`command :wq` Writes and quits

`command :e [file]` Edit a file

`command :vs [file]` Creates a vertical split with file

`command :sp [file]` Creates a horizontal split with file

`command :tabnew [file]` Creates a new tab

### Mouse

The mouse mostly just works tbh

### Marks
`m` is used for a lot of marks stuff that I don't want to clobber

likewise for `\`` and `'`

## Personal Keybindings

### 

`<Ctrl+[hjkl]>` Move to split in corresponding direction

### Used Commands and Leaders

`abcdefghijklmonpqrstuvwxyz`
`ABCDEFGHIJLMNOPQRSTUVWXYZ`
`g+[dDeEguU~]`
`z+[btz.-<CR>]`
`[1-9]0`
`*#&.~%/?;:"|^<>`
`<Esc>`
`<Ctrl+[rBDFOUV]>`

### free basic characters:
`K`

## Plugins

### Filetree

I tried to match normal vim editing as much as possible

`<F2>` Toggle open/close filetree
`?` List keybindings

`<Space>` Open a file or directory, or close a directory. CD to parent directory
`i` Open a file or directory, or close a directory
`I` Open a file in a new tab
`a` Open a file in a vertical split
`A` Open a file in a horizontal split

`<CR>` Open a file, or CD into a directory
`-` CD to parent directory
`<BS>` Close directory

`o` Create a file or directory

`Y` Copy File (marks a file to be copied in the treesitter clipboard)

`yy` Copy the absolute path
`yp` Copy the absolute path
`yf` Copy the filename
`yr` Copy the relative path

`p` Paste a file from the clipboard

`d` Delete a file

`x` Cuts/marks a file to be moved

`r` Rename the basename. Excludes the extension from the rename
`R` Rename omitting the whole file name but including the absolute path

`m` Bookmark (mark) the file
`bm` Move bookmarked files
`bd` Delete bookmarked files

`zO` Expand all directories
`zM` Collapse all

`[g` Git previous
`]g` Git next

TODO Add git integration stuff possibly
Add file to git index (ga)
Remove file from git index (gr)
Git checkout (gc)
Git commit (gw)
Git pull (gp)
Git push (gP)
Git fetch (gf)
Git checkout branch (gb -> git checkout -b)

TODO add remaining filtering commands. Leader for filters is `f`
Toggle Filter: Dotfiles () 
Toggle Filter: Git Ignore ()

### Other plugins

#### Auto complete

`<Tab>` Go to next suggested item
`<S-Tab>` Go to previous suggested item
`<Ctrl-F>`Scroll completion docs
`<Ctrl-Shift-F>`Scroll completion docs backward
`<Ctrl-Space>`Bring up completion menu at current cursor

Exit suggestion menu
`<Enter>`confirm suggestion

#### Colorpicker

no keybindings -- use directly from command mode. use `:help Colorizer` for more infor

#### Folding

`<Leader-Space>` Toggle fold


#### Fuzzy finder

`<Leader-ff>` Open telescope find files
`<Leader-fg>` Open telescope live grep
`<Leader-fb>` Open telescope search buffers
`<Leader-fh>` Open telescope help tags
`<Leader-ft>` Open telescope search git files

#### LSP

`<Leader-e>` Open diagnostic message (error message)
`]d`Goto next diagnostic
`[d`goto previous diagnostic
`]e`Goto next diagnostic
`[e`goto previous diagnostic
`ge`list lsp diagnostic locations
`<leader-q>` list lsp diagnostic locations

(todo check what setloclist does)
`gd` go to definition
`gD` Go to declaration
`gi` Go to implementation
`gt` Go to type definition
`gr` go to references menu
TODO `<Esc>`Close references

`K`Hover info
`<leader-k>`Signature help

`<Leader-wa>`Add workspace folder
`<Leader-wr>`remove workspace folder
`<Leader-wl>`list workspace folders

`<Leader-R>`Rename variable/type/etc
`<Leader-C>`Code actions menu

`<Leader-F>`Format code
