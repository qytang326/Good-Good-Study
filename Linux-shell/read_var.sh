#!/bin/bash
read -p "Enter your name:" first last
read -p "Enter your age:" age
echo "Hello $last $first"
echo "That makes you over $[ $age * 365 ]"

