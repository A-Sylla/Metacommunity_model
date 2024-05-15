
% A metacommunity model composed of two species (fish and macroinvertebrate) and a bacterial population.
% long distance migration for fish and short distance migration for macroinvertebrate 

%%

clc;
close all;
clear all;


% Global contant parameters     
nt = 468;         % Final time  
dt = 0.01;        % Time increment
time = 0:dt:nt;   % Generate discretization points in time  %% time have (nt/dt+1) points
n = 25;           % number of habitat patches
sigmaF = 2;       % Bacilli release rate from dead fish 
sigmaA = 4;       % Bacilli release rate from dead macroinvertebrate 
lambda = 0.1;    % Fish-associated bacteria growth rate       
theta = 0.5;      % Macroinvertebrate-associated bacteria growth rate  
sF = 1;           % Half saturation Michaelis-Menten constant of the fish-associated substrate
sA = 1;           % Half saturation Michaelis-Menten constant of the macroinvertebrate-associated substrate     
gamma = 0.1;     % Bacteria attachment rate on fish biomass    
zeta = 0.3;       % Bacteria attachment rate on macroinvertebrate biomass
nu = 0.05;        % Fish mortality rate
eta = 0.05;       % Macroinvertebrate mortality rate
mu = 0.027;       % Bacteria mortality rate
T = [7,10];       % leaching period for free-living bacteria from river to sea

         
%% Reproductions rates

% fish biomasses  
% Define the r function as an anonymous function taking one argument: t
r = @(t) (16 <= mod(t, 52) & mod(t, 52) <= 52) .* (2.67 .* wblpdf(mod(t, 52) - 15, 10, 1.5));

% macroinvertebrate biomasses 
rho = r;   

% free-living bacteria
% Define the lambda function as an anonymous function taking one argument: t
la = @(t) (20 <= mod(t, 52) & mod(t, 52) <= 40) .* (0.2 .* exp(-0.06 .* (mod(t, 52) - 30).^2));


%%  Migration rates

mF = 0.1*ones(n,1);    % for fish
mA = 0.05*ones(n,1);    % for macroinvertebrate

% free-living bacteria
% Define the delta function as an anonymous function 
delta = @(t) (10 <= mod(t, 52) & mod(t, 52) <= 30) .* (0.6 .* exp(-0.2 .* (mod(t, 52) - 20).^2));


%% Initial conditions values 

F0 = 0.05*ones(n,1);     % for fish community
A0 = 0.05*ones(n,1);     % macroinvertebrate community
b0 = zeros(n,1);        % initialize function
b0(1) = 0.02;          % free-living bacteria initial source

 
%% Connectivity matrix

alpha = zeros(n,n);   % fish community  n x n
beta = zeros(n,n);    % macroinvertebrate community  n x n
p = zeros(length(time), n, n);  % Free-living bacteria community (length(time)) x n x n

%% Population 1 parameters  

%connectivity Fish biomass alpha(i,1)
alpha(2:10,1) = [0.25, 0.2, 0.15, 0.1, 0.1, 0.08, 0.06, 0.04, 0.02];
    
%connectivity macroinvertebrate biomass beta(i,1)
beta(2:6,1) = 0.2;

%connectivity free-living bacteria p(t,i,1)
for t=1:length(time)                   
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )             % migrate period 
        p(t,14,1)=0; p(t,15,1)=0; p(t,16,1)=0;
        p(t,21,1)=0.2; p(t,22,1)=0.2; p(t,23,1)=0.2; p(t,24,1)=0.2; p(t,25,1)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )                 % end migrate period 
        p(t,14,1)=0.34; p(t,15,1)=0.33; p(t,16,1)=0.33;
        p(t,21,1)=0; p(t,22,1)=0; p(t,23,1)=0; p(t,24,1)=0; p(t,25,1)=0; 
    else                                % out migration period
        p(t,14,1)=0; p(t,15,1)=0; p(t,16,1)=0;
        p(t,21,1)=0; p(t,22,1)=0; p(t,23,1)=0; p(t,24,1)=0; p(t,25,1)=0;    
    end    
end


%% Population 2 parameters

% connectivity Fish biomass alpha(i,2)
alpha(1,2)=0.225; alpha(3,2)=0.225; alpha(4,2)=0.15; alpha(5,2)=0.1; alpha(6,2)=0.1;
alpha(7,2)=0.08; alpha(8,2)=0.06; alpha(9,2)=0.04; alpha(10,2) = 0.02; 
   
% connectivity macroinvertebrate biomass beta(i,2)
beta(1,2)=0.2; beta(3,2)=0.2; beta(4,2)=0.2; beta(5,2)=0.2; beta(6,2)=0.2;
   
