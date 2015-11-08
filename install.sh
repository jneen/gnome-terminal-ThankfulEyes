#!/usr/bin/env bash

# if there's a better way to use gconf, plz let me know.

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Thankful Eyes"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="ThankfulEyes"
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$BASE_KEY" ]] && BASE_KEY="/org/gnome/terminal/legacy/profiles:"

PROFILE_UUID="$(uuidgen)"
PROFILE_KEY="$BASE_KEY/:$PROFILE_UUID"

gconftool() { gconftool-2 "$@" ;}

dset() {
  local key="$1"; shift
  local val="$1"; shift

  echo dconf write "$PROFILE_KEY"/"$key" "$val" >&2
  dconf write "$PROFILE_KEY"/"$key" "$val"
}

cool_as_ice='#6c8b9f'
slate_blue='#4e5d62'
pool='#4dc5c0'
eggshell_cloud='#dee5e7'
krasna='#122b3b'
aluminium1='#fefeec'
scarletred2='#cc0000'
butter3='#c4a000'
go_get_it='#b2fd6d' # green
dragon='#38C46D'
chilly='#a8e1fe'
unicorn='#faf6e4'
sandy='#f6dd62' # light yellow
pink_merengue='#f696db' # pink
dune='#fff0a6' # super-light yellow
backlit='#4df4ff' # light blue
schrill='#ffb000' # rich yellow
rose='#ffcfdb'
black='#000000'

palette() {
  echo -n '['
  {
    echo $black
    echo $scarletred2
    echo $dragon
    echo $butter3
    echo $cool_as_ice
    echo $pink_merengue
    echo $pool
    echo $unicorn

    echo $slate_blue
    echo $schrill
    echo $go_get_it
    echo $sandy
    echo $chilly
    echo $rose
    echo $backlit
    echo $dune
  } | sed -E "s/^(.*)$/'\\1'/" | head -c-1 | tr "\n" ,
  echo -n ']'
}

dconf write "$BASE_KEY"/default "'$PROFILE_UUID'"
dconf write "$BASE_KEY"/list "['$PROFILE_UUID']"

dset visible-name "'$PROFILE_NAME'"

dset palette "$(palette)"
dset background-color "'$krasna'"
dset bold-color-same-as-fg false
dset bold-color "'$unicorn'"
dset foreground-color "'$eggshell_cloud'"
dset background-darkness 0.5
dset background-type "'solid'"
dset use-theme-colors false

dset default-show-menubar false
dset title "'Terminal'"
dset use-custom-default-size true
dset default-size-columns 80

dset use-system-font false
dset font "'Ubuntu Mono 14'"
dset allow-bold true

dset backspace-binding "'ascii-del'"
dset delete-binding "'escape-sequence'"

dset silent-bell false

dset exit-action "'close'"

dset scroll-on-keystroke true
dset scroll-background true
dset scrollback-lines 1024
dset scrollbar-position "'right'"
dset alternate-screen-scroll true
dset scroll-on-output false
dset scrollback-unlimited true


dset use-custom-command false
dset custom-command "''"


dset title-mode "'replace'"


dset background-image "''"
dset default-size-rows 24


dset cursor-blink-mode "'system'"
dset cursor-shape "'block'"

dset login-shell false
dset update-records true
dset word-chars \''-A-Za-z0-9,./?%&#:-=+@~'\'

