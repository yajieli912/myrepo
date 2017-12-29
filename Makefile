setup:
	python3 -m venv ~/.myrepo

install:
	pip install -r requirements.txt

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	PYTHONPATH=. && py.test --nbval-lax notebooks/MLAssignment.ipynb
	#py.test --nbval MLAssignment.ipynb
build-dists:
	rm -rf dist/
	$(PYTHON) setup.py sdist
	$(PYTHON) setup.py bdist_wheel

release: build-dists
	twine upload dist/*

lint:
	pylint --disable=R,C myrepolib

all: install lint test

install-test-deps:
	pip install matplotlib sympy
	pip install nbval
