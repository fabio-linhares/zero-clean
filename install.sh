#!/usr/bin/env bash
# =============================================================================
# PROJETO      : ZeroClean
# ARQUIVO      : install.sh
# DESCRIÇÃO    : Script de instalação e configuração do ZeroClean e da
#                sentinela autônoma periódica em systemd --user.
#
# AUTOR        : Fábio Linhares
# E-MAIL       : fabiolinharez@gmail.com
# ORGANIZAÇÃO  : ZeroNexus Ecosystem
# WEBSITE      : https://fabiolinhares.com.br/
# REPOSITÓRIO  : https://github.com/fabio-linhares/zero-clean
#
# VERSÃO       : 1.0.0
# STATUS       : Estável
# CRIAÇÃO      : 2026-11-03
# ATUALIZAÇÃO  : 2026-11-03
# INTERPRETADOR: Bash >= 5.0
# PLATAFORMA   : GNU/Linux
#
# DEPENDÊNCIAS : bash, coreutils, systemd (opcional para timer)
# EXECUÇÃO     : bash install.sh ou ./install.sh
# PERMISSÕES   : chmod +x install.sh
#
# LICENÇA      : MIT
# COPYRIGHT    : (c) 2026 Fábio Linhares
# SPDX-License-Identifier: MIT
#
# HISTÓRICO
# -----------------------------------------------------------------------------
# 1.0.0 | 2026-11-03 | Fábio Linhares
#       | Implementação inicial do instalador e configuração da sentinela.
#
# OBSERVAÇÕES
# -----------------------------------------------------------------------------
# - Não requer privilégios de root para instalação em ~/.local/bin.
# - Validar permissões e PATH do usuário após a execução.
# - Consultar README.md para instruções adicionais.
# =============================================================================

set -Eeuo pipefail

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
