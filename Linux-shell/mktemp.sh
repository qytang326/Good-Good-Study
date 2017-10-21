#!/bin/bash
tempfile=$(mktemp test.XXXXXX)
exec 3>$tempfile
echo "This script writes to temp file $tempfile"

echo "First Line" >&3
echo "Second Line">&3
echo "Third Line">&3

