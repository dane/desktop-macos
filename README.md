# desktop-macos

The following configures a MacOS installation. The following applications must
be installed beforehand because they are not available via Homebrew:
- [Things](https://culturedcode.com/things/mac/)
- [dockutil](https://github.com/kcrawford/dockutil/releases)
- [hclfmt](https://github.com/fatih/hclfmt)

The `setup` script must be run first to install Xcode command-line tools,
Homebrew, and Ansible. `make` will be called immediately after. `make github` is
not run by default because it requires a Github personal access token. This can
be run after `setup`.
