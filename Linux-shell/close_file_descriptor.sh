#!/bin/bash
exec 3>test_file
echo "This is a test line of data" >&3
exec 3>&-
echo "This won't work." >&3
