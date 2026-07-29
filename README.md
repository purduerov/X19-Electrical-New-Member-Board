# Purdue ROV X19 Electrical New Member Board

This repository contains the KiCad schematic and PCB layout for the Purdue ROV X19 Electrical New Member Onboarding Board project.

---

## ⚡ Recommended Daily Workflow: 1-Click KiCad Launcher

To ensure your local library is **always 100% up-to-date with new parts added by teammates** without ever needing to run manual Git commands:

### 🎯 **Double-Click `LAUNCH_KICAD.bat` to Start Work**
* **Windows:** Double-click **`LAUNCH_KICAD.bat`** in your project folder.
* **Mac / Linux:** Double-click **`LAUNCH_KICAD.sh`** (or run `./LAUNCH_KICAD.sh` in terminal).

#### **What this script does for you automatically:**
1. **Auto-Fetches Central Library Parts (0.5 seconds):** Silently connects to `purdue-rov-kicad-lib` on GitHub and pulls any new symbols, footprints, or 3D models added by teammates while you were away.
2. **Eliminates Missing Symbol Question Marks:** Guarantees you never open KiCad with outdated or missing component definitions.
3. **Launches KiCad:** Immediately opens `board-template.kicad_pro` in KiCad.

---

## 🔄 How Automated Library Syncing Works

Even if you are working solo on your board repository and rarely run `git pull`, your central component library stays updated automatically through **3 layers of protection**:

1. 🚀 **On KiCad Launch (`LAUNCH_KICAD.bat`):** Pulls the latest library symbols & footprints before opening your project.
2. 🔄 **On Git Commit (`.githooks/pre-commit`):** Automatically fetches latest library commits right before completing any commit, updating your project's submodule pointer automatically.
3. ☁️ **In GitHub Cloud (`auto-update-submodule.yml`):** GitHub Actions automatically syncs the library submodule on daily schedule or whenever new library parts are published.

---

## 🚀 How to Clone & Work on the Board

1. Clone the repository recursively:
   ```bash
   git clone --recursive https://github.com/purduerov/X19-Electrical-New-Member-Board.git
   ```
2. Configure local Git clean filters and hooks:
   * **Windows (PowerShell):** `.\setup_git_filters.ps1`
   * **Linux / macOS:** `./setup_git_filters.sh`
3. Double-click `LAUNCH_KICAD.bat` to begin working on your board!

---

## ➕ Adding Parts to the Central Library

To add a new component downloaded online (SnapEDA, DigiKey, Ultra Librarian, LCSC, etc.):
1. Open `libs/purdue-rov-kicad-lib` and double-click **`IMPORT_PART_WIZARD.bat`** (or `IMPORT_PART_WIZARD.sh`).
2. Use the 1-Click Desktop GUI / Downloads Watcher to import, validate compliance, and push to master!
