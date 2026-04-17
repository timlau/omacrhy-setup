# Setup scripts for doing user specific setup on omarchy

This codebase is a personalized **post-installation automation framework** designed for the Omarchy Linux environment. It streamlines the setup of applications and configurations through a modular script system.

### Key Components:
*   **`setup`**: The main entry point. It iterates through and executes all shell scripts located in the `scripts/` directory in alphabetical order.
*   **`scripts/`**: Contains task-specific scripts (e.g., `00-bitwarden.sh`, `00-fish.sh`). The numeric prefix (like `00-` or `99-`) determines the execution order.
*   **`add-script NAME`**: A helper utility to quickly generate a new installation script. It creates a template that uses a custom command `omarchy-pkg-add` to install a package.
*   **`data/`**: Stores configuration data, such as `packages`, which lists miscellaneous software to be installed by `00-misc.sh`.

### Workflow:
The system relies on a set of custom environment commands (likely `omarchy-pkg-add` and `omarchy-pkg-missing`) to handle the actual package management. When you run `./setup`, it provides a styled output (using `gum`) and sequentially configures your system by installing browsers, tools, and finally applying dotfiles via `99-dotfiles.sh`.

The order the scripts run in can be adjusted by changing the numeric prefix of the scripts in the `scripts/` directory.