% connectivity free-living bacteria p(i,2)
for t=1:length(time)                   
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )              %migrate period
        p(t,14,2)=0; p(t,15,2)=0; p(t,16,2)=0;
        p(t,21,2)=0.2; p(t,22,2)=0.2; p(t,23,2)=0.2; p(t,24,2)=0.2; p(t,25,2)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )         %end migrate period
        p(t,14,2)=0.34; p(t,15,2)=0.33; p(t,16,2)=0.33;
        p(t,21,2)=0; p(t,22,2)=0; p(t,23,2)=0; p(t,24,2)=0; p(t,25,2)=0;    
    else                                % out migration period
        p(t,14,2)=0; p(t,15,2)=0; p(t,16,2)=0;
        p(t,21,2)=0; p(t,22,2)=0; p(t,23,2)=0; p(t,24,2)=0; p(t,25,2)=0;    
    end    
end

%% Population 3 parameters

% connectivity Fish biomass alpha(i,3)
alpha(1,3)=0.15; alpha(2,3)=0.2; alpha(4,3)=0.2; alpha(5,3)=0.15; alpha(6,3)=0.1;
alpha(7,3)=0.08; alpha(8,3)=0.06; alpha(9,3)=0.04; alpha(10,3)=0.02;  
    
% connectivity macroinvertebrate biomass beta(i,3)
beta(1,3)=0.2; beta(2,3)=0.2; beta(4,3)=0.2; beta(5,3)=0.2; beta(6,3)=0.2;

% connectivity free-living bacteria p(i,3)
for t=1:length(time)                   
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )      %migrate period 
        p(t,14,3)=0; p(t,15,3)=0; p(t,16,3)=0;
        p(t,21,3)=0.2; p(t,22,3)=0.2; p(t,23,3)=0.2; p(t,24,3)=0.2; p(t,25,3)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )         %end migrate period
        p(t,14,3)=0.34; p(t,15,3)=0.33; p(t,16,3)=0.33;
        p(t,21,3)=0; p(t,22,3)=0; p(t,23,3)=0; p(t,24,3)=0; p(t,25,3)=0; 
    else                                % out migration period
        p(t,14,3)=0; p(t,15,3)=0; p(t,16,3)=0;
        p(t,21,3)=0; p(t,22,3)=0; p(t,23,3)=0; p(t,24,3)=0; p(t,25,3)=0;    
    end    
end

%% Population 4 parameters

% connectivity fish biomass alpha(i,4)
alpha(1,4)=0.1; alpha(2,4)=0.15; alpha(3,4)=0.2; alpha(5,4)=0.2; alpha(6,4)=0.15;
alpha(7,4)=0.08; alpha(8,4)=0.06; alpha(9,4)=0.04; alpha(10,4)=0.02; 
    
%connectivity macroinvertebrate biomass beta(i,4)
beta(1,4)=0.2; beta(2,4)=0.2; beta(3,4)=0.2; beta(5,4)=0.2; beta(6,4)=0.2;
    
%connectivity free-living bacteria p(i,4)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period 
        p(t,14,4)=0; p(t,15,4)=0; p(t,16,4)=0;
        p(t,21,4)=0.2; p(t,22,4)=0.2; p(t,23,4)=0.2; p(t,24,4)=0.2; p(t,25,4)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period 
        p(t,14,4)=0.34; p(t,15,4)=0.33; p(t,16,4)=0.33;
        p(t,21,4)=0; p(t,22,4)=0; p(t,23,4)=0; p(t,24,4)=0; p(t,25,4)=0; 
    else                                % out migration period
        p(t,14,4)=0; p(t,15,4)=0; p(t,16,4)=0;
        p(t,21,4)=0; p(t,22,4)=0; p(t,23,4)=0; p(t,24,4)=0; p(t,25,4)=0;    
    end    
end

%% Population 5 parameters

%connectivity Fish biomass alpha(i,5)
alpha(1,5)=0.1; alpha(2,5)=0.1; alpha(3,5)=0.15; alpha(4,5)=0.225; alpha(6,5)=0.225;
alpha(7,5)=0.08; alpha(8,5)=0.06; alpha(9,5)=0.04; alpha(10,5)=0.02; 
    
%connectivity macroinvertebrate biomass beta(i,5)
beta(1,5)=0.2; beta(2,5)=0.2; beta(3,5)=0.2; beta(4,5)=0.2; beta(6,5)=0.2;

