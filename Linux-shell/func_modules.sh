#!/bin/bash
. ./myfuncs
value1=10
value2=5

echo "Result of multipling them is: $(multem $value1 $value2)"
echo "Result of adding them is: $(addem $value1 $value2)"
echo "Result of dividing them is: $(divem $value1 $value2)"
