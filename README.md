# gruvbox.tmux

Gruvbox vibes for tmux!

## Features

- Session name in status left
- Nice window indicator with default orange accent
- Last session indicator in window for fast switching
- Zoomed indicator to never forget again about your invisible panes!
- Some degree of style customization!

## Configuration

Configuration options below with their default value.

```
set -g @gruvbox_status_right_separator "█"
set -g @gruvbox_window_left_separator "█"
set -g @gruvbox_window_middle_separator "█ "
set -g @gruvbox_window_right_separator "█"
set -g @gruvbox_window_use_single_color "no"
set -g @gruvbox_window_active_color "$thm_bg"
set -g @gruvbox_window_background_active_color "$thm_orange"
set -g @gruvbox_window_inactive_color "$thm_bg"
set -g @gruvbox_window_inactive_background_color "$thm_dark_blue"
set -g @gruvbox_status_left_separator ""
```

## Examples

### Default configuration

### Single color

```
set -g @gruvbox_window_use_single_color "yes"
set -g @gruvbox_window_middle_separator " "
set -g @gruvbox_window_inactive_color "thm_fg"
set -g @gruvbox_window_inactive_background_color "thm_bg1"
```

## 🤝Thanks

Inspiration taken from various themes, in particular:

- [Catppuccin](https://github.com/catppuccin/tmux)
- [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux/)
- [tmux-power](https://github.com/wfxr/tmux-power)

## Contributing

As this project currently fits my needs, I don't plan to add any new features besides my personal needs but I will gladly accept pull requests that do so!
