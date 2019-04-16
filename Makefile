SHELL         := /bin/bash 
UNAME_S       := $(shell uname -s)
CURR_BRANCH   := $(shell git rev-parse --abbrev-ref HEAD)
DEPLOY_BRANCH := master
ifeq ($(UNAME_S),Darwin)
VENVW         := $(shell which virtualenvwrapper.sh)
else
VENVW         := /usr/share/virtualenvwrapper/virtualenvwrapper.sh
endif

ifeq ($(UNAME_S),Darwin)
.PHONY: macos_install
macos_install:
	brew install python3 
	pip3 install virtualenv virtualenvwrapper
	@grep -qxF 'VIRTUALENVWRAPPER_PYTHON' ~/.bashrc || echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3' >> ~/.bashrc
	@grep -qxF '/usr/local/bin/virtualenvwrapper.sh' ~/.bashrc || echo 'source /usr/local/bin/virtualenvwrapper.sh' >> ~/.bashrc

.PHONY: macos_setup
macos_setup: macos_install
	@source $(VENVW); \
	lsvirtualenv  | grep -x dsx-docs ||  mkvirtualenv -r requirements.txt  dsx-docs
	echo
	echo "Setup complete. To view the docs, run:  make serve"
endif
	
.PHONY: update
update:
	@source $(VENVW); \
	workon dsx-docs; \
	pip install --upgrade -r requirements.txt; \
	echo "Python environment is up to date"
	

.PHONY: serve
serve:
	@source $(VENVW); \
	workon dsx-docs; \
	mkdocs serve


.PHONY: deploy
deploy: 
	@if [[ "$(CURR_BRANCH)" != "$(DEPLOY_BRANCH)" ]]; then \
		echo "You are on branch '$(CURR_BRANCH)'." \
		echo "The docs can only be deployed from the $(DEPLOY_BRANCH) branch"; \
		exit 1;\
	fi
	@if [[ 0 == $$(git diff-index --quiet HEAD --) ]]; then \
		@source $(VENVW); \
		workon dsx-docs; \
		mkdocs gh-deploy; \
	else \
		echo "Cannot deploy. There are uncommitted files in the git repo"; \
		echo "Please commit all changes"; \
	fi

