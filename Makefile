# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build


GIT_VERSION=$(shell git log -1 --format="%h")

DOCKER_REPO=registry.digitalocean.com/workspace-login-app
DOCKER_DOC=$(DOCKER_REPO)/docs-site
DOCKER_VERSION_TAG=1.0.0-alpha-$(GIT_VERSION)


# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

docker: html
	docker build -t $(DOCKER_DOC):latest -t $(DOCKER_DOC):$(DOCKER_VERSION_TAG) .

docker-push: docker
	docker push $(DOCKER_DOC):latest && docker push $(DOCKER_DOC):$(DOCKER_VERSION_TAG)

deploy: docker-push
	helm upgrade workspace-docs-dev docs-k8s/ --set image.tag=$(DOCKER_VERSION_TAG)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
