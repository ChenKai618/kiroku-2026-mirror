#!/usr/bin/env bash
# ═══════════════════════════════════════════════════════════════
# GitHub 大掃除スクリプト
#
# 使い方:
#   1. まず確認モード（何も変更しない）:  ./github_cleanup.sh
#   2. 実行モード:                        ./github_cleanup.sh --execute
#
# 何をするか:
#   - 著作権/スクレイピング系のforkリポジトリを private 化
#   - 主力3プロジェクトを pin
#   - 結果を確認表示
# ═══════════════════════════════════════════════════════════════

set -uo pipefail

USER="RainYaya"
EXECUTE=false
[[ "${1:-}" == "--execute" ]] && EXECUTE=true

C_RED=$'\033[0;31m'; C_GRN=$'\033[0;32m'; C_YEL=$'\033[1;33m'
C_BLU=$'\033[0;34m'; C_BLD=$'\033[1m';    C_off=$'\033[0m'

banner() { printf '\n%s══════ %s ══════%s\n' "$C_BLU" "$1" "$C_off"; }

if ! $EXECUTE; then
  printf '%s※ 確認モード（DRY RUN）— 何も変更しません%s\n' "$C_YEL" "$C_off"
  printf '  実行するには: %s./github_cleanup.sh --execute%s\n' "$C_BLD" "$C_off"
fi

# ───────────────────────────────────────────────────────────────
# 対象1: private 化するリポジトリ（削除ではなく private。取り返しがつく）
#
# 理由:
#   tvapk        — 海賊版APK収集。日本企業では明確なマイナス（著作権）
#   KatelyaTV    — 動画アグリゲータ二次開発。同上
#   examtopics-downloader — 試験問題のスクレイピングツール
#   github-achievements-lab — 実績稼ぎ用。中身が薄いと見られる
#   web_tool / neat-reader / running_page / drawstamputils
#                — 他人の作品のfork。自作と混ざって主力が埋もれる
# ───────────────────────────────────────────────────────────────
TO_PRIVATE=(
  "tvapk"
  "KatelyaTV"
  "examtopics-downloader"
  "github-achievements-lab"
  "web_tool"
  "neat-reader"
  "running_page"
  "drawstamputils"
  "Game-Programming-Patterns-CN"
  "json-tutorial"
  "obsidian-epub-importer"
)

# ───────────────────────────────────────────────────────────────
# 対象2: pin する主力リポジトリ（面接官が最初に見る6枠）
# ───────────────────────────────────────────────────────────────
TO_PIN=(
  "bikuri-NihongoLens"   # 技術的に最も深い。ADR 6本あり
  "baku-yomi"            # 小紅書1000いいね。star 2
  "bikuri-goizukan"      # デプロイ済み・star 1
)

banner "現状確認"
gh repo list "$USER" --limit 100 --visibility public \
  --json name,isFork,stargazerCount,primaryLanguage \
  --jq '.[] | "  \(if .isFork then "fork" else "自作" end) | \(.name) | \(.primaryLanguage.name // "-") | ⭐\(.stargazerCount)"' \
  2>/dev/null || printf '%s取得失敗（gh auth status を確認）%s\n' "$C_RED" "$C_off"

banner "STEP 1: private 化"
for repo in "${TO_PRIVATE[@]}"; do
  if ! gh repo view "$USER/$repo" >/dev/null 2>&1; then
    printf '  %s—%s %s（存在しない/既に非公開・スキップ）\n' "$C_YEL" "$C_off" "$repo"
    continue
  fi
  if $EXECUTE; then
    if gh repo edit "$USER/$repo" --visibility private --accept-visibility-change-consequences >/dev/null 2>&1; then
      printf '  %s✓%s %s → private\n' "$C_GRN" "$C_off" "$repo"
    else
      printf '  %s✗%s %s（失敗。手動で: gh repo edit %s/%s --visibility private）\n' \
             "$C_RED" "$C_off" "$repo" "$USER" "$repo"
    fi
  else
    printf '  %s→%s %s を private にします\n' "$C_YEL" "$C_off" "$repo"
  fi
done

banner "STEP 2: pin 設定"
printf '  ※ pin はAPIから設定できないため、ブラウザで手動設定が必要です\n\n'
printf '  1. %shttps://github.com/%s%s を開く\n' "$C_BLD" "$USER" "$C_off"
printf '  2. "Customize your pins" をクリック\n'
printf '  3. 以下を選択:\n'
for repo in "${TO_PIN[@]}"; do
  printf '       %s☐%s %s\n' "$C_BLD" "$C_off" "$repo"
done

banner "実行後の見え方（面接官の視点）"
cat <<'PREVIEW'
  📌 Pinned
     bikuri-NihongoLens  Python/TS  — 日本語学習ツール（ADR 6本・WhisperX）
     baku-yomi           TypeScript — AI読書アプリ（⭐2・小紅書1000いいね）
     bikuri-goizukan     React      — 複合動詞図鑑（デプロイ済み）

  → 「自作プロジェクトを完成させてデプロイまで持っていく人」に見える
  → 変更前は fork 11個に埋もれて「海賊版ツールをforkする人」に見えていた
PREVIEW

banner "次のアクション（手動・重要）"
cat <<'NEXT'
  □ 各リポジトリの README 冒頭にスクリーンショットを追加
       → 面接官は30秒しか見ない。画像1枚がテキスト100行に勝つ
  □ README に「デモURL」を明記
       bikuri-goizukan → https://bikuri-goizukan.vercel.app
       aws-mondai      → https://aws-mondai.vercel.app （非公開のままでOK）
  □ baku-yomi の README の `YOUR_USERNAME` を `RainYaya` に直す
       → clone手順のプレースホルダが残っている。細部の甘さに見える
  □ GitHub プロフィール（RainYaya/RainYaya リポジトリ）を整備
       → 自己紹介・技術スタック・資格・連絡先
  □ プロフィールに顔写真ではなくアイコンでよいが、空欄は避ける
NEXT

printf '\n'
if $EXECUTE; then
  printf '%s✓ 完了%s\n' "$C_GRN" "$C_off"
else
  printf '%s実行するには: ./github_cleanup.sh --execute%s\n' "$C_BLD" "$C_off"
fi
