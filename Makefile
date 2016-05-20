.PHONY: requirements.txt

run: dev/bin/jupyter
	$< notebook

dev/bin/jupyter: requirements.txt bash_kernel

bash_kernel: dev/bin/python requirements.txt
	$< -m bash_kernel.install

dev/bin/python: dev/bin

requirements.txt: dev/bin/pip
	$< install -r $@

dev/bin/pip: dev/bin

dev/bin:
	virtualenv -p python3 dev
