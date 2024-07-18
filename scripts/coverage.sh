#!/bin/bash

# Fast fail the script on failures.
set -e

dart pub global activate coverage

firebase emulators:exec --project dart-firebase-admin --only firestore,auth "dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test & dart pub global run coverage:collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --scope-output=foo"

format_coverage --lcov --in=coverage --out=coverage.lcov --packages=.dart_tool/package_config.json --report-on=lib
