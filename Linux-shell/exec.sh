#!/bin/bash
exec 3>  test3out
echo "This should display on the monitor"
echo "This should be stored in the file" >&3
echo "Back on monitor"
exec 3>>  test3out
echo "This should display on the monitor"
echo "This should be added the file" >&3
echo "Back on monitor"