% connectivity free-living bacteria p(i,5)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period 
        p(t,14,5)=0; p(t,15,5)=0; p(t,16,5)=0;
        p(t,21,5)=0.2; p(t,22,5)=0.2; p(t,23,5)=0.2; p(t,24,5)=0.2; p(t,25,5)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,5)=0.34; p(t,15,5)=0.33; p(t,16,5)=0.33;
        p(t,21,5)=0; p(t,22,5)=0; p(t,23,5)=0; p(t,24,5)=0; p(t,25,5)=0;   
    else                                
        p(t,14,5)=0; p(t,15,5)=0; p(t,16,5)=0;
        p(t,21,5)=0; p(t,22,5)=0; p(t,23,5)=0; p(t,24,5)=0; p(t,25,5)=0;    
    end    
end  

%% Population 6 parameters

% connectivity Fish biomass alpha(i,6)
alpha(1,6)=0.1; alpha(2,6)=0.1; alpha(3,6)=0.15; alpha(4,6)=0.2; alpha(5,6)=0.25;
alpha(7,6)=0.08; alpha(8,6)=0.06; alpha(9,6)=0.04; alpha(10,6)=0.02;

% connectivity macroinvertebrate biomass beta(i,6)
beta(1,6)=0.2; beta(2,6)=0.2; beta(3,6)=0.2; beta(4,6)=0.2; beta(5,6)=0.2;

% connectivity free-living bacteria p(i,6)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,6)=0; p(t,15,6)=0; p(t,16,6)=0;
        p(t,21,6)=0.2; p(t,22,6)=0.2; p(t,23,6)=0.2; p(t,24,6)=0.2; p(t,25,6)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,6)=0.34; p(t,15,6)=0.33; p(t,16,6)=0.33;
        p(t,21,6)=0; p(t,22,6)=0; p(t,23,6)=0; p(t,24,6)=0; p(t,25,6)=0;   
    else                                
        p(t,14,6)=0; p(t,15,6)=0; p(t,16,6)=0;
        p(t,21,6)=0; p(t,22,6)=0; p(t,23,6)=0; p(t,24,6)=0; p(t,25,6)=0;    
    end    
end  

%% Population 7 parameters
 
% connectivity fish biomass alpha(i,7)
alpha(1,7)=0.02; alpha(2,7)=0.03; alpha(3,7)=0.03; alpha(4,7)=0.04; alpha(5,7)=0.04; alpha(6,7)=0.04;
alpha(8,7)=0.25; alpha(9,7)=0.2; alpha(10,7)=0.15; alpha(11,7)=0.08; alpha(12,7)=0.06; alpha(13,7)=0.06;

% connectivity macroinvertebrate biomass beta(i,7)
beta(8,7)=0.34; beta(9,7)=0.33; beta(10,7)=0.33; 

%connectivity free-living bacteria p(i,7)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,7)=0; p(t,15,7)=0; p(t,16,7)=0;
        p(t,21,7)=0.2; p(t,22,7)=0.2; p(t,23,7)=0.2; p(t,24,7)=0.2; p(t,25,7)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,7)=0.34; p(t,15,7)=0.33; p(t,16,7)=0.33;
        p(t,21,7)=0; p(t,22,7)=0; p(t,23,7)=0; p(t,24,7)=0; p(t,25,7)=0; 
    else                                
        p(t,14,7)=0; p(t,15,7)=0; p(t,16,7)=0;
        p(t,21,7)=0; p(t,22,7)=0; p(t,23,7)=0; p(t,24,7)=0; p(t,25,7)=0;    
    end    
end

%% Population 8 parameters

% connectivity fish biomass alpha(i,8)
alpha(1,8)=0.02; alpha(2,8)=0.03; alpha(3,8)=0.03; alpha(4,8)=0.04; alpha(5,8)=0.04; alpha(6,8)=0.04;
alpha(7,8)=0.2; alpha(9,8)=0.2; alpha(10,8)=0.2; alpha(11,8)=0.08; alpha(12,8)=0.06; alpha(13,8)=0.06; 

% connectivity macroinvertebrate biomass beta(i,8)
beta(7,8)=0.34; beta(9,8)=0.33; beta(10,8)=0.33; 

% connectivity free-living bacteria p(i,8)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,8)=0; p(t,15,8)=0; p(t,16,8)=0;
        p(t,21,8)=0.2; p(t,22,8)=0.2; p(t,23,8)=0.2; p(t,24,8)=0.2; p(t,25,8)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,8)=0.34; p(t,15,8)=0.33; p(t,16,8)=0.33;
        p(t,21,8)=0; p(t,22,8)=0; p(t,23,8)=0; p(t,24,8)=0; p(t,25,8)=0; 
    else                                
        p(t,14,8)=0; p(t,15,8)=0; p(t,16,8)=0;
        p(t,21,8)=0; p(t,22,8)=0; p(t,23,8)=0; p(t,24,8)=0; p(t,25,8)=0;    
    end    
