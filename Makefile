SHELL := /bin/bash
VENV := .venv
VENV_RUN := poetry run

.PHONY: all
all: clean run 

poetry.lock: pyproject.toml
	poetry lock

requirements.txt: poetry.lock
	poetry export --format=requirements.txt > $@

$(VENV): poetry.lock
	poetry install

.PHONY: run
run: $(VENV)
	source config && $(VENV_RUN) streamlit run app/app.py

.PHONY: lint
lint: $(VENV)
	$(VENV_RUN) flake8 app

.PHONY: clean
clean:
	rm -rf $(VENV)
