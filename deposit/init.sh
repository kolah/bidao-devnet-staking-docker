#!/bin/bash

set -e

files=$(shopt -s nullglob; echo /validator_keys/*)
if (( ${#files} ))
then
  echo "It was already initialized"
  exit 0
fi

echo "Initializing..."
if [ -z "${NUMBER_OF_VALIDATORS}" ]; then
  echo "NUMBERS_OF_VALIDATORS is not set"
  exit 1
fi

if [ -z "${EXECUTION_ADDRESS}" ]; then
  echo "EXECUTION_ADDRESS is not set"
  exit 1
fi

if [ -z "${KEYSTORE_PASSWORD}" ]; then
  echo "KEYSTORE_PASSWORD is not set"
  exit 1
fi

mkdir -p /validator_keys
/interact.sh
