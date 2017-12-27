.PHONY: docs

docs:
	jazzy \
		--clean \
		--author "Andrew Barba" \
		--author_url https://abarba.me \
		--github_url https://github.com/AndrewBarba/lisk-swift \
		--xcodebuild-arguments -scheme,Lisk \
		--module Lisk \
		--output Docs