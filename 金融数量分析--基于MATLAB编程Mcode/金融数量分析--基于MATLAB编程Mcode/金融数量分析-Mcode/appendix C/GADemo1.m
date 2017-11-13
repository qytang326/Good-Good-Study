function [X,FVAL,REASON,OUTPUT,POPULATION,SCORES] =  GADemo1
%%   This is an auto generated M file to do optimization with the Genetic Algorithm and
%    Direct Search Toolbox. Use GAOPTIMSET for default GA options structure.

%%Fitness function
fitnessFunction = @GAobjfun1;
%%Number of Variables
nvars = 2 ;
%Linear inequality constraints
Aineq = [];
Bineq = [];
%Linear equality constraints
Aeq = [];
Beq = [];
%Bounds
LB = [];
UB = [];
%Nonlinear constraints
nonlconFunction = @GaConfun;
%Start with default options
options = gaoptimset;
%%Modify some parameters
options = gaoptimset(options,'MutationFcn' ,{ @mutationgaussian 1  1  });
options = gaoptimset(options,'Display' ,'off');
options = gaoptimset(options,'PlotFcns' ,{ @gaplotbestf @gaplotbestindiv });
%Set the states of random number generators
rand('state',[0.29901 ; 0.083894 ; 0.99927 ; 0.33314 ; 0.53815 ; 0.48539 ; 0.88538 ; 0.31101 ; 0.57405 ; 0.2643 ; 0.68191 ; 0.98536 ; 0.60708 ; 0.69837 ; 0.98953 ; 0.32555 ; 0.92429 ; 0.71165 ; 0.38552 ; 0.0097387 ; 0.0075905 ; 0.61386 ; 0.77373 ; 0.7406 ; 0.94044 ; 0.55742 ; 0.3987 ; 0.78401 ; 0.51979 ; 0.92262 ; 0.55007 ; 0.54655 ; 1.1102e-016 ; 3.9968e-015 ; 3.2582e-007 ]);
randn('state',[2753740601 ; 618774148 ]);
%%Run GA
[X,FVAL,REASON,OUTPUT,POPULATION,SCORES] = ga(fitnessFunction,nvars,Aineq,Bineq,Aeq,Beq,LB,UB,nonlconFunction,options);
