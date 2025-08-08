alias fetch='fastfetch'


LIVE_TERMINALS=$(pgrep -u "$USER" -fx "kitty" | wc -l)

if [ "$LIVE_TERMINALS" -eq 1 ]; then
    fastfetch
fi

if [[ $- == *i* ]] && [ "$WINDOWID" ]; then
  class=$(xprop -id "$WINDOWID" 2>/dev/null | grep WM_CLASS | awk -F'"' '{print $4}')
  if [[ "$class" == "floatkitty" ]]; then
    fastfetch
  fi
fi

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting history)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet




