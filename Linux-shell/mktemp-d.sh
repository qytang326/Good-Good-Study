#!/bin/bash
tempdir=$(mktemp -dt dir.XXXXXX)
cd $tempdir
tempfile1=$(mktemp temp.XXXXXX)
tempfile2=$(mktemp temp.XXXXXX)
exec 7>$tempfile1
exec 8>$tempfile2
echo "Sending data to directory $tempdir"
echo "First Line to $tempfile1" >&7
echo "Second Line $tempfile1">&7
echo "Third Line $tempfile2">&8
