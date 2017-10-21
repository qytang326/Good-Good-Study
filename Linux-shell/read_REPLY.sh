#!/bin/bash
read -p "Enter your name:" 
read -p "Enter your age:" age
echo "Hello $REPLY"
echo "That makes you over $[ $age * 365 ]"

