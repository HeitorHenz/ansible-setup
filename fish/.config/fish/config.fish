if status is-interactive
    starship init fish | source

    alias hx="helix"
    alias ls="eza --icons --git --group-directories-first"
    alias cat="bat"
    alias zellij="zellij --layout compact"
end

# uv
fish_add_path "/var/home/h/.local/bin"