end

%% Population 9 parameters

% connectivity fish biomass alpha(i,9)
alpha(1,9)=0.02; alpha(2,9)=0.03; alpha(3,9)=0.03; alpha(4,9)=0.04; alpha(5,9)=0.04; alpha(6,9)=0.04;
alpha(7,9)=0.2; alpha(8,9)=0.2; alpha(10,9)=0.2; alpha(11,9)=0.08; alpha(12,9)=0.06; alpha(13,9)=0.06; 

% connectivity macroinvertebrate biomass beta(i,9)
beta(7,9)=0.33; beta(8,9)=0.33; beta(10,9)=0.34; 

%connectivity free-living bacteria p(i,9)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,9)=0; p(t,15,9)=0; p(t,16,9)=0;
        p(t,21,9)=0.2; p(t,22,9)=0.2; p(t,23,9)=0.2; p(t,24,9)=0.2; p(t,25,9)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,9)=0.34; p(t,15,9)=0.33; p(t,16,9)=0.33;
        p(t,21,9)=0; p(t,22,9)=0; p(t,23,9)=0; p(t,24,9)=0; p(t,25,9)=0;   
    else                                
        p(t,14,9)=0; p(t,15,9)=0; p(t,16,9)=0;
        p(t,21,9)=0; p(t,22,9)=0; p(t,23,9)=0; p(t,24,9)=0; p(t,25,9)=0;    
    end    
end

%% Population 10 parameters

% connectivity fish biomass alpha(i,10)
alpha(1,10)=0.02; alpha(2,10)=0.02; alpha(3,10)=0.03; alpha(4,10)=0.03; alpha(5,10)=0.05; alpha(6,10)=0.05;
alpha(7,10)=0.15; alpha(8,10)=0.2; alpha(9,10)=0.25; alpha(11,10)=0.08; alpha(12,10)=0.06; alpha(13,10)=0.06; 

% connectivity macroinvertebrate biomass beta(i,10)
beta(7,10)=0.33; beta(8,10)=0.33; beta(9,10)=0.34; 
   
% connectivity free-living bacteria p(i,10)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,10)=0; p(t,15,10)=0; p(t,16,10)=0;
        p(t,21,10)=0.2; p(t,22,10)=0.2; p(t,23,10)=0.2; p(t,24,10)=0.2; p(t,25,10)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,10)=0.34; p(t,15,10)=0.33; p(t,16,10)=0.33;
        p(t,21,10)=0; p(t,22,10)=0; p(t,23,10)=0; p(t,24,10)=0; p(t,25,10)=0;  
    else                                
        p(t,14,10)=0; p(t,15,10)=0; p(t,16,10)=0;
        p(t,21,10)=0; p(t,22,10)=0; p(t,23,10)=0; p(t,24,10)=0; p(t,25,10)=0;    
    end    
end

%% Population 11 parameters

% connectivity fish biomass alpha(i,11)
alpha(7,11)=0.05; alpha(8,11)=0.05; alpha(9,11)=0.1; alpha(10,11)=0.1; 
alpha(12,11)=0.2; alpha(13,11)=0.2; alpha(14,11)=0.1; alpha(15,11)=0.1; alpha(16,11)=0.1;   

% connectivity macroinvertebrate biomass beta(i,11)
beta(12,11)=0.5; beta(13,11)=0.5;  

% connectivity free-living bacteria p(i,11)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,11)=0; p(t,15,11)=0; p(t,16,11)=0;
        p(t,21,11)=0.2; p(t,22,11)=0.2; p(t,23,11)=0.2; p(t,24,11)=0.2; p(t,25,11)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,11)=0.34; p(t,15,11)=0.33; p(t,16,11)=0.33;
        p(t,21,11)=0; p(t,22,11)=0; p(t,23,11)=0; p(t,24,11)=0; p(t,25,11)=0;     
    else                                
        p(t,14,11)=0; p(t,15,11)=0; p(t,16,11)=0;
        p(t,21,11)=0; p(t,22,11)=0; p(t,23,11)=0; p(t,24,11)=0; p(t,25,11)=0;    
    end    
end

%% Population 12 parameters

% connectivity fish biomass alpha(i,12)
alpha(7,12)=0.04; alpha(8,12)=0.06; alpha(9,12)=0.1; alpha(10,12)=0.1; 
alpha(11,12)=0.2; alpha(13,12)=0.2; alpha(14,12)=0.12; alpha(15,12)=0.1; alpha(16,12)=0.08;  
    
