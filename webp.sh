#!/bin/bash

# 変換先ディレクトリ
SOURCE_DIR="/var/www/html/soulmining/src/uploads"

# WebP出力先ディレクトリ
DEST_DIR="/var/www/html/soulmining/src/uploads"

# WebPの品質設定 (0-100)
QUALITY=80

# 必要なコマンドの確認
command -v cwebp >/dev/null 2>&1 || { echo >&2 "cwebpコマンドが見つかりません。インストールしてください。"; exit 1; }

# 出力先ディレクトリが存在しない場合は作成
mkdir -p "$DEST_DIR"

# ファイルを処理する関数
process_file() {
    local file="$1"
    local filename=$(basename "$file")
    local name="${filename%.*}"
    local dest_file="$DEST_DIR/${name}.webp"

    # 既に変換済みのファイルはスキップ
    if [ -f "$dest_file" ]; then
        echo "スキップ: $filename (既に変換済み)"
        return
    fi

    # WebPに変換
    cwebp -q $QUALITY "$file" -o "$dest_file"

    if [ $? -eq 0 ]; then
        echo "変換成功: $filename -> ${name}.webp"
    else
        echo "変換失敗: $filename"
    fi
}

# メイン処理
find "$SOURCE_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | while read -r file; do
    process_file "$file"
done

echo "処理完了"

