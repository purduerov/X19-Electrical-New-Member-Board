# X19 Electrical New Member Board

Onboarding PCB project for new members joining the Purdue ROV electrical subteam. This board introduces team design practices in KiCad, covering schematic capture, component selection, layout rules, and our Git/CI workflow.

## Schematic Architecture

The project is divided into modular hierarchical sheets:
- `power.kicad_sch`: Voltage regulation (LM2596 buck converter, 3.3V LDO), power rail distribution, and INA260 power/current monitoring.
- `snesors.kicad_sch`: Sensor interfaces, ADT7410 temperature sensor, leak probe detector circuitry, and JST-GH telemetry connectors.
- `STM.kicad_sch`: STM32F0 microcontroller core, MAX7375 oscillator, reset circuitry, SWD programming header, and USB Type-C interface.

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
  .\scripts\setup_git_filters.ps1
  ```
- **macOS / Linux:**
  ```bash
  ./scripts/setup_git_filters.sh
  ```

### 3. Open the Project
You can open `X19-Electrical-New-Member-Board.kicad_pro` directly in KiCad, or run the launcher script:
- **Windows:** Double-click `LAUNCH_KICAD.bat`
- **macOS / Linux:** Run `./LAUNCH_KICAD.sh`

The launcher script updates the `purdue-rov-kicad-lib` submodule to latest `master` before launching KiCad.

## Central Component Library & Manager GUI

The project links to the central `purdue-rov-kicad-lib` submodule mapped across 6 categories in `sym-lib-table` and `fp-lib-table`:
- `rov_passives`: Resistors, capacitors, inductors, crystals
- `rov_power`: Voltage regulators, buck/boost converters, MOSFETs, diodes
- `rov_logic`: MCUs, logic ICs, op-amps, drivers, level shifters
- `rov_connectors`: Power terminals, XT60, headers, USB, JST connectors
- `rov_sensors`: IMUs, temperature, pressure sensors
- `rov_mech`: Mounting holes, standoffs, test points

### Launching the Library Manager GUI
To browse parts, inspect footprints, edit properties, or add/delete components in the shared library:
- **Windows:** Double-click `libs\purdue-rov-kicad-lib\LIBRARY_MANAGER.bat`
- **macOS / Linux:** Run `./libs/purdue-rov-kicad-lib/LIBRARY_MANAGER.sh` (or `python3 libs/purdue-rov-kicad-lib/scripts/library_manager_gui.py`)


## Local Validation (KiBot / Docker)

To run electrical rules checks (ERC), design rules checks (DRC), and generate manufacturing outputs locally:

- **Windows:**
  ```powershell
  .\scripts\run_validation.ps1
  ```
- **macOS / Linux:**
  ```bash
  ./scripts/run_validation.sh
  ```


Outputs (PDF schematics, interactive BOMs, and Gerbers) are generated in `Generated_Outputs/`.

## Design Guidelines

- Isolation and spacing rules are configured in `custom_rules.kicad_dru`.
- Keep appropriate clearance (minimum 2.0 mm) between high-power thruster traces and 3.3V/5V logic nets.
- Use parts from the central library (`libs/purdue-rov-kicad-lib`). If a new component is needed, follow the library contribution process in the submodule.

