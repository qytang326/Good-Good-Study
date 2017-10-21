#!/bin/bash
echo -n "Enter your name:"
read name
read -p "Enter your age:" age
echo "Hello $name"
echo "That makes you over $[ $age * 365 ]"