% connectivity macroinvertebrate biomass beta(i,12)
beta(11,12)=0.5; beta(13,12)=0.5; 

% connectivity free-living bacteria p(i,12)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,12)=0; p(t,15,12)=0; p(t,16,12)=0;
        p(t,21,12)=0.2; p(t,22,12)=0.2; p(t,23,12)=0.2; p(t,24,12)=0.2; p(t,25,12)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate period
        p(t,14,12)=0.34; p(t,15,12)=0.33; p(t,16,12)=0.33;
        p(t,21,12)=0; p(t,22,12)=0; p(t,23,12)=0; p(t,24,12)=0; p(t,25,12)=0; 
    else                                
        p(t,14,12)=0; p(t,15,12)=0; p(t,16,12)=0;
        p(t,21,12)=0; p(t,22,12)=0; p(t,23,12)=0; p(t,24,12)=0; p(t,25,12)=0;    
    end    
end

%% Population 13 parameters
 
% connectivity fish biomass alpha(i,13)
alpha(7,13)=0.03; alpha(8,13)=0.07; alpha(9,13)=0.09; alpha(10,13)=0.11; 
alpha(11,13)=0.17; alpha(12,13)=0.23;  alpha(14,13)=0.13; alpha(15,13)=0.12; alpha(16,13)=0.05; 
    
%connectivity macroinvertebrate biomass beta(i,13)
beta(11,13)=0.5; beta(12,13)=0.5; 

%  connectivity free-living bacteria p(i,13)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<24 )     %migrate period
        p(t,14,13)=0; p(t,15,13)=0; p(t,16,13)=0;
        p(t,21,13)=0.2; p(t,22,13)=0.2; p(t,23,13)=0.2; p(t,24,13)=0.2; p(t,25,13)=0.2;
    elseif ( 24<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %end migrate periods
        p(t,14,13)=0.34; p(t,15,13)=0.33; p(t,16,13)=0.33;
        p(t,21,13)=0; p(t,22,13)=0; p(t,23,13)=0; p(t,24,13)=0; p(t,25,13)=0;   
    else                                
        p(t,14,13)=0; p(t,15,13)=0; p(t,16,13)=0;
        p(t,21,13)=0; p(t,22,13)=0; p(t,23,13)=0; p(t,24,13)=0; p(t,25,13)=0;    
    end    
end

%% Population 14 parameters
 
% connectivity fish biomass alpha(i,14)
alpha(11,14)=0.1; alpha(12,14)=0.1; alpha(13,14)=0.1;  alpha(15,14)=0.22; alpha(16,14)=0.18;
alpha(17,14)=0.1; alpha(18,14)=0.08;  alpha(19,14)=0.07; alpha(20,14)=0.05;   

%connectivity macroinvertebrate biomass beta(i,14)
beta(15,14)=0.5; beta(16,14)=0.5;

%connectivity free-living bacteria p(i,14)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,14)=0.2; p(t,22,14)=0.2; p(t,23,14)=0.2; p(t,24,14)=0.2; p(t,25,14)=0.2;    
    else                                
        p(t,21,14)=0; p(t,22,14)=0; p(t,23,14)=0; p(t,24,14)=0; p(t,25,14)=0;    
    end    
end

%% Population 15 parameters
 
% connectivity fish biomass alpha(i,15)
alpha(11,15)=0.07; alpha(12,15)=0.11; alpha(13,15)=0.12;  alpha(14,15)=0.2; alpha(16,15)=0.2;
alpha(17,15)=0.12; alpha(18,15)=0.09;  alpha(19,15)=0.06; alpha(20,15)=0.03;

% connectivity macroinvertebrate biomass beta(i,15)
beta(14,15)=0.5; beta(16,15)=0.5;

% connectivity free-living bacteria p(i,15)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,15)=0.2; p(t,22,15)=0.2; p(t,23,15)=0.2; p(t,24,15)=0.2; p(t,25,15)=0.2;   
    else                                
        p(t,21,15)=0; p(t,22,15)=0; p(t,23,15)=0; p(t,24,15)=0; p(t,25,15)=0;    
    end    
end

%% Population 16 parameters
 
% connectivity fish biomass alpha(i,16)
alpha(11,16)=0.06; alpha(12,16)=0.08; alpha(13,16)=0.16;  alpha(14,16)=0.16; alpha(15,16)=0.24;
alpha(17,16)=0.11; alpha(18,16)=0.09;  alpha(19,16)=0.05; alpha(20,16)=0.05; 

