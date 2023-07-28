SHELL := /bin/bash
VENV := .venv
VENV_RUN := poetry run

.PHONY: all
all: clean run 

poetry.lock: pyproject.toml
	poetry lock

$(VENV): poetry.lock
	poetry install

.PHONY: run
run: $(VENV)
	source config && $(VENV_RUN) streamlit run app/app.py

.PHONY: clean
clean:
	rm -rf $(VENV)
