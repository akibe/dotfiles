# ------------------------------------------------------------
# Locale
# ------------------------------------------------------------
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8

# ------------------------------------------------------------
# 色・補完
# ------------------------------------------------------------
autoload -Uz colors
colors

autoload -Uz compinit
compinit -u

# ------------------------------------------------------------
# 基本オプション
# ------------------------------------------------------------
setopt AUTO_CD                # ディレクトリ名だけでcd
setopt AUTO_MENU              # 補完キー連打で候補を順送り
setopt AUTO_PARAM_SLASH       # ディレクトリ補完で末尾に /
setopt AUTO_PUSHD             # ディレクトリスタックに追加
setopt COMPLETE_IN_WORD       # 単語の途中でも補完
setopt EXTENDED_HISTORY       # HISTFILEにタイムスタンプも記録
setopt HIST_EXPIRE_DUPS_FIRST # サイズ超過時は重複から削除
setopt HIST_IGNORE_ALL_DUPS   # 全ての重複コマンドを履歴から除去
setopt HIST_SAVE_NO_DUPS      # 保存時に重複を消す
setopt INTERACTIVE_COMMENTS   # 行中の # 以降をコメント扱い
setopt MAGIC_EQUAL_SUBST      # = の右側も補完対象
setopt MARK_DIRS              # 展開時にディレクトリ末尾へ /
setopt NO_BEEP                # ビープ音を消す
setopt PRINT_EIGHT_BIT        # 日本語ファイル名など8bitを通す
setopt SHARE_HISTORY          # ターミナル間で履歴共有

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# rootは履歴を残さない
if [ "$UID" = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

# ------------------------------------------------------------
# 履歴検索（↑↓でプレフィックス検索）
# ------------------------------------------------------------
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end  history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# ------------------------------------------------------------
# Homebrew / PATH
# ------------------------------------------------------------
# Homebrew（Apple Silicon標準パス）
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 必要に応じてローカルbinを追加
export PATH="$HOME/.local/bin:$PATH"

# ------------------------------------------------------------
# Apps
# ------------------------------------------------------------

# proto（公式推奨の activate）
if command -v proto >/dev/null 2>&1; then
  eval "$(proto activate)"
fi

# direnv
if command -v direnv >/dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

# OrbStack
[ -f "$HOME/.orbstack/shell/init.zsh" ] && source "$HOME/.orbstack/shell/init.zsh"

# ghq + peco
# コマンドを途中まで入力後、ghqの管理化にあるリポジトリを一覧表示する。ctrl - ]にバインド。
function ghq-cd () {
  local selected_dir
  selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N ghq-cd
bindkey '^]' ghq-cd

# ------------------------------------------------------------
# プロンプト（軽量 + Gitブランチ表示）
# ------------------------------------------------------------
# Gitブランチだけを簡易表示（負荷軽め）
git_prompt_info() {
  local ref
  ref=$(git symbolic-ref --short HEAD 2>/dev/null) || return
  echo " ‹${ref}›"
}

autoload -Uz promptinit
promptinit

PROMPT='%F{cyan}%n%f:%F{green}%~%f$(git_prompt_info) %# '
RPROMPT='%F{yellow}%*%f'

# ------------------------------------------------------------
# エディタ / ブラウザ
# ------------------------------------------------------------
export EDITOR="cursor"
export BROWSER="open"
