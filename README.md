# X19 Electrical New Member Board

Onboarding PCB project for new Purdue ROV electrical team members. Integrates power regulation, an STM32 microcontroller, sensors, and communication buses.

## Getting Started

### 1. Clone the Repository
Clone recursively to ensure the central component library is initialized:
```bash
git clone --recursive https://github.com/purduerov/X19-Electrical-New-Member-Board.git
cd X19-Electrical-New-Member-Board
```

### 2. Launch KiCad
You can open `X19-Electrical-New-Member-Board.kicad_pro` directly in KiCad, or run the 1-click launcher script:
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
- **macOS / Linux:** Run `./libs/purdue-rov-kicad-lib/LIBRARY_MANAGER.sh`

## Schematic Sheet Architecture

The board uses a hierarchical schematic design structured across sub-sheets:
- `X19-Electrical-New-Member-Board.kicad_sch`: Root top-level sheet.
- `power.kicad_sch`: Voltage regulation circuitry (5V buck converter, 3.3V LDO).
- `snesors.kicad_sch`: Sensor interfaces and environmental telemetry.
- `STM.kicad_sch`: STM32 MCU, clock crystal, bypass capacitors, SWD programming header, and boot logic.

## Automated CI/CD & DevOps Preflight Checks

All CI/CD automation and tooling are centralized in [`purduerov/pcb-devops`](https://github.com/purduerov/pcb-devops):
1. **Automated Git Clean Filters:** Configured automatically by `.githooks/pre-commit` to prevent viewport/zoom merge noise.
2. **KiCad Symbol Linting:** Validates mandatory fields (`MPN`, `Manufacturer`, `Category`, `DigiKey`, `Datasheet`, `Temp_Range`) on all library components.
3. **ERC & DRC Validation:** Executes Electrical and Design Rules Checks via KiBot in GitHub Actions.
4. **Artifact Generation:** Automatically exports Schematic PDFs, Board Layout PDFs, and Interactive HTML BOMs on every pull request.

