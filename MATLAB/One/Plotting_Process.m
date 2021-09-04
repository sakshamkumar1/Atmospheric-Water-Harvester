%First drawing psychrometrics chart
psychplot = psychplotting(10,50,3,35); %Tdb: 10-50 degree celsius and humidity ratio 3-35 g/kg

processdata=[38    0.026
            30.2    0.017498
            17.81   0.012777422
            12.5    0.009
            24.89   0.009
            26.71707573 0.009];
        
 plot(psychplot,processdata(:,1),processdata(:,2)*1000,'-r+')  %plots processdata on psychrometrics chart