a = 0;
hfg = 2492000;   %Unit: J/kg (Converting everything into SI units)
w2 = 0.005;
h2 = 1.6566e+04  %h2 value was calculated using final T2 and w2 value using function Psychrometricsnew

for rh = 5:5:100
    a = a+1;
    b = 0;
    
    for wval = 0.005:0.001:0.025
        b = b+1;
        
        [T1,w1,phi1,h1,v,Twb1,P]=Psychrometricsnew('w',wval,'phi',rh)    %Calculating properties of inlet air
        
        MHI = (hfg/((h1-h2)/(w1-w2)));
        
        %For every specific value of a and b, we get values of
        %temperature(T1), humidity ratio(w1) and MHI
        
   MT(a,b) = T1
   MW(a,b) = w1
   MMHI(a,b) = MHI
    
    end
end

%surface plot

surfc(MT,MW,MMHI)
view(0,90)
xlim([4 45])
ylim([0.005 0.025])

colorbar
caxis([0 0.7]) %changing the range of colorbar

xlabel('Temperature') %labelling x-axis
ylabel('Humidity ratio') %labelling y-axis