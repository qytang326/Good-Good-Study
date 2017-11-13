NumAssets = 3;
ExpReturn = [0.000540 0.000275 0.000236]; 
ExpCovariance = 0.0001*[5.27    2.80    1.74;
                 2.80    4.26    1.67;
                 1.74    1.67    2.90 ];
NumPorts =5;
PVal = 1; 
AssetMin = 0;
AssetMax = [0.5 0.9 0.8];
GroupA = [1 0 0];
GroupB = [0 1 1];
GroupMax = [0.50,0.8];
AtoBmax = 1.5;
ConSet = portcons('PortValue', PVal, NumAssets,'AssetLims',... 
AssetMin, AssetMax, NumAssets, 'GroupComparison',GroupA, NaN,... 
AtoBmax, GroupB,GroupMax );
portopt(ExpReturn, ExpCovariance,...    
NumPorts, [], ConSet)
