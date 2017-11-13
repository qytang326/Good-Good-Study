ExpReturn = [0.000540 0.000275 0.000236]; 
ExpCovariance = 0.0001*[5.27    2.80    1.74;
                 2.80    4.26    1.67;
                 1.74    1.67    2.90 ];
PortWts=1/3*ones(1,3);
[PortRisk, PortReturn] = portstats(ExpReturn, ExpCovariance,PortWts)
