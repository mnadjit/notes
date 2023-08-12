# Reference
https://vim.rtorr.com/

# Navigation
## Word Jump
- `w` jump to beginning of this word then next words
- `e` jump to end of next word
- `b` jump to beginning of this word and then previous words
## Line Jump
- `:5` jump to line 5
## Paragraph Jump
`}` jump to next paragraph
`{` jump to previous paragraph
## Whole Document Jump
- `gg` jump to beginning of the whole document
- `G` jump to the first char of last line end of document
- `zz` centre cursor on screen

- `^` jump to beginning of line
- `$` jump to end of line
- `h` move cursor left
- `l` move cursor right
- `j` move cursor down
- `k` move cursor up

## Window
- [Reference](https://linuxhandbook.com/split-vim-workspace/)
- `Ctrl+w v`  open a new empty window - vertical split
- `Ctrl+w h/j/k/l`  move the window around
- `Ctrl+w 10 >`  resize vertically split windows by 10 characters
- `Ctrl+w 20 +`  resize horizontally split windows by 10 characters
- `:q`  delete current buffer - closes the window in focus
- `:bd[elete]`  unload(?) current buffer - closes the window in focus
- `:vsplit $file_path`  open file in a new window - vertical split
- `:split $file_path`  open file in a new window - horizontal split

# Edit
## Insert
`i` insert before cursor
`I` insert beginning of line
`a` insert after cursor
`A` insert end of line
`o` insert next line
`O` insert previous line
`ctrl + p` insert auto-complete
## Delete
- `d0` or `d^` delete form cursor to beginning of line
- `db` delete from cursor to beginning of word
- `d$` delete from cursor to end of line
- `dw` delete a word or white-space where cursor is to next word
- `3dw` delete next 3 words
- `dd` delete this line
- `3dd` delete this line and next 2 lines
- `J` remove line break

 