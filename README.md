# Purdue ROV KiCad Board Template

This is the central base template for starting any new hardware project at Purdue ROV.

## Features

- **Zero-Setup Library Loading**: Automatically references the central symbol and footprint libraries via the submodule in `libs/purdue-rov-kicad-lib`.
- **Merge Conflict Prevention**: Pre-configured `.gitattributes` to filter out volatile KiCad UI metadata before commits.
- **CI/CD Integration Ready**: Workflows configured to run automated Electrical Rules Check (ERC), Design Rules Check (DRC), and generate fabrication/assembly exports.

## How to Start a New Project

1. Click the **"Use this template"** button at the top of the GitHub repository.
2. Name your new repository (e.g., `depth-sensor-board`) and click **Create repository**.
3. Clone your new repository locally using the recursive flag to pull in the central library submodule:
   ```bash
   git clone --recursive https://github.com/purduerov/YOUR-BOARD-REPO.git
   ```
4. Open the template `.kicad_pro` project in KiCad and rename the files to match your project name.

## Local Git Clean Filter Setup (One-time Setup)

To ensure volatile KiCad metadata (like window positions, zoom levels, and time stamps) does not cause git merge conflicts, run the following command once on your local machine:

```bash
git config --global filter.kicad-clean.clean "sed -E '/(descr|date|time|uuid|view)/d'"
```

## Local One-Click Validation (Mock Jobset)

Instead of waiting for the GitHub Action to run, you can test your board locally with a single command. This runs the central KiBot script (ERC, DRC, and exports) inside a Docker container:

*   **Windows**: Run `.\run_validation.ps1` in PowerShell.
*   **Linux/macOS**: Run `./run_validation.sh` in your terminal.

All schematic PDFs, Interactive BOMs, and Gerbers will generate in the `Generated_Outputs/` folder.

## Custom DRC Rules

This template includes a [custom_rules.kicad_dru](file:///C:/Users/aman/Documents/PCB%20Design/purdue%20automation/board-template/custom_rules.kicad_dru) file that pre-defines electrical isolation boundaries. For example, it enforces a minimum **2.0mm clearance** between high-power thruster lines (`Power_Thruster` netclass) and low-voltage logic (`Logic_3V3` netclass) to prevent condensation or noise faults.


## Adding a Custom Central Part

If you need a new symbol or footprint:
1. Open the submodule repository `libs/purdue-rov-kicad-lib` (or clone it separately).
2. Save your new symbol/footprint to the central library.
3. Commit and push to a pull request.
4. Once merged, update the submodule in your project repository:
   ```bash
   git submodule update --remote --merge
   ```
