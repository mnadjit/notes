### Fedora
#### General
- Copy any font file e.g. in .ttf or .otf format to the fonts folders  `usr/share/fonts` or `/usr/local/share/fonts`
- To make sure it is available for all users, run:
    - `fc-list`
- To update the cache for programs like libre office, run:
    - `fc-cache` 
- To get the current font used by the terminal, run:
    - `gsettings get org.gnome.desktop.interface monospace-font-name`
- In Gnome, can use **Tweaks** application to change the font.
- To change the font in the terminal, run:
    - `gsettings set org.gnome.desktop.interface monospace-font-name $font_name`
---
#### Patching a font file with glyphs
Use [Nerd-Fonts](https://github.com/ryanoasis/nerd-fonts)
1) Install **fontforge**
> `sudo dnf install fontforge`
- you can also use fontforge to view the content of the font file and 
make adjustments
2) Create a folder and make sure it contains the following items
    - font-patcher python script 
        - Download from ![github]
        > `wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/font-patcher`
    - glyphs folder:
        - Download /src/glyphs folder from [![github]](https://github.com/ryanoasis/nerd-fonts/trunk/src/glyphs)
        > `svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/src/glyphs`

5) Run the following command to patch a font file 
> `fontforge -script font-patcher -c -w --careful -out $output_directory $font_file_path`
- `-c`: Complete; meaning patch all glyphs like fontawesome, octicons, codicons, etc. to the font file
- `-w`: Windows Compatible; Make the font name short so it can be used in Windows as well.
- `--careful`: Do not overwrite an already patched character
--- 