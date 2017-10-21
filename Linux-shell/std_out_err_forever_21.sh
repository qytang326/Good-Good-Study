#!/bin/bash
exec 2>testerror

echo "This is a test of redirecting all output"
echo "This is normal output"

exec 1>testout
echo "Go to testout"
echo "Go to testerr" >&2
