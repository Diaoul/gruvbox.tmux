#!/usr/bin/env bash
PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# theme
thm_bgh="#1d2021"
thm_bg="#282828"
thm_bgs="#32302f"
thm_bg1="#3c3836"
thm_bg2="#504945"
thm_bg3="#665c54"
thm_bg4="#7c6f64"
thm_gray="#a89984"
thm_fg0="#fbf1c7"
thm_fg="#ebdbb2"
thm_fg2="#d5c4a1"
thm_fg3="#bdae93"
thm_fg4="#a89984"
thm_red="#fb4934"
thm_green="#b8bb26"
thm_yellow="#fabd2f"
thm_blue="#83a598"
thm_purple="#d3869b"
thm_aqua="#8ec07c"
thm_orange="#fe8019"
thm_dark_red="#cc241d"
thm_dark_green="#98971a"
thm_dark_yellow="#d79921"
thm_dark_blue="#458588"
thm_dark_purple="#b16286"
thm_dark_aqua="#689d6a"
thm_dark_orange="#d65d0e"

# utils
get_option() {
  local option value default
  option="$1"
  default="$2"
  value=$(tmux show-option -gqv "$option")

  if [ -n "$value" ]; then
    if [ "$value" = "null" ]; then
      echo ""
    else
      echo "$value"
    fi
  else
    echo "$default"
  fi
}

get_color_option() {
  local option value default
  option="$1"
  default="$2"
  value=$(tmux show-option -gqv "$option")

  if [ -n "$value" ]; then
    if [ "$value" = "null" ]; then
      echo ""
    else
      if [[ "$value" =~ ^# ]]; then
        echo "$value"
      else
        echo "${!value}"
      fi
    fi
  else
    echo "$default"
  fi
}


main() {
  # status
  tmux set-option -gq status "on"
  tmux set-option -gq status-bg "${thm_bg}"
  tmux set-option -gq status-justify "left"
  tmux set-option -gq status-left-length "100"
  tmux set-option -gq status-right-length "100"

  # messages
  tmux set-option -gq message-style "fg=${thm_aqua},bg=${thm_bg1},align=centre"
  tmux set-option -gq message-command-style "fg=${thm_aqua},bg=${thm_bg1},align=centre"

  # panes
  tmux set-option -gq pane-border-style "fg=${thm_bg3}"
  tmux set-option -gq pane-active-border-style "fg=${thm_dark_orange}"

  # windows
  tmux set-window-option -gq window-status-activity-style "fg=${thm_fg},bg=${thm_bg},none"
  tmux set-window-option -gq window-status-separator ""
  tmux set-window-option -gq window-status-style "fg=${thm_fg},bg=${thm_bg},none"

  # status left
  local status_right_separator=$(get_option "@gruvbox_status_right_separator" "█")
  local session_color="#{?client_prefix,$thm_red,$thm_dark_blue}"
  tmux set -g status-left "#[fg=$thm_bg,bg=$session_color,bold]  #S#[fg=$session_color,bg=$thm_bg]$status_right_separator"

  # windows
  local window_left_separator=$(get_option "@gruvbox_window_left_separator" "█")
  local window_middle_separator=$(get_option "@gruvbox_window_middle_separator" "█ ")
  local window_right_separator=$(get_option "@gruvbox_window_right_separator" "█")
  local window_use_single_color=$(get_option "@gruvbox_window_use_single_color" "no")
  local window_active_color=$(get_color_option "@gruvbox_window_active_color" "$thm_bg")
  local window_active_background_color=$(get_color_option "@gruvbox_window_background_active_color" "$thm_orange")
  local window_inactive_color=$(get_color_option "@gruvbox_window_inactive_color" "$thm_bg")
  local window_inactive_background_color=$(get_color_option "@gruvbox_window_inactive_background_color" "$thm_dark_blue")

  local window_number_color=$window_inactive_color
  local window_number_background_color=$window_inactive_background_color
  local window_text_color=$thm_fg
  local window_text_background_color=$thm_bg1
  local window_middle_color=$window_number_background_color
  local window_middle_background_color=$window_text_background_color
  local window_current_number_color=$window_active_color
  local window_current_number_background_color=$window_active_background_color
  local window_current_text_color=$thm_fg0
  local window_current_text_background_color=$thm_bg2
  local window_current_middle_color=$window_current_number_background_color
  local window_current_middle_background_color=$window_current_text_background_color

  if [ "$window_use_single_color" = "yes" ]; then
    local window_text_color=$window_number_color
    local window_text_background_color=$window_number_background_color
    local window_middle_color=$window_text_color
    local window_middle_background_color=$window_text_background_color
    local window_current_text_color=$window_current_number_color
    local window_current_text_background_color=$window_current_number_background_color
    local window_current_middle_color=$window_current_text_color
    local window_current_middle_background_color=$window_current_text_background_color
  fi

  tmux set -g window-status-format "#[fg=$window_number_background_color,bg=$thm_bg]$window_left_separator#[fg=$window_number_color,bg=$window_number_background_color]#I#[fg=$window_middle_color,bg=$window_middle_background_color]$window_middle_separator#[fg=$window_text_color,bg=$window_text_background_color]#W#{?window_zoomed_flag, 󰄷,}#{?window_last_flag, 󰁯,} #[fg=$window_text_background_color,bg=$thm_bg]$window_right_separator"
  tmux set -g window-status-current-format "#[fg=$window_current_number_background_color,bg=$thm_bg]$window_left_separator#[fg=$window_current_number_color,bg=$window_current_number_background_color]#I#[fg=$window_current_middle_color,bg=$window_current_middle_background_color]$window_middle_separator#[fg=$window_current_text_color,bg=$window_current_text_background_color]#W#{?window_zoomed_flag, 󰄷 , }#[fg=$window_current_text_background_color,bg=$thm_bg]$window_right_separator"

  # status right
  local status_left_separator=$(get_option "@gruvbox_status_left_separator" "")
  tmux set -g status-right "#[fg=$thm_bg1,bg=$thm_bg]$status_left_separator#[fg=$thm_fg,bg=$thm_bg1] #(whoami)@#H #[fg=$session_color,bg=$thm_bg1]$status_left_separator#[fg=$thm_bg,bg=$session_color,bold] %H:%M "

}

main "$@"
