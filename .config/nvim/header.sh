#!/bin/sh
# neovim start page
#
# The output of this shell script will be displayed on startup.
#
# -- Function map --
#
# main();       - The first function that gets called. It calls all the other functions so you don't need to touch it for most things.
# prepare();    - This function sets basic variables.
# print_text(); - Prints text helpful to new users. You can change anything there.
# drw_ascii();  - Creates ASCII art from an image, or if it's a text file it will print it out.

print_text() {
  # text that will be printed
  printf -- "\
  - Run ':h' for help.\n\
  - Press CTRL+E to configure.\n\
  - Edit ~/.config/nvim/start.sh to customize this start page.\n\
"

  # if there is no image
  [ "$no_image" = "true" ] && printf -- "\
  - Add an image or text file to ~/.config/nvim/images and it will be displayed on startup.\n\
"

}

drw_ascii() {
    file="$(find $dir/images -type f | shuf | head -n 1 | grep -E "png|txt")"
    [ ! -f "$file" ] && printf "neovim %s\n" "$(nvim -v | awk '{ print $2 }' | head -n 1)" && no_image="true"
    printf "$file" | grep -q txt && cat "$file"
    printf "$file" | grep -q png && jp2a "$file" --size="80x20"
    printf "\n"
}

prepare() {
    dir="$(dirname $0)"
    [ -d "$dir/images" ] || mkdir -p $dir/images
}

main() {
    prepare
    [ -x $(command -v jp2a) ] && drw_ascii
    print_text
}

main
