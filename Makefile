run: dev/bin/jupyter
	$< notebook

dev/bin/jupyter: install

install: bash_kernel

bash_kernel: dev/bin requirements.txt
	PATH=$< python -m bash_kernel.install

requirements.txt: dev/bin
	PATH=$< pip install -r $@

dev/bin:
	test -d $@ || virtualenv -p python3 dev
