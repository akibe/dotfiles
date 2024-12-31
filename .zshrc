export LANG=ja_JP.UTF-8

# 色を使用
autoload -Uz colors
colors

# 補完
autoload -Uz compinit
compinit

setopt auto_cd                # ディレクトリ名だけでcdする
setopt auto_menu              # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_slash       # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd             # ディレクトリを自動でスタックに追加
setopt complete_in_word       # 語の途中でもカーソル位置で補完
setopt extended_history       # $HISTFILEに時間も記録
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_all_dups   # 同じコマンドをヒストリに残さない
setopt hist_ignore_dups       # 直前と同じコマンドの場合は履歴に追加しない
setopt hist_save_no_dups      # 重複するコマンドが保存されるとき、古い方を削除する。
setopt histignorealldups      # ヒストリーに重複を表示しない
setopt interactive_comments   # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst      # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt mark_dirs              # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt no_beep                # ビープ音を消す
setopt print_eight_bit        # 日本語ファイル名を表示可能にする
setopt print_eight_bit        # 日本語ファイル名等8ビットを通す
setopt share_history          # 他のターミナルとヒストリーを共有

HISTFILE=~/.zsh_history
HISTSIZE=100000         # メモリ上に保存される件数（検索できる件数）
SAVEHIST=100000         # ファイルに保存される件数

# rootは履歴を残さないようにする
if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi

# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

# ghqとの連携。ghqの管理化にあるリポジトリを一覧表示する。ctrl - ]にバインド。
function peco-src () {
  local selected_dir=$(ghq list -p | peco --prompt="repositories >" --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brewfile
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
  _post_brewfile_update () {
    brew file update
  }
fi

# OrbStack
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# proto
export PROTO_HOME="$HOME/.proto";
export PATH="$PROTO_HOME/shims:$PROTO_HOME/bin:$PATH";

# Google Cloud
if [ -f '/Users/t_sakamoto/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/t_sakamoto/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/t_sakamoto/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/t_sakamoto/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
