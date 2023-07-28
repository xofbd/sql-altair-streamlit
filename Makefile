SHELL := /bin/bash
VENV := venv

.PHONY: all
all: clean run 

$(VENV): requirements.txt
	rm -rf $@
	python3 -m venv $@
	source $@/bin/activate && pip install -r $<

requirements.txt: requirements.in
	rm -rf $(VENV)
	python3 -m venv $(VENV)
	pip install -r $<
	pip freeze > $@

.PHONY: run
run: $(VENV)
	streamlit run app/app.py

.PHONY: clean
clean:
	rm -rf $(VENV)


