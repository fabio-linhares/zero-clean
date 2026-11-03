#!/usr/bin/env bash
# ==============================================================================
# ZeroClean Installer
# Installs zeroclean executable and sets up user symlink & systemd sentinel
# ==============================================================================
set -euo pipefail

DEST_DIR="${HOME}/.local/bin"
SYSTEMD_USER_DIR="${HOME}/.config/systemd/user"

echo "🧹 Installing ZeroClean..."

mkdir -p "${DEST_DIR}"
cp -pv bin/zeroclean "${DEST_DIR}/zeroclean"
chmod +x "${DEST_DIR}/zeroclean"

# Symlink zclean -> zeroclean
ln -sf "${DEST_DIR}/zeroclean" "${DEST_DIR}/zclean"

echo "✔ Binary installed to ${DEST_DIR}/zeroclean"
echo "✔ Symlink created: ${DEST_DIR}/zclean"

# Optional systemd installation
read -p "Install automated 30-min background sentinel (systemd --user)? [y/N]: " -r install_timer || install_timer="n"
if [[ "${install_timer}" =~ ^[YySs]$ ]]; then
    mkdir -p "${SYSTEMD_USER_DIR}"
    cp -pv systemd/zeroclean-auto.* "${SYSTEMD_USER_DIR}/"
    systemctl --user daemon-reload
    systemctl --user enable --now zeroclean-auto.timer
    echo "✔ Background sentinel timer active (systemctl --user status zeroclean-auto.timer)"
fi

echo ""
echo "🎉 ZeroClean successfully installed!"
echo "Run 'zeroclean' or 'zclean' to get started."
