# 🧹 ZeroClean (`zeroclean` / `zclean`)

> **Smart, Safe & Didactic Linux System Hygiene and Memory Optimizer.**  
> *Real-time necessity assessment, passive pedagogy, multi-distro package purging, and zero-risk temp traversal.*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Python 3.8+](https://img.shields.io/badge/Python-3.8%2B-brightgreen.svg)](https://www.python.org/)
[![Linux](https://img.shields.io/badge/Platform-Linux-orange.svg)](https://kernel.org)
[![Systemd](https://img.shields.io/badge/Automation-systemd--user-informational.svg)](systemd/)

---

## 🌟 Highlights

Traditional cleaning utilities on Linux and Windows either run blind deletions (`rm -rf /tmp/*`, cache purging) or act as "black boxes" where the user clicks a button without knowing what command was executed.

**ZeroClean** changes this paradigm through four core engineering pillars:

1. **🩺 Real-Time Necessity Assessment:** Upon launch, it measures kernel pressure stall information (PSI), memory availability, and uptime in milliseconds, displaying a colored **Diagnostic Card** (🟢 Green / 🟡 Yellow / 🔴 Red). If the computer was just turned on or was recently optimized, it tells you: *"No cleaning needed. Enjoy your workflow!"*
2. **💡 Passive Pedagogy:** Every interactive menu option explicitly shows the **direct canonical command** next to it (e.g. `[2] Partial Cleanup ---> zeroclean partial`). Through daily visual reinforcement, users naturally memorize Linux administration commands without cognitive overload.
3. **🛡️ Mathematical Safety & Open File Preservation:** Before touching any temporary directory, ZeroClean indexes open file descriptors from `/proc/*/fd` and active locks. It **never deletes open files, Unix sockets, or active pipes**, completely preventing TOCTOU races and application crashes.
4. **🌐 Multi-Distro Polymorphism:** Automatically detects your distribution's native package manager (`apt`, `dnf`, `pacman`, `zypper`, `flatpak`, `snap`) and container engines (`podman`, `docker`), adapting options dynamically.
5. **⚡ Zero-RAM & `zboost` Synergy:** If the companion low-level engine [`zero-boost`](https://github.com/fabio-linhares/zero-boost) is detected, ZeroClean unlocks proactive kernel page reclamation (`process_madvise`) and `/dev/zram0` physical compaction.

---

## 🖥️ Interactive TUI Showcase

```text
╔══════════════════════════════════════════════════════════════════════════════╗
║ 🧹 ZeroClean — Smart System Hygiene & Memory Optimizer                       ║
╚══════ Host: Linux (Workstation) | Passive Pedagogy & Safety First ═══════════╝
╭───────────────────── 🩺 Real-Time Necessity Assessment ──────────────────────╮
│ 🟢 SYSTEM HEALTHY & OPTIMIZED                                                │
│                                                                              │
│ • Diagnostic: Optimization executed recently. Cooldown active (~18 min left).│
│ • Resources: 76.5% Free RAM (24.1 GB) | Uptime: 1h 40min                     │
│ • Sentinel: Active (every 30 min in user background)                         │
│ • Recommendation: No cleaning needed right now. System is running at nominal │
│ performance.                                                                 │
╰──────────────────────────────────────────────────────────────────────────────╯
                                                                                
  Option    Action & Scope                         Canonical Command (memorize)   Privilege   
 ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 
    [1]     🧪 Safe Simulation (Dry-Run)           zeroclean -n                   Safe      
    [2]     🍃 Partial User Cleanup                zeroclean partial              No Sudo    
    [3]     🚀 Full System Cleanup                 sudo zeroclean full            Root / Deep  
    [4]     📦 Package Caches (APT / Flatpak)      sudo apt clean                 Root      
    [5]     🐳 Prune Containers (Docker/Podman)    zeroclean containers           User      
    [6]     📜 Vacuum System Logs (> 7 days)       sudo journalctl --vacuum-7d    Root      
    [S]     📊 Real-Time Diagnostic                zeroclean status               Read-Only   
    [?]     📖 Didactic Guide & Explanations       zeroclean explain              Guide     
    [0]     🚪 Exit                                exit                           Return    

Choose an action:
```

---

## 🚀 Quick Start & Installation

### Option 1: One-Line Installer (Recommended)

```bash
git clone https://github.com/fabio-linhares/zero-clean.git
cd zero-clean
./install.sh
```

The installer:
- Copies `zeroclean` to `~/.local/bin/zeroclean`
- Creates a handy symlink: `zclean`
- Optionally enables the background periodic sentinel (`systemd --user`)

### Option 2: Run Directly (No installation needed)

ZeroClean is a single, zero-dependency Python script with fallback support:

```bash
python3 bin/zeroclean
```

---

## ⌨️ Command-Line Usage (Bypass the Menu)

For scripts, CI/CD or power users who already memorized the commands:

```bash
# Safe simulation without modifying any file
zeroclean -n

# Real-time health diagnostic in JSON
zeroclean status --json

# Non-root safe user cleanup (temps + user cache)
zeroclean partial

# Full system cleanup with package and log vacuum
sudo zeroclean full

# Purge package manager caches only (APT, DNF, Pacman, Flatpak)
zeroclean packages

# Prune stopped containers and dangling images
zeroclean containers

# Read didactic explanation of each metric and action
zeroclean explain
```

---

## ⏱️ Background Automation (Systemd Sentinel)

ZeroClean includes a lightweight background sentinel that runs every 30 minutes:

```bash
# Enable the background timer
systemctl --user enable --now zeroclean-auto.timer

# Check status
systemctl --user status zeroclean-auto.timer
```

### Why it doesn't cause lags or CPU spikes:
- Configured with `Nice=19` (lowest CPU scheduling priority) and `IOSchedulingClass=idle`.
- Evaluates health first: if the system has ample free memory or is in cooldown, the process exits in **< 20ms**.
- Only intervenes when resource pressure or idle fragmentation is confirmed.

---

## 🔒 Safety & Privacy First

- **Zero Telemetry / Zero Tracking:** ZeroClean does not communicate with external servers. All operations happen strictly on your local machine.
- **Root Separation:** Tasks that don't require root (cleaning user cache, container pruning) never ask for `sudo`.
- **Open File Descriptor Checking:** Inspects `/proc` to guarantee that temporary files currently mapped or open by running browsers, IDEs, or databases are never touched.

---

## 🇧🇷 Resumo em Português

O **ZeroClean** é uma ferramenta de higiene e otimização de sistema Linux moderna, inteligente e didática:
- **Avaliação de Necessidade:** Ao abrir, ele indica com cartões em cores (Verde, Amarelo ou Vermelho) se é necessário limpar o sistema ou se ele acabou de ser iniciado/otimizado.
- **Pedagogia Passiva:** Mostra o comando direto de terminal ao lado de cada opção para que o usuário decore a sintaxe de administração Linux com o uso diário.
- **Segurança Real:** Não executa deleções cegas; indexa descritores de arquivos abertos e sockets para evitar corrupção de programas abertos.
- **Multi-distro:** Funciona perfeitamente em Fedora (DNF), Ubuntu/Debian (APT), Arch (Pacman) e com Flatpaks e contêineres Docker/Podman.

---

## 👤 Author & Contact

* **Author:** Fábio Linhares
* **Website:** [https://fabiolinhares.com.br/](https://fabiolinhares.com.br/)
* **Email:** [fabiolinharez@gmail.com](mailto:fabiolinharez@gmail.com)
* **Standards:** Codebase headers adhere to the [ZeroNexus Header Standard](docs/PADRAO_CABECALHOS_CODIGO_FONTE.md).

---

## 📄 License

Distributed under the [MIT License](LICENSE). Copyright (c) 2026 Fábio Linhares.