% connectivity macroinvertebrate biomass beta(i,16)
beta(14,16)=0.5; beta(15,16)=0.5;  

% connectivity free-living bacteria p(i,16)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,16)=0.2; p(t,22,16)=0.2; p(t,23,16)=0.2; p(t,24,16)=0.2; p(t,25,16)=0.2; 
    else                                
        p(t,21,16)=0; p(t,22,16)=0; p(t,23,16)=0; p(t,24,16)=0; p(t,25,16)=0;    
    end    
end

%% Population 17 parameters

% connectivity fish biomass alpha(i,17)
alpha(14,17)=0.05; alpha(15,17)=0.1; alpha(16,17)=0.1; alpha(18,17)=0.2; alpha(19,17)=0.15; alpha(20,17)=0.1;
alpha(21,17)=0.08; alpha(22,17)=0.06;  alpha(23,17)=0.07; alpha(24,17)=0.05; alpha(25,17)=0.04;

% connectivity macroinvertebrate biomass beta(i,17)
beta(18,17)=0.34; beta(19,17)=0.33; beta(20,17)=0.33;

% connectivity free-living bacteria p(i,17)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,17)=0.2; p(t,22,17)=0.2; p(t,23,17)=0.2; p(t,25,17)=0.2; p(t,25,17)=0.2;
    else                                
        p(t,21,17)=0; p(t,22,17)=0; p(t,23,17)=0; p(t,25,17)=0; p(t,25,17)=0;    
    end    
end

%% Population 18 parameters

% connectivity fish biomass alpha(i,18)
alpha(14,18)=0.05; alpha(15,18)=0.08; alpha(16,18)=0.1; alpha(17,18)=0.1; alpha(19,18)=0.2; alpha(20,18)=0.1;
alpha(21,18)=0.09; alpha(22,18)=0.09;  alpha(23,18)=0.08; alpha(24,18)=0.07; alpha(25,18)=0.04; 

% connectivity macroinvertebrate biomass beta(i,18)
beta(17,18)=0.34; beta(19,18)=0.33; beta(20,18)=0.33;

%connectivity free-living bacteria p(i,18)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,18)=0.2; p(t,22,18)=0.2; p(t,23,18)=0.2; p(t,24,18)=0.2; p(t,25,18)=0.2;   
    else                                
        p(t,21,18)=0; p(t,22,18)=0; p(t,23,18)=0; p(t,24,18)=0; p(t,25,18)=0;    
    end    
end

%% Population 19 parameters
 
% connectivity fish biomass alpha(i,19)
alpha(14,19)=0.05; alpha(15,19)=0.05; alpha(16,19)=0.1; alpha(17,19)=0.08; alpha(18,19)=0.2; alpha(20,19)=0.12;
alpha(21,19)=0.1; alpha(22,19)=0.1;  alpha(23,19)=0.08; alpha(24,19)=0.06; alpha(25,19)=0.06; 

% connectivity macroinvertebrate biomass beta(i,19)
beta(17,19)=0.33; beta(18,19)=0.33; beta(20,19)=0.34;

%connectivity free-living bacteria p(i,19)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,19)=0.2; p(t,22,19)=0.2; p(t,23,19)=0.2; p(t,24,19)=0.2; p(t,25,19)=0.2;
    else                                
        p(t,21,19)=0; p(t,22,19)=0; p(t,23,19)=0; p(t,24,19)=0; p(t,25,19)=0;    
    end    
end

%% Population 20 parameters
 
% connectivity fish biomass alpha(i,20)
alpha(14,20)=0.05; alpha(15,20)=0.05; alpha(16,20)=0.1; alpha(17,20)=0.1; alpha(18,20)=0.1; alpha(19,20)=0.2;
alpha(21,20)=0.1; alpha(22,20)=0.1;  alpha(23,20)=0.1; alpha(24,20)=0.05; alpha(25,20)=0.05; 

% connectivity macroinvertebrate biomass beta(i,20)
beta(17,20)=0.33; beta(18,20)=0.33; beta(19,20)=0.34;

%connectivity free-living bacteria p(i,20)
for t=1:length(time)                  
    if ( 10<=mod(time(t),52) )&&( mod(time(t),52)<=30 )     %migrate period
        p(t,21,20)=0.2; p(t,22,20)=0.2; p(t,23,20)=0.2; p(t,24,20)=0.2; p(t,25,20)=0.2;
    else                                
        p(t,21,20)=0; p(t,22,20)=0; p(t,23,20)=0; p(t,24,20)=0; p(t,25,20)=0;    
    end    
end
        
%% Population 21 parameters

