#!/bin/bash
# Download the HL7 FHIR IG Publisher into input-cache/.
# Usage: ./_updatePublisher.sh [version]   (default: latest release)
set -euo pipefail

version="${1:-${PUBLISHER_VERSION:-latest}}"
input_cache_path=./input-cache
publisher_jar=publisher.jar

if [ "$version" = "latest" ]; then
  url="https://github.com/HL7/fhir-ig-publisher/releases/latest/download/$publisher_jar"
else
  url="https://github.com/HL7/fhir-ig-publisher/releases/download/$version/$publisher_jar"
fi

mkdir -p "$input_cache_path"
echo "Downloading IG Publisher ($version) from $url"
curl -fsSL --retry 3 -o "$input_cache_path/$publisher_jar" "$url"
echo "Saved to $input_cache_path/$publisher_jar"
