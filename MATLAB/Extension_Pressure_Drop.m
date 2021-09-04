h = 0.01;       % The spacing between the plates in m.
Dh = 2*h;       % The hydraulic diameter in this case will be twice the spacing between the parallel plates.
mdot = 0.5;     % Unit = kg/s
L = 0.5;        % The length of the plate in m/s.
W = 0.5;        % The width of the plate in m/s.
T = 293;        % Temperature in kelvin
N = 50;         % The number of parallel plates is 50.
% I think the values of mdot, L, W and T are already there in the code. 
% So, please remove these variables.

rho = 1.225;    %The density of air in kg/m^3.

v = mdot/(rho*N*h*W); % Calculating the velocity of air as it flows inside the heat exchanger.
% b and S are the values of the constants used in the eqution to calculate
% dynamic viscosity, mu
b = 1.458*10^-6;
S = 110.4;

mu = (b*T^1.5)/(T + S);


Re = (v*L*rho)/mu;   %Calculating the reynolds n number of the inlet air.
eps = 0.03*10^-3;    %May have to change depending on the nature of Al used

syms f;

f = solve(f^(-0.5) + 2*log((eps/(3.7*Dh)) + (2.51/(Re*f^0.5))) == 0,f);

DeltaP = (2*(L*f*rho*v^2)/(2*Dh))  %Calculating the pressure drop in the heat exchanger. Air will flow twice the length and we will have to add presure drop due to dehumidifier later.