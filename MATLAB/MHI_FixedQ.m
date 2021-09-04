phi2 = 100;    %Known Condition
Qdot = 10500   %unit: W
madot = 0.04;%unit: kg/s
hfg = 2492000;   %Unit: J/kg

a = 0;
for rh = 5:5:100
    a = a+1;
    b = 0;
    
    for wval = 0.001:0.001:0.025
        b = b+1;
        
        [T1,w1,phi1,h1,v,Twb1,P]=Psychrometricsnew('w',wval,'phi',rh)    %Calculating properties of inlet air
        
        h2 = h1 - (Qdot/madot); 
        
        [T2,w2,phi2,h2,v2,Twb2,P2]=Psychrometricsnew('phi',100,'h',h2)
        
        harvestwater = madot*(w1-w2);   %mass of water harvested in kg/s
        
        MHI = (hfg*(w1-w2)*madot)/Qdot;
 
      MT(a,b) = T1
   MW(a,b) = w1
   MMHI(a,b) = MHI
   
    end
end

surfc(MT,MW,MMHI)
view(0,90)

colorbar
xlabel('Temperature') %labelling x-axis
ylabel('Humidity ratio') %labelling y-axis

        