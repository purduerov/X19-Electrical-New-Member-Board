# X19 Electrical New Member Board

Onboarding PCB project for new members joining the Purdue ROV electrical subteam. This board introduces team design practices in KiCad, covering schematic capture, component selection, layout rules, and our Git/CI workflow.

## Getting Started

### 1. Clone the Repository
Clone recursively so the central component library submodule is included:
```bash
git clone --recursive https://github.com/purduerov/X19-Electrical-New-Member-Board.git
cd X19-Electrical-New-Member-Board
```

If you already cloned without `--recursive`, initialize the submodule:
```bash
git submodule update --init --recursive
```

### 2. Configure Git Filters and Hooks
Run the filter setup script to prevent local KiCad metadata (such as window coordinates and zoom settings) from creating git diff noise and merge conflicts:

- **Windows (PowerShell):**
  ```powershell
  .\setup_git_filters.ps1
  ```
- **macOS / Linux:**
  ```bash
  ./setup_git_filters.sh
  ```

### 3. Open the Project
You can open `X19-Electrical-New-Member-Board.kicad_pro` directly in KiCad, or run the launcher script:
- **Windows:** Double-click `LAUNCH_KICAD.bat`
- **macOS / Linux:** Run `./LAUNCH_KICAD.sh`

The launcher script updates the `purdue-rov-kicad-lib` submodule to latest `master` before launching KiCad.

## Local Validation (KiBot / Docker)

To run electrical rules checks (ERC), design rules checks (DRC), and generate manufacturing outputs locally:

- **Windows:**
  ```powershell
  .\run_validation.ps1
  ```
- **macOS / Linux:**
  ```bash
  ./run_validation.sh
  ```

Outputs (PDF schematics, interactive BOMs, and Gerbers) are generated in `Generated_Outputs/`.

## Design Guidelines

- Isolation and spacing rules are configured in `custom_rules.kicad_dru`.
- Keep appropriate clearance (minimum 2.0 mm) between high-power thruster traces and 3.3V/5V logic nets.
- Use parts from the central library (`libs/purdue-rov-kicad-lib`). If a new component is needed, follow the library contribution process in the submodule.
