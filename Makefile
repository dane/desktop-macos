.PHONY: *
all: shell homedir packages macos

shell:
	@echo "The following sudo request will run the shell playbook"
	@sudo ansible-playbook shell.yaml

homedir:
	@ansible-playbook homedir.yaml

packages:
	@source ~/.zshenv
	@ansible-playbook packages.yaml

macos:
	@ansible-playbook macos.yaml

github:
	@ansible-playbook github.yaml

github-enterprise:
	@ansible-playbook github-enterprise.yaml
