# Syntax highlighting
[[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Auto suggestion
[[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-completions
[[ -d ~/.zsh/plugins/zsh-completions/src ]] && fpath=(~/.zsh/plugins/zsh-completions/src $fpath)
