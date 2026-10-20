#!/bin/bash
# Build the IG once with the IG Publisher in input-cache/.
# Extra arguments are passed through to the publisher.
set -uo pipefail

publisher=./input-cache/publisher.jar

if [ ! -f "$publisher" ]; then
  echo "IG Publisher not found at $publisher. Run ./_updatePublisher.sh first." >&2
  exit 1
fi

txoption=""
if ! curl -sSf --max-time 10 https://tx.fhir.org > /dev/null 2>&1; then
  echo "Terminology server unreachable: building offline (-tx n/a)"
  txoption="-tx n/a"
fi

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"
# shellcheck disable=SC2086
java -Xmx6g -jar "$publisher" -ig . $txoption "$@"
