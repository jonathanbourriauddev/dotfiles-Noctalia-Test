source /usr/share/cachyos-fish-config/cachyos-config.fish

# --- Greeting ---
# Override CachyOS greeting to prevent automatic Fastfetch
function fish_greeting
end

# --- Environment ---
set -gx EDITOR nvim
set -gx VISUAL nvim

# --- Starship ---
starship init fish | source

# --- Zoxide ---
zoxide init fish | source

# --- FZF ---
fzf --fish | source

# --- CLI tools ---
abbr -a l  'eza'
abbr -a ll 'eza -lah --group-directories-first'
abbr -a la 'eza -a'
abbr -a lt 'eza --tree'
abbr -a zj 'zellij'

# --- Zellij ---
function zellij
    command zellij $argv
    set -l zellij_status $status

    if test $zellij_status -eq 0
        printf '\e[1A\e[2K\r'
    end

    return $zellij_status
end
