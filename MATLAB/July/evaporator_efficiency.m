clear all
close all
clc

%Known values 
%Heat of vaporization J/kg
hfg = 2492000;
%Temperature of Refrigerant degree Celsius
Tr = 0;
%Effectiveness
eps = 0.5;
%Specific Heat Capacity J/(kg-K)
c = 1005;
hr = 9473;

a = 0;
for rh = 5:5:100
    a = a + 1;
    b = 0;
    for wval = 0.005:0.001:0.025
        b = b + 1;
        [T1, w1, phi1, h1, v1, Twb1, P1] = Psychrometricsnew('phi',rh,'w',wval);
        MT(a,b) = T1;
        MW(a,b) = w1;
        
        %Determining exit temperature T2
        T2 = T1 - eps*(T1 - Tr);
        
        %Determining final enthalpy h2
        qmax = c*(T1 - Tr);
        qact = eps*qmax;
        h2 = h1 - ((T1 - T2)*(h1 - hr)/(T1 - Tr));
        [T2, w2, phi2, h2, v2, Twb2, P2] = Psychrometricsnew('Tdb',T2,'h',h2);
        MMHI(a,b) = hfg*(w1 - w2)/(h1 - h2);
        if phi2>100
            phi2 = 100;
            [T2, w2, phi2, h2, v2, Twb2, P2] = Psychrometricsnew('Tdb',T2,'phi',phi2);
        %Determining MHI
        MMHI(a,b) = hfg*(w1 - w2)/(h1 - h2);
        end
        MRH(a,b) = phi2;
    end
end

%Plotting
figure(1)
surfc(MT,MW,MMHI)
view(0,90)
xlim([4 45])
ylim([0.005 0.025])

colorbar

shading interp
colormap(jet)

xlabel('Inlet Air Temperature')
ylabel('Inlet Air Specific Humidity')
zlabel('MHI')

figure (2)
surfc(MT,MW,MRH)

colorbar
shading interp
colormap(jet)
view(0,90)
xlim([4 45])
ylim([0.005 0.025])