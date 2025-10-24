# App-level Makefile for local and CI usage

.PHONY: analyze test pub-get build-debug

analyze:
	flutter pub get
	flutter analyze

test:
	flutter pub get
	CI=true flutter test

pub-get:
	flutter pub get

build-debug:
	flutter pub get
	flutter build apk --debug
