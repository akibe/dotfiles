# SETTINGS

- アクセシビリティ
  - ポインタコントロール
    - トラックパッドオプション
      - ドラッグにトラックパッドを使用：ON
      - ドラッグ方法：3 本指でドラッグ
- メニューバー
  - Wi-Fi：メニューバーに非表示
  - バッテリー
    - メニューバーに表示：OFF
    - コントロールに表示：ON
  - Spotlight：メニューバーに非表示
  - 時計：
    - スタイル：アナログ
    - 時報をアナウンス：1 時間
- ディスプレイ
  - スペースを拡大
- デスクトップと Dock
  - Dock
    - ウィンドウをしまうときのエフェクト：スケールエフェクト
    - Dock を自動的に表示/非表示：ON
  - デスクトップとステージマネージャ
    - 項目を表示ーステージマネージャ使用時に：ON
    - 壁紙をクリックしてデスクトップを表示：ステージマネージャ使用時のみ
- TouchID とパスワード
  - TouchID を設定
- キーボード
  - 操作がなければキーボードのバックライトをオフにする：10 秒後
  - テキスト入力　入力ソース
    - すべての入力ソース
      - 英字入力中にスペルを自動変換：OFF
      - 文頭を自動的に大文字にする：OFF
      - インライン予測テキストを表示：OFF
      - スペースバーを 2 回押してピリオドを表示：OFF
    - 日本語
      - ライブ変換：OFF
- トラックパッド
  - ポイントとクリック
    - タップでクリック：ON
  - その他のジェスチャ
    - ページ間をスワイプ：OFF
    - フルスクリーンアプリ間をスワイプ：4 本指で左右にスワイプ
    - MissionControl：4 本指で上にスワイプ
    - アプリ Expose：4 本指で下にスワイプ

# Finder

- 表示
  - パスバーを表示
  - ステータスバーを表示

## Bluetooth の遅延改善

```
sudo defaults write bluetoothaudiod "Enable AptX codec" -bool true
sudo defaults write bluetoothaudiod "Enable AAC codec" -bool true
```

## Spotlight 無効化

```
sudo mdutil -a -i off
```

## Dock の開閉アニメーション高速化

```
defaults write com.apple.dock autohide-time-modifier -float 0
```
