#!/usr/bin/env bash

# if there's a better way to use gconf, plz let me know.

[[ -z "$PROFILE_NAME" ]] && PROFILE_NAME="Thankful Eyes"
[[ -z "$PROFILE_SLUG" ]] && PROFILE_SLUG="ThankfulEyes"
[[ -z "$GCONFTOOL" ]] && GCONFTOOL=gconftool
[[ -z "$BASE_KEY" ]] && BASE_KEY="/apps/gnome-terminal/profiles"

PROFILE_KEY="$BASE_KEY/$PROFILE_SLUG"

gset() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  "$GCONFTOOL" --type "$type" --set "$PROFILE_KEY/$key" -- "$val"
}

cool_as_ice='#6c8b9f'
slate_blue='#4e5d62'
eggshell_cloud='#dee5e7'
krasna='#122b3b'
aluminium1='#fefeec'
scarletred2='#cc0000'
butter3='#c4a000'
go_get_it='#b2fd6d' # green
chilly='#a8e1fe'
unicorn='#faf6e4'
sandy='#f6dd62' # light yellow
pink_merengue='#f696db' # pink
dune='#fff0a6' # super-light yellow
backlit='#4df4ff' # light blue
schrill='#ffb000' # rich yellow
black='#000000'

palette() {
  {
    echo $slate_blue
    echo $scarletred2
    echo $go_get_it
    echo $schrill
    echo $chilly
    echo $pink_merengue
    echo $eggshell_cloud
    echo $unicorn

    echo $black
    echo $scarletred2
    echo $go_get_it
    echo $butter3
    echo $backlit
    echo $pink_merengue
    echo $cool_as_ice
    echo $aluminium1
  } | head -c-1 | tr "\n" :
}

# because gconftool doesn't have "append"
glist_append() {
  local type="$1"; shift
  local key="$1"; shift
  local val="$1"; shift

  local entries="$(
    {
      gconftool -g "$key" | tr -d '[]' | tr , "\n" | fgrep -v "$val"
      echo "$val"
    } | head -c-1 | tr "\n" ,
  )"

  gconftool -s --type list --list-type $type "$key" "[$entries]"
}

glist_append string /apps/gnome-terminal/global/profile_list "$PROFILE_SLUG"

gset string visible_name "$PROFILE_NAME"

gset string palette "$(palette)"
gset string background_color $krasna
gset string bold_color_same_as_fg false
gset string bold_color $unicorn
gset string foreground_color $eggshell_cloud
gset float  background_darkness 0.5
gset string background_type solid
gset bool   use_theme_colors false

gset bool   default_show_menubar false
gset string title Terminal
gset bool   use_custom_default_size true
gset int    default_size_columns 80

gset bool   use_system_font false
gset string font "Ubuntu Mono 14"
gset bool   allow_bold true

gset string backspace_binding ascii-del
gset string delete_binding escape-sequence

gset bool   silent_bell false

gset string exit_action close

gset bool   scroll_on_keystroke true
gset bool   scroll_background true
gset bool   scrollback_lines 1024
gset string scrollbar_position right
gset bool   alternate_screen_scroll true
gset bool   scroll_on_output false
gset bool   scrollback_unlimited true


gset bool   use_custom_command false
gset string custom_command ''


gset string title_mode replace


gset string background_image ''
gset string default_size_rows 24


gset string cursor_blink_mode system
gset string cursor_shape block

gset bool   login_shell false
gset bool   update_records true
gset string word_chars '-A-Za-z0-9,./?%&#:_=+@~'

