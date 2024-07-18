#!/bin/bash

# Fast fail the script on failures.
set -e -m

dart pub global activate coverage

firebase emulators:start --project dart-firebase-admin --only firestore,auth &

dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test &

jobs -l

dart pub global run coverage:collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --scope-output=foo &

jobs -l

fg %2


