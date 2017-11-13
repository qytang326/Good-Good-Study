function F = CEqfun(x,a,b)
F = [a*x(1) - x(2) - exp(-x(1));
      -x(1) + b*x(2) - exp(-x(2))];