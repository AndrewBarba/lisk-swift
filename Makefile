.PHONY: docs

clean:
	rm -rf Lisk.xcodeproj/xcuserdata
	rm -rf Lisk.xcodeproj/project.xcworkspace/xcuserdata

deps:
	swift build
	swift package generate-xcodeproj

docs:
	jazzy \
		--clean \
		--author "Andrew Barba" \
		--author_url https://abarba.me \
		--github_url https://github.com/AndrewBarba/lisk-swift \
		--xcodebuild-arguments -scheme,Lisk-Package \
		--module Lisk \
		--output docs
