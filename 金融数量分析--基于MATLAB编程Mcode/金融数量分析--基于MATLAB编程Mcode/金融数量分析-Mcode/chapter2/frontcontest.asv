%%
ExpReturn = [0.000540 0.000275 0.000236]; 
ExpCovariance =0.0001*[5.27    2.80    1.74;
                 2.80    4.26    1.67;
                 1.74    1.67    2.90 ];
NumPorts =10;
[PortRisk, PortReturn, PortWts] = frontcon(ExpReturn,ExpCovariance, NumPorts)
%%
ExpReturn = [0.000540 0.000275 0.000236]; 
ExpCovariance = 0.0001*[5.27    2.80    1.74;
                 2.80    4.26    1.67;
                 1.74    1.67    2.90 ];
NumPorts =10;
AssetBounds=[0,0,0;0.5,0.5,0.5]
[PortRisk, PortReturn, PortWts] = frontcon(ExpReturn,ExpCovariance, NumPorts,[],AssetBounds)
%%
ExpReturn = [0.000540 0.000275 0.000236]; 
ExpCovariance = 0.0001*[5.27    2.80    1.74;
                 2.80    4.26    1.67;
                 1.74    1.67    2.90 ];
NumPorts =10;
Groups=[1,0,0;
        0,1,1];
GroupBounds=[0,0.5;0,1];     
[PortRisk, PortReturn, PortWts] = frontcon(ExpReturn,ExpCovariance, NumPorts,[],[],Groups)

