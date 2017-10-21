#!/bin/bash
func1() {
	echo "Trying to display a non-existent file"
	ls -l badfile
}
echo "Testing the function"
func1
echo "The exit status is :$?"

func2() {
	echo "Trying to display a non-existent file"
	ls -l badfile
	echo "another function"
}
echo "Testing the function"
func2
echo "The exit status is :$?"