% connectivity fish biomass
alpha(17,21)=0.05; alpha(18,21)=0.1; alpha(19,21)=0.1; alpha(20,21)=0.15; 
alpha(22,21)=0.2; alpha(23,21)=0.15; alpha(24,21)=0.15; alpha(25,21)=0.1; 

% connectivity macroinvertebrate biomass
beta(22,21)=0.25; beta(23,21)=0.25; beta(24,21)=0.25; beta(25,21)=0.25; 

%% Population 22 parameters

%connectivity fish biomass
alpha(17,22)=0.05; alpha(18,22)=0.05; alpha(19,22)=0.1; alpha(20,22)=0.15; 
alpha(21,22)=0.25; alpha(23,22)=0.15; alpha(24,22)=0.15; alpha(25,22)=0.1; 

%connectivity macroinvertebrate biomass
beta(21,22)=0.25; beta(23,22)=0.25; beta(24,22)=0.25; beta(25,22)=0.25; 

%% Population 23 parameters
 
% connectivity fish biomass
alpha(17,23)=0.04; alpha(18,23)=0.07; alpha(19,23)=0.09; alpha(20,23)=0.1; 
alpha(21,23)=0.15; alpha(22,23)=0.2; alpha(24,23)=0.2; alpha(25,23)=0.15; 

%connectivity macroinvertebrate biomass
beta(21,23)=0.25; beta(22,23)=0.25; beta(24,23)=0.25; beta(25,23)=0.25; 

%% Population 24 parameters
 
%connectivity fish biomass
alpha(17,24)=0.07; alpha(18,24)=0.08; alpha(19,24)=0.1; alpha(20,24)=0.1; 
alpha(21,24)=0.1; alpha(22,24)=0.15; alpha(23,24)=0.2; alpha(25,24)=0.2; 

%connectivity macroinvertebrate biomass
beta(21,24)=0.25; beta(22,24)=0.25; beta(23,24)=0.25; beta(25,24)=0.25; 

%% Population 25 parameters
 
% connectivity fish biomass
alpha(17,25)=0.03; alpha(18,25)=0.07; alpha(19,25)=0.1; alpha(20,25)=0.1; 
alpha(21,25)=0.12; alpha(22,25)=0.15; alpha(23,25)=0.18; alpha(24,25)=0.25; 

% connectivity macroinvertebrate biomass
beta(21,25)=0.25; beta(22,25)=0.25; beta(23,25)=0.25; beta(24,25)=0.25; 



%%  Figure 3: Time-dependence of biomass and free-living bacteria reproduction rates, and of free-living bacteria migration rate.

for t = 1:length(time)
    r_values(t) = r(time(t));
    la_values(t) = la(time(t));
    delta_values(t) = delta(time(t));
end

% Plot r, la and delta through one season
figure(3);
subplot(2,2,1)
plot(time, r_values,'--',time, la_values,'m','LineWidth',2);
xlabel('Time(weeks)'); ylabel('Reproduction rates');
title('Graphique de r/rho et la en fonction du temps');
axis([0 52 0 0.5]);

subplot(2,2,2)
plot(time, delta_values,'g','LineWidth',2);
xlabel('Time(weeks)'); ylabel('Migration rate');
title('Graphique de delta en fonction du temps');
axis([0 52 0 1]);


%% Figure 4 of the manuscrit: Secondary sources influences


% Calculating solution for sigmaA = 4
[F,A,BF,BA,Bo] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta);
% mean density of free bacteria in downstream areas
Bo_both = sum(Bo(21:25,:), 1) / 5; 

sigmaA_2 = 2;
% Calculating solution for sigmaA = 2
[F_2,A_2,BF_2,BA_2,Bo_2] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA_2, gamma, zeta);
% mean density of free bacteria in downstream areas
Bo_both2 = sum(Bo_2(21:25,:), 1) / 5;

% amount of bacteria sent downstream by the primary source
for t=1:length(time)
    p_sq = squeeze(p(t, :, :));
    pri(t) = sum(p_sq(21:25, 1))*delta(time(t))*Bo(1,t) ;    % for sigmaA=4
    pri_2(t) = sum(p_sq(21:25, 1))*delta(time(t))*Bo_2(1,t) ;    % for sigmaA=2
end

% quantity of bacteria sent downstream by all sources
for j=1:20
    for t=1:length(time)
        p_sq = squeeze(p(t, :, :));
        sec(j,t) = sum(p_sq(21:25, j))*delta(time(t))*Bo(j,t) ;      % for sigmaA=4
        sec_2(j,t) = sum(p_sq(21:25, j))*delta(time(t))*Bo_2(j,t) ;  % for sigmaA=2
    end
