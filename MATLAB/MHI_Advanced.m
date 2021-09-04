%Known Values
hfg = 2492000;  %Unit:J/kg
phi3 = 100;
madot = 0.04;    % Unit:kg/s
Qdot = 10500;  % Unit:watt

a = 0;
for rh=5:5:100
    a = a+1;
    b = 0;
    
    for wval=0.001:0.001:0.025
        b = b+1;
        
        [T1 w1 phi1 h1 v1 Twb1 P1] = Psychrometricsnew('phi',rh,'w',wval)
        
       w2 = w1;         
       
       w=0;     %Assumption
       w3dash = 0.050;
       
       while (abs(w3dash-w)>0.001)
       
           w = w+0.001;
       A = [2+w-w1 w1-1-w; 1 w1-w-1];
       B = [h1; Qdot/madot];
       
       X = A\B;
       h = X(1);
       h3 = X(2);
    
       [T3 w3dash phi3dash h3dash v3 Twb3 P3]=Psychrometricsnew('h',h3,'phi',100)
       
       
       end
       
       MHI = (madot*hfg*(w1-w))/Qdot;
       
       MT(a,b) = T1
   MW(a,b) = w1
   MMHI(a,b) = MHI
   
    end
end

surfc(MT,MW,MMHI)
view(0,90)
colorbar;
   
xlabel('Temperature')    %Labelling the x-axis
ylabel('Humidity Ratio') %Labelling the y-axis