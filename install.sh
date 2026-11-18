#!/data/data/com.termux/files/usr/bin/bash
set -e

REPO_URL="https://raw.githubusercontent.com/Trmx01/ocu-auto/main"
PREFIX_FIXED=/data/data/com.termux/files/usr

echo "[*] Aggiornamento pacchetti..."
pkg update -y
pkg install -y curl tmux nodejs wireproxy wireguard-tools proot

echo "[*] Installazione OpenCode..."
if ! command -v opencode-real >/dev/null 2>&1; then
    npm install -g opencode-termux
    mv "$PREFIX_FIXED/bin/opencode" "$PREFIX_FIXED/bin/opencode-real"
fi

echo "[*] Installazione wgcf..."
if [ ! -x "$PREFIX_FIXED/bin/wgcf" ]; then
    curl -L -o "$PREFIX_FIXED/bin/wgcf" \
        https://github.com/ViRb3/wgcf/releases/download/v2.2.30/wgcf_2.2.30_linux_arm64
    chmod +x "$PREFIX_FIXED/bin/wgcf"
fi

echo "[*] Download script ocu-auto..."
mkdir -p ~/.local/bin

curl -fsSL "$REPO_URL/bin/ocu-daemon" -o ~/.local/bin/ocu-daemon
curl -fsSL "$REPO_URL/bin/ocu-rotate" -o ~/.local/bin/ocu-rotate
curl -fsSL "$REPO_URL/bin/opencode" -o "$PREFIX_FIXED/bin/opencode"

chmod +x ~/.local/bin/ocu-daemon
chmod +x ~/.local/bin/ocu-rotate
chmod +x "$PREFIX_FIXED/bin/opencode"

echo "[*] Setup completato! Digita 'opencode' per iniziare."
