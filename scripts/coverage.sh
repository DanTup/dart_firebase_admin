#!/bin/bash

# Fast fail the script on failures.
set -e -m

dart pub global activate coverage

firebase emulators:exec --project dart-firebase-admin --only firestore,auth "dart run bin/throw.dart"
