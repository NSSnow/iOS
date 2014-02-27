tests:
	xcodebuild -workspace NSSnow.xcworkspace -scheme NSSnow -sdk iphonesimulator test | xcpretty -c; exit ${PIPESTATUS[0]}