end
sec0 = sum(sec,1);      % Sum of contributions from all sources % for sigmaA=4
sec2 = sum(sec_2,1);    % Sum of contributions from all sources % for sigmaA=2

% plot
 figure(4)
 subplot(2,2,1)
 plot(time,sec0,'b',time,pri,'r','LineWidth',2);
 xlabel('time (weeks)'); ylabel('Concentration')

 subplot(2,2,2)
 plot(time,sec2,'b',time,pri_2,'r','LineWidth',2);
 xlabel('time (weeks)'); %ylabel('Concentration')

 
 %%  Figure 5 of the manuscrit : Relative sensitivity to biomass-related parameters.
 
 
 %%%%%%%%%%%%%%% Panel (A) %%%%%%%%%%%%%%%%%%%%%%%%%%
 
 F0_nul = zeros(n,1);     % absence of fish community
 A0_nul = zeros(n,1);     % absence of macroinvertebrate community
 
 % Calculating solution when no fish community
[F_3,A_3,BF_3,BA_3,Bo_3] = meta_system(time, dt, F0_nul, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta);
%  mean density of free bacteria in downstream areas
Bo_macro = sum(Bo_3(21:25,:), 1) / 5;

 % Calculating solution when no macroinvertebrate community
[F_4,A_4,BF_4,BA_4,Bo_4] = meta_system(time, dt, F0, A0_nul, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta);
%  mean density of free bacteria in downstream areas
Bo_fish = sum(Bo_4(21:25,:), 1) / 5;

 
  %%%%%%%%%%%%%%  Panel (B)  %%%%%%%%%%%%%%%%%%%%%%%%%% 
 
% reduction by 10 % of the bacilli attachment rates on macroinvertebrate
zeta_sen = 0.9*zeta;

 % Calculating solution when no macroinvertebrate community
[F_5,A_5,BF_5,BA_5,Bo_5] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta_sen);
%  mean density of free bacteria in downstream areas
Bo_zeta = sum(Bo_5(21:25,:), 1) / 5;

  %%%%%%%%%%%%%  Panel (C)  %%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% reduction by 10% of macroinvertebrate-associated bacilli growth rates 
theta_sen = 0.9*theta; 
 
 % Calculating solution when no macroinvertebrate community
[F_6,A_6,BF_6,BA_6,Bo_6] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta_sen, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta);
%  mean density of free bacteria in downstream areas
Bo_theta = sum(Bo_6(21:25,:), 1) / 5;
  
  %%%%%%%%%%%%  Panel (D)  %%%%%%%%%%%%%%%%%%%%%%%%%

%reduction by 10% on bacilli release rate from macroinvertebrate death
sigmaA_sen = 0.9*sigmaA; 

 % Calculating solution when no macroinvertebrate community
[F_7,A_7,BF_7,BA_7,Bo_7] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA_sen, gamma, zeta);
%  mean density of free bacteria in downstream areas
Bo_sigma = sum(Bo_7(21:25,:), 1) / 5;


% plot figures
 figure(5)
 subplot(2,2,1)
 plot(time,Bo_both,'b',time,Bo_fish,'c',time,Bo_macro,'r','LineWidth',2);
 %xlabel('time (weeks)');
 ylabel('Concentration'); title('(A)');

 subplot(2,2,2)
 plot(time,Bo_both,'b',time,Bo_zeta,'m','LineWidth',2);
 %xlabel('time (weeks)'); ylabel('Concentration');
 title('(B)');
 
 brownRGB = [0.87, 0.49, 0] ; % choose brown color
  subplot(2,2,3)
 plot(time,Bo_both,'b','LineWidth',2);  
 hold on;
 plot(time,Bo_theta,'Color', brownRGB,'LineWidth',2); 
 hold off;
 xlabel('time (weeks)'); ylabel('Concentration');
 title('(C)');
 
  subplot(2,2,4)
 plot(time,Bo_both,'b',time,Bo_sigma,'g','LineWidth',2);  
 xlabel('time (weeks)');  %ylabel('Concentration');
 title('(D)');
 
 
 %% plot mean density of biomasses
 
 A4 = sum(A,1)/n;   F4 = sum(F,1)/n;  

 % plot figures
 figure(6)
 subplot(2,2,1)
 plot(time,A4,'b','LineWidth',2);  
 xlabel('time (weeks)');  ylabel('Mean density of macro');
 title('(A)');

 subplot(2,2,2)
 plot(time,F4,'m','LineWidth',2);  
 xlabel('time (weeks)');  ylabel('Mean density of fish');
 title('(B)');
 
