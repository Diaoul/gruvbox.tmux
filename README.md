# gruvbox.tmux

Gruvbox vibes for tmux!

## ✨ Features

- Session name in status left
- Nice window indicator with default orange accent
- Last session indicator in window for fast switching
- Zoomed indicator to never forget again about your invisible panes!
- Some degree of style customization!

## 📦 Installation

Requires a [nerd-font](https://www.nerdfonts.com/font-downloads) compatible font.

Install with [TPM](https://github.com/tmux-plugins/tpm)
```
set -g @plugin 'Diaoul/gruvbox.tmux'
```

## ⚙️ Configuration

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

## 🤩 Examples

### Default configuration

![2023-12-31-173019_hyprshot](https://github.com/Diaoul/gruvbox.tmux/assets/319220/bd4a7df8-5ea2-43c5-b1eb-14b630913e76)

### Single color

```
set -g @gruvbox_window_use_single_color "yes"
set -g @gruvbox_window_middle_separator " "
set -g @gruvbox_window_inactive_color "thm_fg"
set -g @gruvbox_window_inactive_background_color "thm_bg1"
```

![2023-12-31-171954_hyprshot](https://github.com/Diaoul/gruvbox.tmux/assets/319220/f34efa6d-fac5-40b2-b7a8-2e37052d5bf0)

![2023-12-31-172016_hyprshot](https://github.com/Diaoul/gruvbox.tmux/assets/319220/04bfa4f6-81f8-4143-b0d4-3fe07297a879)

## 🤝 Thanks

Inspiration taken from various themes, in particular:

- [Catppuccin](https://github.com/catppuccin/tmux)
- [tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux/)
- [tmux-power](https://github.com/wfxr/tmux-power)

## 📚 Contributing

As this project currently fits my needs, I don't plan to add any new features besides my personal needs but I will gladly accept pull requests that do so!
