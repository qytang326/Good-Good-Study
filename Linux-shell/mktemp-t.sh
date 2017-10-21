#!/bin/bash
tempfile=$(mktemp -t test.XXXXXX)
echo "This script writes to temp file $tempfile"

echo "First Line" >$tempfile
echo "Second Line">>$tempfile
echo "Third Line">>$tempfile


