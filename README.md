# Purdue ROV X19 Electrical New Member Board

This repository contains the KiCad schematic and PCB layout for the Purdue ROV X19 Electrical New Member Onboarding Board project.

---

## ✨ Features & Setup

*   **Categorized Symbol & Footprint Libraries**: References the 6 central library categories (`rov_passives`, `rov_power`, `rov_logic`, `rov_connectors`, `rov_sensors`, `rov_mech`) via `libs/purdue-rov-kicad-lib`.
*   **Automated Submodule Sync**: Includes Git hooks (`.githooks/post-merge`, `.githooks/post-checkout`) and GitHub Actions workflows (`auto-update-submodule.yml`) to keep central component libraries auto-synced.
*   **Volatile Metadata Filter**: Configured `.gitattributes` to clean GUI metadata (zoom, scroll) and prevent git merge conflicts.

---

## 🚀 How to Clone & Work on the Board

1. Clone the repository recursively:
   ```bash
   git clone --recursive https://github.com/purduerov/X19-Electrical-New-Member-Board.git
   ```
2. Configure local Git clean filters and hooks:
   * **Windows (PowerShell):** `.\setup_git_filters.ps1`
   * **Linux / macOS:** `./setup_git_filters.sh`
3. Open `board-template.kicad_pro` in KiCad to begin working on your schematic and board layout!

---

## 🔄 Adding Parts to the Central Library

To add a new component downloaded online:
1. Open `libs/purdue-rov-kicad-lib` and double-click **`IMPORT_PART_WIZARD.bat`** (or `IMPORT_PART_WIZARD.sh`).
2. Use the 1-Click Desktop GUI / Downloads Watcher to import, validate compliance, and push to master!
