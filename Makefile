.SILENT:
.PHONY: all

validate:
	docker pull --quiet renovate/renovate:slim
	docker run --rm \
		--platform linux/amd64 \
		-v $(CURDIR):/work \
		-w /work \
		-e RENOVATE_TOKEN=$${GITHUB_TOKEN} \
		-i renovate/renovate:slim \
		renovate-config-validator *.json*

