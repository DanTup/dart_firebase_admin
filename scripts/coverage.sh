#!/bin/bash

# Fast fail the script on failures.
set -e

dart pub global activate coverage

firebase emulators:start --project dart-firebase-admin --only firestore,auth &

# dart test --coverage=coverage
dart pub run test  --coverage=coverage
