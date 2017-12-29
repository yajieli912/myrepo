setup:
	python3 -m venv ~/.myrepo

install:
	pip install -r requirements.txt
	pip install nbval

test:
	python -m pytest -vv --cov=myrepolib tests/*.py
	#PYTHONPATH=. && py.test --nbval-lax notebooks/*.ipynb
	py.test --nbval MLAssignment.ipynb

lint:
	pylint --disable=R,C myrepolib

all: install lint test
     pip install matplotlib sympy
