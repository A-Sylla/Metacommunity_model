% A metacommunity model composed of two species (fish and macroinvertebrate) and a bacterial population.
%long distance migration for fish and short distance migration for macroinvertebrate 
%%

clc;
close all;
clear all;

% contant parameters     
nt=468;        % Number of time steps 
dt=0.01;       % Width of each time step
n = 25;        % number of habitat patches
siF=2;         % Bacilli release rate from dead fish 
siA=6;         % Bacilli release rate from dead macroinvertebrate 
lamF=0.05;     % Fish-associated bacteria growth rate       
lamA=0.5;        % Macroinvertebrate-associated bacteria growth rate  
sF=1;            % Half saturation Michaelis-Menten constant of the fish-associated substrate
sA=1;            % Half saturation Michaelis-Menten constant of the macroinvertebrate-associated substrate     
gaF=0.05;        % Bacteria attachment rate on fish biomass    
gaA=0.3;         % Bacteria attachment rate on macroinvertebrate biomass
nu=0.1;          % Fish/macroinvertebrate mortality rate
mu=0.1;          % Bacteria mortality rate

%initialization of variables of the model
%F = zeros(n,nt/dt); 
F1=zeros(nt+1,1);   A1=zeros(nt+1,1);    Bo1=zeros(nt+1,1);               %Pop 1 size
F2=zeros(nt+1,1);   A2=zeros(nt+1,1);    Bo2=zeros(nt+1,1);
F3=zeros(nt+1,1);   A3=zeros(nt+1,1);    Bo3=zeros(nt+1,1);
F4=zeros(nt+1,1);   A4=zeros(nt+1,1);    Bo4=zeros(nt+1,1);              
F5=zeros(nt+1,1);   A5=zeros(nt+1,1);    Bo5=zeros(nt+1,1);
F6=zeros(nt+1,1);   A6=zeros(nt+1,1);    Bo6=zeros(nt+1,1);
F7=zeros(nt+1,1);   A7=zeros(nt+1,1);    Bo7=zeros(nt+1,1);              
F8=zeros(nt+1,1);   A8=zeros(nt+1,1);    Bo8=zeros(nt+1,1);
F9=zeros(nt+1,1);   A9=zeros(nt+1,1);    Bo9=zeros(nt+1,1);
F10=zeros(nt+1,1);  A10=zeros(nt+1,1);   Bo10=zeros(nt+1,1);              
F11=zeros(nt+1,1);  A11=zeros(nt+1,1);   Bo11=zeros(nt+1,1);
F12=zeros(nt+1,1);  A12=zeros(nt+1,1);   Bo12=zeros(nt+1,1);
F13=zeros(nt+1,1);  A13=zeros(nt+1,1);   Bo13=zeros(nt+1,1);               
F14=zeros(nt+1,1);  A14=zeros(nt+1,1);   Bo14=zeros(nt+1,1);
F15=zeros(nt+1,1);  A15=zeros(nt+1,1);   Bo15=zeros(nt+1,1);
F16=zeros(nt+1,1);  A16=zeros(nt+1,1);   Bo16=zeros(nt+1,1);
F17=zeros(nt+1,1);  A17=zeros(nt+1,1);   Bo17=zeros(nt+1,1);
F18=zeros(nt+1,1);  A18=zeros(nt+1,1);   Bo18=zeros(nt+1,1);
F19=zeros(nt+1,1);  A19=zeros(nt+1,1);   Bo19=zeros(nt+1,1); 
F20=zeros(nt+1,1);  A20=zeros(nt+1,1);   Bo20=zeros(nt+1,1);
F21=zeros(nt+1,1);  A21=zeros(nt+1,1);   Bo21=zeros(nt+1,1);
F22=zeros(nt+1,1);  A22=zeros(nt+1,1);   Bo22=zeros(nt+1,1); 
F23=zeros(nt+1,1);  A23=zeros(nt+1,1);   Bo23=zeros(nt+1,1);
F24=zeros(nt+1,1);  A24=zeros(nt+1,1);   Bo24=zeros(nt+1,1);
F25=zeros(nt+1,1);  A25=zeros(nt+1,1);   Bo25=zeros(nt+1,1); 

BF1=zeros(nt+1,1);   BA1=zeros(nt+1,1);    
BF2=zeros(nt+1,1);   BA2=zeros(nt+1,1);    
BF3=zeros(nt+1,1);   BA3=zeros(nt+1,1);    
BF4=zeros(nt+1,1);   BA4=zeros(nt+1,1);                  
BF5=zeros(nt+1,1);   BA5=zeros(nt+1,1);    
BF6=zeros(nt+1,1);   BA6=zeros(nt+1,1);    
BF7=zeros(nt+1,1);   BA7=zeros(nt+1,1);                
BF8=zeros(nt+1,1);   BA8=zeros(nt+1,1);    
BF9=zeros(nt+1,1);   BA9=zeros(nt+1,1);    
BF10=zeros(nt+1,1);  BA10=zeros(nt+1,1);             
BF11=zeros(nt+1,1);  BA11=zeros(nt+1,1);   
BF12=zeros(nt+1,1);  BA12=zeros(nt+1,1);   
BF13=zeros(nt+1,1);  BA13=zeros(nt+1,1);                 
BF14=zeros(nt+1,1);  BA14=zeros(nt+1,1);   
BF15=zeros(nt+1,1);  BA15=zeros(nt+1,1);   
BF16=zeros(nt+1,1);  BA16=zeros(nt+1,1);   
BF17=zeros(nt+1,1);  BA17=zeros(nt+1,1);   
BF18=zeros(nt+1,1);  BA18=zeros(nt+1,1);   
BF19=zeros(nt+1,1);  BA19=zeros(nt+1,1);   
BF20=zeros(nt+1,1);  BA20=zeros(nt+1,1);   
BF21=zeros(nt+1,1);  BA21=zeros(nt+1,1);   
BF22=zeros(nt+1,1);  BA22=zeros(nt+1,1);   
BF23=zeros(nt+1,1);  BA23=zeros(nt+1,1);   
BF24=zeros(nt+1,1);  BA24=zeros(nt+1,1);   
BF25=zeros(nt+1,1);  BA25=zeros(nt+1,1);    

%%

%% Initial conditions for Fish metapopulation
  F1(1)=0.5;    Bo1(1)=0.2;        
  F2(1)=0.5;                                
  F3(1)=0.5;                               
  F4(1)=0.5;                           
  F5(1)=0.5;                            
  F6(1)=0.5;                           
  F7(1)=0.5;                           
  F8(1)=0.5;                                
  F9(1)=0.5;                             
  F10(1)=0.5;                         
  F11(1)=0.5;                       
  F12(1)=0.5;                           
  F13(1)=0.5;                         
  F14(1)=0.5;                         
  F15(1)=0.5;                          
  F16(1)=0.5;                             
  F17(1)=0.5;                              
  F18(1)=0.5;                         
  F19(1)=0.5;                          
  F20(1)=0.5;                          
  F21(1)=0.5;                              
  F22(1)=0.5;                          
  F23(1)=0.5;                          
  F24(1)=0.5;                         
  F25(1)=0.5;                         

  %% Initial coditions for macroinvertebrate metapopulation
  A1(1)=0.5;        
  A2(1)=0.5;                                
  A3(1)=0.5;                               
  A4(1)=0.5;                           
  A5(1)=0.5;                            
  A6(1)=0.5;                           
  A7(1)=0.5;                           
  A8(1)=0.5;                                
  A9(1)=0.5;                             
  A10(1)=0.5;                         
  A11(1)=0.5;                       
  A12(1)=0.5;                           
  A13(1)=0.5;                         
  A14(1)=0.5;                         
  A15(1)=0.5;                          
  A16(1)=0.5;                             
  A17(1)=0.5;                              
  A18(1)=0.5;                         
  A19(1)=0.5;                          
  A20(1)=0.5;                          
  A21(1)=0.5;                              
  A22(1)=0.5;                          
  A23(1)=0.5;                          
  A24(1)=0.5;                         
  A25(1)=0.5;               
%% Others parameters
%%Population 1 parameters

% Reproduction rates of fish and macroinvertebrate biomasses  
t=0:nt ;
r1 = zeros(1, nt+1);  % initialize function size
r= 0.3*wblpdf(t,10,1.5);        % Weibull distribution 
for t = 1:nt+1
    if (16 <= mod(t,52)) && (mod(t,52) <= 52)
        r1(t) = 17.5 * r(mod(t,52) - 15);
    else
        r1(t) = 0;
    end
end
% for t = 1:nt+1
%     if (16 <= mod(t, 52)) && (mod(t,52) <= 52)
%         r1(t) = 5.25 * wblpdf(mod(t, 52)-15,10,1.5);
%     else
%         r1(t) = 0;
%     end
% end
rho1= r1;   

% Reproduction rates of free-living bacteria
la1 = zeros(1, nt+1);  % initialize function size
 for t = 1:nt+1
    if (20 <= mod(t,52)) && (mod(t,52) <= 40)
        la1(t) = 0.2*exp(-0.06*(mod(t,52)-30).^2); 
    else
        la1(t) = 0;
    end
end

% Migration rates
mF1 = 0.4;    % for fish
mA1 = 0.4;    % for macroinvertebrate

for t=1:nt+1                     
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )              %season 1
        del1(t)=0.6*exp(-0.2*(mod(t,52)-20).^2);  
    else  
        del1(t)=0;    
    end    
end   

%connectivity Fish biomass alpha_ij
al21 = 0.25; al31 = 0.2; al41 = 0.15; al51 = 0.1; al61 = 0.1;
al71 = 0.08; al81 = 0.06; al91 = 0.04; al101=0.02;
    
%connectivity macroinvertebrate biomass beta_ij
be21 = 0.2; be31 = 0.2; be41=0.2; be51=0.2; be61=0.2;
be71=0; be81=0; be91=0; be101=0; 

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )             %migrate period 
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )                 %end migrate period 
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0; 
    else                                % out migration period
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;    
    end    
end


%% Population 2 parameters

% connectivity Fish biomass
al12 = 0.225; al32 = 0.225; al42 = 0.15; al52 = 0.1; al62 = 0.1;
al72 = 0.08; al82 = 0.06; al92 = 0.04; al102 = 0.02; 
   
% connectivity macroinvertebrate biomass
be12 = 0.2; be32 = 0.2; be42 = 0.2; be52 = 0.2; be62 = 0.2;
be72 = 0; be82 = 0; be92 = 0; be102 = 0; 
   
% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )              %migrate period
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )         %end migrate period
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    else                                % out migration period
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    end    
end

% Reproduction rates of carrier host
r2= r1;      % for fish
rho2 = r2;    % for macroinvertebrate
la2 = la1;    % for free-living bacteria 

% Migration rates                 
mF2 = mF1;  
mA2 = mF2;
del2 = del1;

%% Population 3 parameters

% connectivity Fish biomass
al13 = 0.15; al23 = 0.2; al43 = 0.2; al53 = 0.15; al63 = 0.1;
al73 = 0.08; al83 = 0.06; al93 = 0.04; al103 = 0.02;  
    
% connectivity macroinvertebrate biomass
be13=0.2; be23=0.2; be43=0.2; be53=0.2; be63=0.2;
be73=0; be83=0; be93=0; be103=0;  

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )      %migrate period 
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )         %end migrate period
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0; 
    else                                % out migration period
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;    
    end    
end

%Reproduction rates of carrier host
r3= r1;       % for fish
rho3= r3;     % for macroivertebrate
la3 = la1;    % for free-living bacteria

% Migration rates
mF3 = mF1; 
mA3 = mF3;
del3 = del1;

%% Population 4 parameters

% connectivity fish biomass
al14=0.1; al24=0.15; al34=0.2; al54=0.2; al64=0.15;
al74=0.08; al84=0.06; al94=0.04; al104=0.02; 
    
%connectivity macroinvertebrate biomass
be14=0.2; be24=0.2; be34=0.2; be54=0.2; be64=0.2;
be74=0; be84=0; be94=0; be104=0;  
    
%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period 
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period 
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0; 
    else                                % out migration period
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;    
    end    
end

%Reproduction rates of carrier host
r4= r1;      % fish
rho4= r4;    % macroinvertebrate             
la4 = la1;   % free-living bacteria 

% Migration rates                    
mF4=mF1;  
mA4=mF4;
del4=del1;

%% Population 5 parameters

%connectivity Fish biomass
al15=0.1; al25=0.1; al35=0.15; al45=0.225; al65=0.225;
al75=0.08; al85=0.06; al95=0.04; al105=0.02; 
    
%connectivity macroinvertebrate biomass
be15=0.2; be25=0.2; be35=0.2; be45=0.2; be65=0.2;
be75=0; be85=0; be95=0; be105=0; 

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period 
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;   
    else                                
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;    
    end    
end
%Reproduction rates of carrier host
r5= r1; 
rho5= r5;                 
la5 = la1;     

% Migration rates                     
mF5=mF1;  
mA5=mF5;
del5=del1;


%% Population 6 parameters

% connectivity Fish biomass
al16=0.1; al26=0.1; al36=0.15; al46=0.2; al56=0.25;
al76=0.08; al86=0.06; al96=0.04; al106=0.02;

% connectivity macroinvertebrate biomass
be16=0.2; be26=0.2; be36=0.2; be46=0.2; be56=0.2;
be76=0; be86=0; be96=0; be106=0;

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;   
    else                                
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;    
    end    
end

%Reproduction rates of carrier host
r6= r1; 
rho6= r6;                  
la6 = la1;     

% Migration rates                    
mF6=mF1;  
mA6=mF6;
del6=del1;

%% Population 7 parameters
 
% connectivity fish biomass
al17=0.02; al27=0.03; al37=0.03; al47=0.04; al57=0.04; al67=0.04;
al87=0.25; al97=0.2; al107=0.15; al117=0.08; al127=0.06; al137=0.06;

% connectivity macroinvertebrate biomass
be17=0; be27=0; be37=0; be47=0; be57=0; be67=0;
be87=0.34; be97=0.33; be107=0.33; be117=0; be127=0; be137=0;

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0; 
    else                                
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;    
    end    
end

%Reproduction rates of carrier host
t=0:nt ;
r7= r1; 
rho7= r7;                 
la7 = la1;  

% Migration rates                    
mF7=mF1;  
mA7=mF7;
del7=del1;

%% Population 8 parameters

% connectivity fish biomass
al18=0.02; al28=0.03; al38=0.03; al48=0.04; al58=0.04; al68=0.04;
al78=0.2; al98=0.2; al108=0.2; al118=0.08; al128=0.06; al138=0.06; 

% connectivity macroinvertebrate biomass
be18=0; be28=0; be38=0; be48=0; be58=0; be68=0;
be78=0.34; be98=0.33; be108=0.33; be118=0; be128=0; be138=0; 

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0; 
    else                                
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;    
    end    
end
%Reproduction rates of carrier host
r8= r1; 
rho8= r8;                  
la8 = la1;       

% Migration rates                     
mF8=mF1;  
mA8=mF8;
del8=del1;

%% Population 9 parameters

% connectivity fish biomass
al19=0.02; al29=0.03; al39=0.03; al49=0.04; al59=0.04; al69=0.04;
al79=0.2; al89=0.2; al109=0.2; al119=0.08; al129=0.06; al139=0.06; 

% connectivity macroinvertebrate biomass
be19=0; be29=0; be39=0; be49=0; be59=0; be69=0;
be79=0.33; be89=0.33; be109=0.34; be119=0; be129=0; be139=0; 

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;   
    else                                
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;    
    end    
end
%Reproduction rates of carrier host
r9= r1; 
rho9= r9;                   
la9 = la1;    

% Migration rates                    
mF9=mF1;  
mA9=mF9;
del9=del1;

%% Population 10 parameters

% connectivity fish biomass
al110=0.02; al210=0.02; al310=0.03; al410=0.03; al510=0.05; al610=0.05;
al710=0.15; al810=0.2; al910=0.25; al1110=0.08; al1210=0.06; al1310=0.06; 

% connectivity macroinvertebrate biomass
be110=0; be210=0; be310(t)=0; be410=0; be510=0; be610=0;
be710=0.33; be810=0.33; be910=0.34; be1110=0; be1210=0; be1310=0; 
   
% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;  
    else                                
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r10=r1; 
rho10= r10;
% Reproduction rate of free-living bacteria
la10=la1;       
%Migration rates
mF10=mF1;
mA10=mF10;
del10=del1;

%% Population 11 parameters

% connectivity fish biomass
al711=0.05; al811=0.05; al911=0.1; al1011=0.1; 
al1211=0.2; al1311=0.2; al1411=0.1; al1511=0.1; al1611=0.1;   

% connectivity macroinvertebrate biomass
be711=0; be811=0; be911=0; be1011=0; 
be1211=0.5; be1311=0.5; be1411=0; be1511=0; be1611=0;   

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;     
    else                                
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;    
    end    
end
%Reproduction rates of carrier host
r11= r1; 
rho11= r11;
% Reproduction rate of free-living bacteria
la11=la1;       
%Migration rates
mF11=mF1;
mA11=mF11;
del11=del1;

%% Population 12 parameters

% connectivity fish biomass
al712=0.04; al812=0.06; al912=0.1; al1012=0.1; 
al1112=0.2; al1312=0.2; al1412=0.12; al1512=0.1; al1612=0.08;  
    
% connectivity macroinvertebrate biomass
be712=0; be812=0; be912=0; be1012=0; 
be1112=0.5; be1312=0.5; be1412=0; be1512=0; be1612=0;  

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate period
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0; 
    else                                
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;    
    end    
end
% Reproduction rates of carrier host
r12= r1; 
rho12= r12;
% Reproduction rate of free-living bacteria
la12=la1;

%Migration rates
mF12=mF1;
mA12=mF12;
del12=del1;

%% Population 13 parameters
 
% connectivity fish biomass
al713=0.03; al813=0.07; al913=0.09; al1013=0.11; 
al1113=0.17; al1213=0.23;  al1413=0.13; al1513=0.12; al1613=0.05; 
    
%connectivity macroinvertebrate biomass
be713=0; be813=0; be913=0; be1013=0; 
be1113=0.5; be1213=0.5;  be1413=0; be1513=0; be1613=0; 

%  connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<23 )     %migrate period
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif ( 23<=mod(t,52) )&&( mod(t,52)<=30 )     %end migrate periods
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;   
    else                                
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;    
    end    
end
% Reproduction rates of carrier host
r13=r1; 
rho13= r13;
% Reproduction rate of free-living bacteria
la13=la1;
%Migration rates
mF13=mF1;
mA13=mF13;
del13=del1;

%% Population 14 parameters
 
% connectivity fish biomass
al1114=0.1; al1214=0.1; al1314=0.1;  al1514=0.22; al1614=0.18;
al1714=0.1; al1814=0.08;  al1914=0.07; al2014=0.05;   

%connectivity macroinvertebrate biomass
be1114=0; be1214=0; be1314=0;  be1514=0.5; be1614=0.5;
be1714=0; be1814=0;  be1914=0; be2014=0;   

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;    
    else                                
        p2114(t)=0; p2214(t)=0; p2314(t)=0; p2414(t)=0; p2514(t)=0;    
    end    
end
% Reproduction rates of carrier host
r14= r1; 
rho14= r14;
% Reproduction rate of free-living bacteria
la14=la1;

%Migration rates
mF14=mF1;
mA14=mF14;
del14=del1;

%% Population 15 parameters
 
% connectivity fish biomass
al1115=0.07; al1215=0.11; al1315=0.12;  al1415=0.2; al1615=0.2;
al1715=0.12; al1815=0.09;  al1915=0.06; al2015=0.03;

% connectivity macroinvertebrate biomass
be1115=0; be1215=0; be1315=0;  be1415=0.5; be1615=0.5;
be1715=0; be1815=0;  be1915=0; be2015=0;

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;   
    else                                
        p2115(t)=0; p2215(t)=0; p2315(t)=0; p2415(t)=0; p2515(t)=0;    
    end    
end

% Reproduction rates of carrier host
r15= r1; 
rho15= r15;
% Reproduction rate of free-living bacteria
la15=la1;

%Migration rates
mF15=mF1;
mA15=mF15;
del15=del1;

%% Population 16 parameters
 
% connectivity fish biomass
al1116=0.06; al1216=0.08; al1316=0.16;  al1416=0.16; al1516=0.24;
al1716=0.11; al1816=0.09;  al1916=0.05; al2016=0.05; 

% connectivity macroinvertebrate biomass
be1116=0; be1216=0; be1316=0;  be1416=0.5; be1516=0.5;
be1716=0; be1816=0;  be1916=0; be2016=0;   

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2; 
    else                                
        p2116(t)=0; p2216(t)=0; p2316(t)=0; p2416(t)=0; p2516(t)=0;    
    end    
end

% Reproduction rates of carrier host
r16= r1; 
rho16= r16;
% Reproduction rate of free-living bacteria
la16=la1;

%Migration rates
mF16=mF1;
mA16=mF16;
del16=del1;

%% Population 17 parameters

% connectivity fish biomass
al1417=0.05; al1517=0.1; al1617=0.1; al1817=0.2; al1917=0.15; al2017=0.1;
al2117=0.08; al2217=0.06;  al2317=0.07; al2417=0.05; al2517=0.04;

% connectivity macroinvertebrate biomass
be1417=0; be1517=0; be1617=0; be1817=0.34; be1917=0.33; be2017=0.33;
be2117=0; be2217=0;  be2317=0; be2417=0; be2517=0;

% connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2117=0.2; p2217=0.2; p2317=0.2; p2417=0.2; p2517=0.2;
    else                                
        p2117=0; p2217=0; p2317=0; p2417=0; p2517=0;    
    end    
end

% Reproduction rates of carrier host
r17= r1; 
rho17= r17;
% Reproduction rate of free-living bacteria
la17=la1;

%Migration rates
mF17=mF1;
mA17=mF17;
del17=del1;

%% Population 18 parameters

% connectivity fish biomass
al1418=0.05; al1518=0.08; al1618=0.1; al1718=0.1; al1918=0.2; al2018=0.1;
al2118=0.09; al2218=0.09;  al2318=0.08; al2418=0.07; al2518=0.04; 

% connectivity macroinvertebrate biomass
be1418=0; be1518=0; be1618=0; be1718=0.34; be1918=0.33; be2018=0.33;
be2118=0; be2218=0;  be2318=0; be2418=0; be2518=0; 

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2118=0.2; p2218=0.2; p2318=0.2; p2418=0.2; p2518=0.2;   
    else                                
        p2118=0; p2218=0; p2318=0; p2418=0; p2518=0;    
    end    
end

% Reproduction rates of carrier host
r18= r1; 
rho18= r18;
% Reproduction rate of free-living bacteria
la18=la1;

%Migration rates
mF18=mF1;
mA18=mF18;
del18=del1;

%% Population 19 parameters
 
%connectivity fish biomass
al1419=0.05; al1519=0.05; al1619=0.1; al1719=0.08; al1819=0.2; al2019=0.12;
al2119=0.1; al2219=0.1;  al2319=0.08; al2419=0.06; al2519=0.06; 

%connectivity macroinvertebrate biomass
be1419=0; be1519=0; be1619=0; be1719=0.33; be1819=0.33; be2019=0.34;
be2119=0; be2219=0;  be2319=0; be2419=0; be2519=0; 

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2119=0.2; p2219=0.2; p2319=0.2; p2419=0.2; p2519=0.2;
    else                                
        p2119=0; p2219=0; p2319=0; p2419=0; p2519=0;    
    end    
end

% Reproduction rates of carrier host
r19= r1; 
rho19= r19;
% Reproduction rate of free-living bacteria
la19=la1;

%Migration rates
mF19=mF1;
mA19=mF19;
del19=del1;

%% Population 20 parameters
 
% connectivity fish biomass
al1420=0.05; al1520=0.05; al1620=0.1; al1720=0.1; al1820=0.1; al1920=0.2;
al2120=0.1; al2220=0.1;  al2320=0.1; al2420=0.05; al2520=0.05; 

% connectivity macroinvertebrate biomass
be1420=0; be1520=0; be1620=0; be1720=0.33; be1820=0.33; be1920=0.34;
be2120=0; be2220=0;  be2320=0; be2420=0; be2520=0; 

%connectivity free-living bacteria
for t=1:nt+1                    
    if ( 10<=mod(t,52) )&&( mod(t,52)<=30 )     %migrate period
        p2120=0.2; p2220=0.2; p2320=0.2; p2420=0.2; p2520=0.2;
    else                                
        p2120=0; p2220=0; p2320=0; p2420=0; p2520=0;    
    end    
end

% Reproduction rates of carrier host
r20= r1; 
rho20= r20;
% Reproduction rate of free-living bacteria
la20=la1;

%Migration rates
mF20=mF1;
mA20=mF20;
del20=del1;
        
%% Population 21 parameters

% connectivity fish biomass
al1721=0.05; al1821=0.1; al1921=0.1; al2021=0.15; 
al2221=0.2; al2321=0.15; al2421=0.15; al2521=0.1; 

% connectivity macroinvertebrate biomass
be1721=0; be1821=0; be1921=0; be2021=0; 
be2221=0.25; be2321=0.25; be2421=0.25; be2521=0.25; 

% Reproduction rates of carrier host
r21= r1;
rho21= r21;
% Reproduction rate of free-living bacteria
la21=la1;

%Migration rates
mF21=mF1;
mA21=mF21;
del21=del1;

%% Population 22 parameters

%connectivity fish biomass
al1722=0.05; al1822=0.05; al1922=0.1; al2022=0.15; 
al2122=0.25; al2322=0.15; al2422=0.15; al2522=0.1; 

%connectivity macroinvertebrate biomass
be1722=0; be1822=0; be1922=0; be2022=0; 
be2122=0.25; be2322=0.25; be2422=0.25; be2522=0.25; 

% Reproduction rates of carrier host
r22= r1;
rho22= r22;
% Reproduction rate of free-living bacteria
la22=la1;

%Migration rates
mF22=mF1;
mA22=mF22;
del22=del1;

%% Population 23 parameters
 
% connectivity fish biomass
al1723=0.04; al1823=0.07; al1923=0.09; al2023=0.1; 
al2123=0.15; al2223=0.2; al2423=0.2; al2523=0.15; 

%connectivity macroinvertebrate biomass
be1723=0; be1823=0; be1923=0; be2023=0; 
be2123=0.25; be2223=0.25; be2423=0.25; be2523=0.25; 

% Reproduction rates of carrier host
r23= r1;
rho23= r23;
% Reproduction rate of free-living bacteria
la23=la1;

%Migration rates
mF23=mF1;
mA23=mF23;
del23=del1;

%% Population 24 parameters
 
%connectivity fish biomass
al1724=0.07; al1824=0.08; al1924=0.1; al2024=0.1; 
al2124=0.1; al2224=0.15; al2324=0.2; al2524=0.2; 

%connectivity macroinvertebrate biomass
be1724=0; be1824=0; be1924=0; be2024=0; 
be2124=0.25; be2224=0.25; be2324=0.25; be2524=0.25; 

% Reproduction rates of carrier host
r24= r1;
rho24= r24;
% Reproduction rate of free-living bacteria
la24=la1;

%Migration rates
mF24=mF1;
mA24=mF24;
del24=del1;

%% Population 25 parameters
 
% connectivity fish biomass
al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 

% connectivity macroinvertebrate biomass
be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 

% Reproduction rates of carrier host
r25= r1;
rho25= r25;
% Reproduction rate of free-living bacteria
la25=la1;

%Migration rates
mF25=mF1;
mA25=mF25;
del25=del1;


%% Calculating variables for each time step

for t=1:nt 
    
    %Explicit-implicit method 
    F1(t+1)=( F1(t)+dt*r1(t)*F1(t)+ dt*al12*mF2*F2(t)+dt*al13*mF3*F3(t)+dt*al14*mF4*F4(t)+dt*al15*mF5*F5(t)+dt*al16*mF6*F6(t)+dt*al17*mF7*F7(t)+dt*al18*mF8*F8(t)+dt*al19*mF9*F9(t)+dt*al110*mF10*F10(t) )/(1+dt*(mF1+nu));
    BF1(t+1)=( BF1(t)+dt*lamF*F1(t).*BF1(t)/(1+F1(t))+dt*gaF*F1(t).*Bo1(t)/(1+F1(t))+ dt*al12*mF2*BF2(t)+dt*al13*mF3*BF3(t)+dt*al14*mF4*BF4(t)+dt*al15*mF5*BF5(t)+dt*al16*mF6*BF6(t)+dt*al17*mF7*BF7(t)+dt*al18*mF8*BF8(t)+dt*al19*mF9*BF9(t)+dt*al110*mF10*BF10(t) )/(1+dt*(mu+mF1+nu));
    A1(t+1)=( A1(t)+dt*rho1(t)*A1(t)+ dt*be12*mA2*A2(t)+dt*be13*mA3*A3(t)+dt*be14*mA4*A4(t)+dt*be15*mA5*A5(t)+dt*be16*mA6*A6(t)+dt*be17*mA7*A7(t)+dt*be18*mA8*A8(t)+dt*be19*mA9*A9(t)+dt*be110*mA10*A10(t) )/(1+dt*(mA1+nu));
    BA1(t+1)=( BA1(t)+dt*lamA*A1(t).*BA1(t)/(1+A1(t))+dt*gaA*A1(t).*Bo1(t)/(1+A1(t))+ dt*be12*mA2*BA2(t)+dt*be13*mA3*BA3(t)+dt*be14*mA4*BA4(t)+dt*be15*mA5*BA5(t)+dt*be16*mA6*BA6(t)+dt*be17*mA7*BA7(t)+dt*be18*mA8*BA8(t)+dt*be19*mA9*BA9(t)+dt*be110*mA10*BA10(t) )/(1+dt*(mu+mA1+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo1(t+1)=0;
    elseif mod(t,52)==0 
        Bo1(t)=Bo1(t-1)+0.2;
    else
        Bo1(t+1)=( Bo1(t)+dt*la1(t)*Bo1(t)+(dt*siF*nu)*BF1(t)+(dt*siA*nu)*BA1(t) )/(1+dt*(gaF*F1(t)/(1+F1(t))+gaA*A1(t)/(1+A1(t))+mu+del1(t)));
    end 
    
    F2(t+1)=( F2(t)+dt*r2(t)*F2(t)+ dt*al21*mF1*F1(t)+dt*al23*mF3*F3(t)+dt*al24*mF4*F4(t)+dt*al25*mF5*F5(t)+dt*al26*mF6*F6(t)+dt*al27*mF7*F7(t)+dt*al28*mF8*F8(t)+dt*al29*mF9*F9(t)+dt*al210*mF10*F10(t) )/(1+dt*(mF2+nu));
    BF2(t+1)=( BF2(t)+dt*lamF*F2(t).*BF2(t)/(1+F2(t))+dt*gaF*F2(t).*Bo2(t)/(1+F2(t))+ dt*al21*mF1*BF1(t)+dt*al23*mF3*BF3(t)+dt*al24*mF4*BF4(t)+dt*al25*mF5*BF5(t)+dt*al26*mF6*BF6(t)+dt*al27*mF7*BF7(t)+dt*al28*mF8*BF8(t)+dt*al29*mF9*BF9(t)+dt*al210*mF10*BF10(t) )/(1+dt*(mu+mF2+nu));
    A2(t+1)=( A2(t)+dt*rho2(t)*A2(t)+ dt*be21*mA1*A1(t)+dt*be23*mA3*A3(t)+dt*be24*mA4*A4(t)+dt*be25*mA5*A5(t)+dt*be26*mA6*A6(t)+dt*be27*mA7*A7(t)+dt*be28*mA8*A8(t)+dt*be29*mA9*A9(t)+dt*be210*mA10*A10(t) )/(1+dt*(mA2+nu));
    BA2(t+1)=( BA2(t)+dt*lamA*A2(t).*BA2(t)/(1+A2(t))+dt*gaA*A2(t).*Bo2(t)/(1+A2(t))+ dt*be21*mA1*BA1(t)+dt*be23*mA3*BA3(t)+dt*be24*mA4*BA4(t)+dt*be25*mA5*BA5(t)+dt*be26*mA6*BA6(t)+dt*be27*mA7*BA7(t)+dt*be28*mA8*BA8(t)+dt*be29*mA9*BA9(t)+dt*be210*mA10*BA10(t) )/(1+dt*(mu+mA2+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo2(t+1)=0;
     else
        Bo2(t+1)=( Bo2(t)+dt*la2(t)*Bo2(t)+(dt*siF*nu)*BF2(t)+(dt*siA*nu)*BA2(t) )/(1+dt*(gaF*F2(t)/(1+F2(t))+gaA*A1(t)/(1+A1(t))+del2(t)+mu));
     end 
     
    F3(t+1)=( F3(t)+dt*r3(t)*F3(t)+ dt*al31*mF1*F1(t)+dt*al32*mF2*F2(t)+dt*al34*mF4*F4(t)+dt*al35*mF5*F5(t)+dt*al36*mF6*F6(t)+dt*al37*mF7*F7(t)+dt*al38*mF8*F8(t)+dt*al39*mF9*F9(t)+dt*al310*mF10*F10(t) )/(1+dt*(mF3+nu));
    BF3(t+1)=( BF3(t)+dt*lamF*F3(t).*BF3(t)/(1+F3(t))+dt*gaF*F3(t).*Bo3(t)/(1+F3(t))+ dt*al31*mF1*BF1(t)+dt*al32*mF2*BF2(t)+dt*al34*mF4*BF4(t)+dt*al35*mF5*BF5(t)+dt*al36*mF6*BF6(t)+dt*al37*mF7*BF7(t)+dt*al38*mF8*BF8(t)+dt*al39*mF9*BF9(t)+dt*al310*mF10*BF10(t) )/(1+dt*(mu+mF3+nu));
    A3(t+1)=( A3(t)+dt*rho3(t)*A3(t)+ dt*be31*mA1*A1(t)+dt*be32*mA2*A2(t)+dt*be34*mA4*A4(t)+dt*be35*mA5*A5(t)+dt*be36*mA6*A6(t)+dt*be37*mA7*A7(t)+dt*be38*mA8*A8(t)+dt*be39*mA9*A9(t)+dt*be310(t)*mA10*A10(t) )/(1+dt*(mA3+nu));
    BA3(t+1)=( BA3(t)+dt*lamA*A3(t).*BA3(t)/(1+A3(t))+dt*gaA*A3(t).*Bo3(t)/(1+A3(t))+ dt*be31*mA1*BA1(t)+dt*be32*mA2*BA2(t)+dt*be34*mA4*BA4(t)+dt*be35*mA5*BA5(t)+dt*be36*mA6*BA6(t)+dt*be37*mA7*BA7(t)+dt*be38*mA8*BA8(t)+dt*be39*mA9*BA9(t)+dt*be310(t)*mA10*BA10(t) )/(1+dt*(mu+mA3+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo3(t+1)=0;
     else
        Bo3(t+1)=( Bo3(t)+dt*la3(t)*Bo3(t)+(dt*siF*nu)*BF3(t)+(dt*siA*nu)*BA3(t) )/(1+dt*(gaF*F3(t)/(1+F3(t))+gaA*A3(t)/(1+A3(t))+del3(t)+mu));     
     end
     
    F4(t+1)=( F4(t)+dt*r4(t)*F4(t)+ dt*al41*mF1*F1(t)+dt*al42*mF2*F2(t)+dt*al43*mF3*F3(t)+dt*al45*mF5*F5(t)+dt*al46*mF6*F6(t)+dt*al47*mF7*F7(t)+dt*al48*mF8*F8(t)+dt*al49*mF9*F9(t)+dt*al410*mF10*F10(t) )/(1+dt*(mF4+nu));
    BF4(t+1)=( BF4(t)+dt*lamF*F4(t).*BF4(t)/(1+F4(t))+dt*gaF*F4(t).*Bo4(t)/(1+F4(t))+ dt*al41*mF1*BF1(t)+dt*al42*mF2*BF2(t)+dt*al43*mF3*BF3(t)+dt*al45*mF5*BF5(t)+dt*al46*mF6*BF6(t)+dt*al47*mF7*BF7(t)+dt*al48*mF8*BF8(t)+dt*al49*mF9*BF9(t)+dt*al410*mF10*BF10(t) )/(1+dt*(mu+mF4+nu));
    A4(t+1)=( A4(t)+dt*rho4(t)*A4(t)+ dt*be41*mA1*A1(t)+dt*be42*mA2*A2(t)+dt*be43*mA3*A3(t)+dt*be45*mA5*A5(t)+dt*be46*mA6*A6(t)+dt*be47*mA7*A7(t)+dt*be48*mA8*A8(t)+dt*be49*mA9*A9(t)+dt*be410*mA10*A10(t) )/(1+dt*(mA4+nu));
    BA4(t+1)=( BA4(t)+dt*lamA*A4(t).*BA4(t)/(1+A4(t))+dt*gaA*A4(t).*Bo4(t)/(1+A4(t))+ dt*be41*mA1*BA1(t)+dt*be42*mA2*BA2(t)+dt*be43*mA3*BA3(t)+dt*be53*mA5*BA5(t)+dt*be46*mA6*BA6(t)+dt*be47*mA7*BA7(t)+dt*be48*mA8*BA8(t)+dt*be49*mA9*BA9(t)+dt*be410*mA10*BA10(t) )/(1+dt*(mu+mA4+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo4(t+1)=0;
     else
        Bo4(t+1)=( Bo4(t)+dt*la4(t)*Bo4(t)+(dt*siF*nu)*BF4(t)+(dt*siA*nu)*BA4(t) )/(1+dt*(gaF*F4(t)/(1+F4(t))+gaA*A4(t)/(1+A4(t))+del4(t)+mu)); 
     end 
     
    F5(t+1)=( F5(t)+dt*r5(t)*F5(t)+ dt*al51*mF1*F1(t)+dt*al52*mF2*F2(t)+dt*al53*mF3*F3(t)+dt*al54*mF4*F4(t)+dt*al56*mF6*F6(t)+dt*al57*mF7*F7(t)+dt*al58*mF8*F8(t)+dt*al59*mF9*F9(t)+dt*al510*mF10*F10(t) )/(1+dt*(mF5+nu));
    BF5(t+1)=( BF5(t)+dt*lamF*F5(t).*BF5(t)/(1+F5(t))+dt*gaF*F5(t).*Bo5(t)/(1+F5(t))+ dt*al51*mF1*BF1(t)+dt*al52*mF2*BF2(t)+dt*al53*mF3*BF3(t)+dt*al54*mF4*BF4(t)+dt*al56*mF6*BF6(t)+dt*al57*mF7*BF7(t)+dt*al58*mF8*BF8(t)+dt*al59*mF9*BF9(t)+dt*al510*mF10*BF10(t) )/(1+dt*(mu+mF5+nu));
    A5(t+1)=( A5(t)+dt*rho5(t)*A5(t)+ dt*be51*mA1*A1(t)+dt*be52*mA2*A2(t)+dt*be53*mA3*A3(t)+dt*be54*mA4*A4(t)+dt*be56*mA6*A6(t)+dt*be57*mA7*A7(t)+dt*be58*mA8*A8(t)+dt*be59*mA9*A9(t)+dt*be510*mA10*A10(t) )/(1+dt*(mA5+nu));
    BA5(t+1)=( BA5(t)+dt*lamA*A5(t).*BA5(t)/(1+A5(t))+dt*gaA*A5(t).*Bo5(t)/(1+A5(t))+ dt*be51*mA1*BA1(t)+dt*be52*mA2*BA2(t)+dt*be53*mA3*BA3(t)+dt*be54*mA4*BA4(t)+dt*be56*mA6*BA6(t)+dt*be57*mA7*BA7(t)+dt*be58*mA8*BA8(t)+dt*be59*mA9*BA9(t)+dt*be510*mA10*BA10(t) )/(1+dt*(mu+mA5+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo5(t+1)=0;
     else
        Bo5(t+1)=( Bo5(t)+dt*la5(t)*Bo5(t)+(dt*siF*nu)*BF5(t)+(dt*siA*nu)*BA5(t) )/(1+dt*(gaF*F5(t)/(1+F5(t))+gaA*A5(t)/(1+A5(t))+del5(t)+mu));
     end 
     
    F6(t+1)=( F6(t)+dt*r6(t)*F6(t)+ dt*al61*mF1*F1(t)+dt*al62*mF2*F2(t)+dt*al63*mF3*F3(t)+dt*al64*mF4*F4(t)+dt*al65*mF5*F5(t)+dt*al67*mF7*F7(t)+dt*al68*mF8*F8(t)+dt*al69*mF9*F9(t)+dt*al610*mF10*F10(t) )/(1+dt*(mF6+nu));
    BF6(t+1)=( BF6(t)+dt*lamF*F6(t).*BF6(t)/(1+F6(t))+dt*gaF*F6(t).*Bo6(t)/(1+F6(t))+ dt*al61*mF1*BF1(t)+dt*al62*mF2*BF2(t)+dt*al63*mF3*BF3(t)+dt*al64*mF4*BF4(t)+dt*al65*mF5*BF5(t)+dt*al67*mF7*BF7(t)+dt*al68*mF8*BF8(t)+dt*al69*mF9*BF9(t)+dt*al610*mF10*BF10(t) )/(1+dt*(mu+mF6+nu));
    A6(t+1)=( A6(t)+dt*rho6(t)*A6(t)+ dt*be61*mA1*A1(t)+dt*be62*mA2*A2(t)+dt*be63*mA3*A3(t)+dt*be64*mA4*A4(t)+dt*be65*mA5*A5(t)+dt*be67*mA7*A7(t)+dt*be68*mA8*A8(t)+dt*be69*mA9*A9(t)+dt*be610*mA10*A10(t) )/(1+dt*(mA6+nu));
    BA6(t+1)=( BA6(t)+dt*lamA*A6(t).*BA6(t)/(1+A6(t))+dt*gaA*A6(t).*Bo6(t)/(1+A6(t))+ dt*be61*mA1*BA1(t)+dt*be62*mA2*BA2(t)+dt*be63*mA3*BA3(t)+dt*be64*mA4*BA4(t)+dt*be65*mA5*BA5(t)+dt*be67*mA7*BA7(t)+dt*be68*mA8*BA8(t)+dt*be69*mA9*BA9(t)+dt*be610*mA10*BA10(t) )/(1+dt*(mu+mA6+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo6(t+1)=0;
    else
        Bo6(t+1)=( Bo6(t)+dt*la6(t)*Bo6(t)+(dt*siF*nu)*BF6(t)+(dt*siA*nu)*BA6(t) )/(1+dt*(gaF*F6(t)/(1+F6(t))+gaA*A6(t)/(1+A6(t))+del6(t)+mu));
    end 
     
    F7(t+1)=( F7(t)+dt*r7(t)*F7(t)+ dt*al71*mF1*F1(t)+dt*al72*mF2*F2(t)+dt*al73*mF3*F3(t)+dt*al74*mF4*F4(t)+dt*al75*mF5*F5(t)+dt*al76*mF6*F6(t)+dt*al78*mF8*F8(t)+dt*al79*mF9*F9(t)+dt*al710*mF10*F10(t)+dt*al711*mF11*F11(t)+dt*al712*mF12*F12(t)+dt*al713*mF13*F13(t) )/(1+dt*(mF7+nu));
    BF7(t+1)=( BF7(t)+dt*lamF*F7(t).*BF7(t)/(1+F7(t))+dt*gaF*F7(t).*Bo7(t)/(1+F7(t))+ dt*al71*mF1*BF1(t)+dt*al72*mF2*BF2(t)+dt*al73*mF3*BF3(t)+dt*al74*mF4*BF4(t)+dt*al75*mF5*BF5(t)+dt*al76*mF6*BF6(t)+dt*al78*mF8*BF8(t)+dt*al79*mF9*BF9(t)+dt*al710*mF10*BF10(t)+dt*al711*mF11*BF11(t)+dt*al712*mF12*BF12(t)+dt*al713*mF13*BF13(t) )/(1+dt*(mu+mF7+nu));
    A7(t+1)=( A7(t)+dt*rho7(t)*A7(t)+ dt*be71*mA1*A1(t)+dt*be72*mA2*A2(t)+dt*be73*mA3*A3(t)+dt*be74*mA4*A4(t)+dt*be75*mA5*A5(t)+dt*be76*mA6*A6(t)+dt*be78*mA8*A8(t)+dt*be79*mA9*A9(t)+dt*be710*mA10*A10(t)+dt*be711*mA11*A11(t)+dt*be712*mA12*A12(t)+dt*be713*mA13*A13(t) )/(1+dt*(mA7+nu));
    BA7(t+1)=( BA7(t)+dt*lamA*A7(t).*BA7(t)/(1+A7(t))+dt*gaA*A7(t).*Bo7(t)/(1+A7(t))+ dt*be71*mA1*BA1(t)+dt*be72*mA2*BA2(t)+dt*be73*mA3*BA3(t)+dt*be74*mA4*BA4(t)+dt*be75*mA5*BA5(t)+dt*be76*mA6*BA6(t)+dt*be78*mA8*BA8(t)+dt*be79*mA9*BA9(t)+dt*be710*mA10*BA10(t)+dt*be711*mA11*BA11(t)+dt*be712*mA12*BA12(t)+dt*be713*mA13*BA13(t) )/(1+dt*(mu+mA7+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo7(t+1)=0;
     else
        Bo7(t+1)=( Bo7(t)+dt*la7(t)*Bo7(t)+(dt*siF*nu)*BF7(t)+(dt*siA*nu)*BA7(t) )/(1+dt*(gaF*F7(t)/(1+F7(t))+gaA*A7(t)/(1+A7(t))+del7(t)+mu));
     end 
     
    F8(t+1)=( F8(t)+dt*r8(t)*F8(t)+ dt*al81*mF1*F1(t)+dt*al82*mF2*F2(t)+dt*al83*mF3*F3(t)+dt*al84*mF4*F4(t)+dt*al85*mF5*F5(t)+dt*al86*mF6*F6(t)+dt*al87*mF7*F7(t)+dt*al89*mF9*F9(t)+dt*al810*mF10*F10(t)+dt*al811*mF11*F11(t)+dt*al812*mF12*F12(t)+dt*al813*mF13*F13(t) )/(1+dt*(mF8+nu));
    BF8(t+1)=( BF8(t)+dt*lamF*F8(t).*BF8(t)/(1+F8(t))+dt*gaF*F8(t).*Bo8(t)/(1+F8(t))+ dt*al81*mF1*BF1(t)+dt*al82*mF2*BF2(t)+dt*al83*mF3*BF3(t)+dt*al84*mF4*BF4(t)+dt*al85*mF5*BF5(t)+dt*al86*mF6*BF6(t)+dt*al87*mF7*BF7(t)+dt*al89*mF9*BF9(t)+dt*al810*mF10*BF10(t)+dt*al811*mF11*BF11(t)+dt*al812*mF12*BF12(t)+dt*al813*mF13*BF13(t) )/(1+dt*(mu+mF8+nu));
    A8(t+1)=( A8(t)+dt*rho8(t)*A8(t)+ dt*be81*mA1*A1(t)+dt*be82*mA2*A2(t)+dt*be83*mA3*A3(t)+dt*be84*mA4*A4(t)+dt*be85*mA5*A5(t)+dt*be86*mA6*A6(t)+dt*be87*mA7*A7(t)+dt*be89*mA9*A9(t)+dt*be810*mA10*A10(t)+dt*be811*mA11*A11(t)+dt*be812*mA12*A12(t)+dt*be813*mA13*A13(t) )/(1+dt*(mA8+nu));
    BA8(t+1)=( BA8(t)+dt*lamA*A8(t).*BA8(t)/(1+A8(t))+dt*gaA*A8(t).*Bo8(t)/(1+A8(t))+ dt*be81*mA1*BA1(t)+dt*be82*mA2*BA2(t)+dt*be83*mA3*BA3(t)+dt*be84*mA4*BA4(t)+dt*be85*mA5*BA5(t)+dt*be86*mA6*BA6(t)+dt*be87*mA7*BA7(t)+dt*be89*mA9*BA9(t)+dt*be810*mA10*BA10(t)+dt*be811*mA11*BA11(t)+dt*be812*mA12*BA12(t)+dt*be813*mA13*BA13(t) )/(1+dt*(mu+mA8+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo8(t+1)=0;
     else
        Bo8(t+1)=( Bo8(t)+dt*la8(t)*Bo8(t)+(dt*siF*nu)*BF8(t)+(dt*siA*nu)*BA8(t) )/(1+dt*(gaF*F8(t)/(1+F8(t))+gaA*A8(t)/(1+A8(t))+del8(t)+mu));
     end 
     
    F9(t+1)=( F9(t)+dt*r9(t)*F9(t)+ dt*al91*mF1*F1(t)+dt*al92*mF2*F2(t)+dt*al93*mF3*F3(t)+dt*al94*mF4*F4(t)+dt*al95*mF5*F5(t)+dt*al96*mF6*F6(t)+dt*al97*mF7*F7(t)+dt*al98*mF8*F8(t)+dt*al910*mF10*F10(t)+dt*al911*mF11*F11(t)+dt*al912*mF12*F12(t)+dt*al913*mF13*F13(t) )/(1+dt*(mF9+nu));
    BF9(t+1)=( BF9(t)+dt*lamF*F9(t).*BF9(t)/(1+F9(t))+dt*gaF*F9(t).*Bo9(t)/(1+F9(t))+ dt*al91*mF1*BF1(t)+dt*al92*mF2*BF2(t)+dt*al93*mF3*BF3(t)+dt*al94*mF4*BF4(t)+dt*al95*mF5*BF5(t)+dt*al96*mF6*BF6(t)+dt*al97*mF7*BF7(t)+dt*al98*mF8*BF8(t)+dt*al910*mF10*BF10(t)+dt*al911*mF11*BF11(t)+dt*al912*mF12*BF12(t)+dt*al913*mF13*BF13(t) )/(1+dt*(mu+mF9+nu)); 
    A9(t+1)=( A9(t)+dt*rho9(t)*A9(t)+ dt*be91*mA1*A1(t)+dt*be92*mA2*A2(t)+dt*be93*mA3*A3(t)+dt*be94*mA4*A4(t)+dt*be95*mA5*A5(t)+dt*be96*mA6*A6(t)+dt*be97*mA7*A7(t)+dt*be98*mA8*A8(t)+dt*be910*mA10*A10(t)+dt*be911*mA11*A11(t)+dt*be912*mA12*A12(t)+dt*be913*mA13*A13(t) )/(1+dt*(mA9+nu));
    BA9(t+1)=( BA9(t)+dt*lamA*A9(t).*BA9(t)/(1+A9(t))+dt*gaA*A9(t).*Bo9(t)/(1+A9(t))+ dt*be91*mA1*BA1(t)+dt*be92*mA2*BA2(t)+dt*be93*mA3*BA3(t)+dt*be94*mA4*BA4(t)+dt*be95*mA5*BA5(t)+dt*be96*mA6*BA6(t)+dt*be97*mA7*BA7(t)+dt*be98*mA8*BA8(t)+dt*be910*mA10*BA10(t)+dt*be911*mA11*BA11(t)+dt*be912*mA12*BA12(t)+dt*be913*mA13*BA13(t) )/(1+dt*(mu+mA9+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo9(t+1)=0;
     else
        Bo9(t+1)=( Bo9(t)+dt*la9(t)*Bo9(t)+(dt*siF*nu)*BF9(t)+(dt*siA*nu)*BA9(t) )/(1+dt*(gaF*F9(t)/(1+F9(t))+gaA*A9(t)/(1+A9(t))+del9(t)+mu));
     end 
     
    F10(t+1)=( F10(t)+dt*r10(t)*F10(t)+ dt*al101*mF1*F1(t)+dt*al102*mF2*F2(t)+dt*al103*mF3*F3(t)+dt*al104*mF4*F4(t)+dt*al105*mF5*F5(t)+dt*al106*mF6*F6(t)+dt*al107*mF7*F7(t)+dt*al108*mF8*F8(t)+dt*al109*mF9*F9(t)+dt*al1011*mF11*F11(t)+dt*al1012*mF12*F12(t)+dt*al1013*mF13*F13(t) )/(1+dt*(mF10+nu));
    BF10(t+1)=( BF10(t)+dt*lamF*F10(t).*BF10(t)/(1+F10(t))+dt*gaF*F10(t).*Bo10(t)/(1+F10(t))+ dt*al101*mF1*BF1(t)+dt*al102*mF2*BF2(t)+dt*al103*mF3*BF3(t)+dt*al104*mF4*BF4(t)+dt*al105*mF5*BF5(t)+dt*al106*mF6*BF6(t)+dt*al107*mF7*BF7(t)+dt*al108*mF8*BF8(t)+dt*al109*mF9*BF9(t)+dt*al1011*mF11*BF11(t)+dt*al1012*mF12*BF12(t)+dt*al1013*mF13*BF13(t) )/(1+dt*(mu+mF10+nu));
    A10(t+1)=( A10(t)+dt*rho10(t)*A10(t)+ dt*be101*mA1*A1(t)+dt*be102*mA2*A2(t)+dt*be103*mA3*A3(t)+dt*be104*mA4*A4(t)+dt*be105*mA5*A5(t)+dt*be106*mA6*A6(t)+dt*be107*mA7*A7(t)+dt*be108*mA8*A8(t)+dt*be109*mA9*A9(t)+dt*be1011*mA11*A11(t)+dt*be1012*mA12*A12(t)+dt*be1013*mA13*A13(t) )/(1+dt*(mA10+nu));
    BA10(t+1)=( BA10(t)+dt*lamA*A10(t).*BA10(t)/(1+A10(t))+dt*gaA*A10(t).*Bo10(t)/(1+A10(t))+ dt*be101*mA1*BA1(t)+dt*be102*mA2*BA2(t)+dt*be103*mA3*BA3(t)+dt*be104*mA4*BA4(t)+dt*be105*mA5*BA5(t)+dt*be106*mA6*BA6(t)+dt*be107*mA7*BA7(t)+dt*be108*mA8*BA8(t)+dt*be109*mA9*BA9(t)+dt*be1011*mA11*BA11(t)+dt*be1012*mA12*BA12(t)+dt*be1013*mA13*BA13(t) )/(1+dt*(mu+mA10+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo10(t+1)=0;
     else
        Bo10(t+1)=( Bo10(t)+dt*la10(t)*Bo10(t)+(dt*siF*nu)*BF10(t)+(dt*siA*nu)*BA10(t) )/(1+dt*(gaF*F10(t)/(1+F10(t))+gaA*A10(t)/(1+A10(t))+del10(t)+mu));
    end 
     
    F11(t+1)=( F11(t)+dt*r11(t)*F11(t)+ dt*al117*mF7*F7(t)+dt*al118*mF8*F8(t)+dt*al119*mF9*F9(t)+dt*al1110*mF10*F10(t)+dt*al1112*mF12*F12(t)+dt*al1113*mF13*F13(t)+dt*al1114*mF14*F14(t)+dt*al1115*mF15*F15(t)+dt*al1116*mF16*F16(t) )/(1+dt*(mF11+nu));
    BF11(t+1)=( BF11(t)+dt*lamF*F11(t).*BF11(t)/(1+F11(t))+dt*gaF*F11(t).*Bo11(t)/(1+F11(t))+ dt*al117*mF7*BF7(t)+dt*al118*mF8*BF8(t)+dt*al119*mF9*BF9(t)+dt*al1110*mF10*BF10(t)+dt*al1112*mF12*BF12(t)+dt*al1113*mF13*BF13(t)+dt*al1114*mF14*BF14(t)+dt*al1115*mF15*BF15(t)+dt*al1116*mF16*BF16(t) )/(1+dt*(mu+mF11+nu));
    A11(t+1)=( A11(t)+dt*rho11(t)*A11(t)+ dt*be117*mA7*A7(t)+dt*be118*mA8*A8(t)+dt*be119*mA9*A9(t)+dt*be1110*mA10*A10(t)+dt*be1112*mA12*A12(t)+dt*be1113*mA13*A13(t)+dt*be1114*mA14*A14(t)+dt*be1115*mA15*A15(t)+dt*be1116*mA16*A16(t) )/(1+dt*(mA11+nu));
    BA11(t+1)=( BA11(t)+dt*lamA*A11(t).*BA11(t)/(1+A11(t))+dt*gaA*A11(t).*Bo11(t)/(1+A11(t))+ dt*be117*mA7*BA7(t)+dt*be118*mA8*BA8(t)+dt*be119*mA9*BA9(t)+dt*be1110*mA10*BA10(t)+dt*be1112*mA12*BA12(t)+dt*be1113*mA13*BA13(t)+dt*be1114*mA14*BA14(t)+dt*be1115*mA15*BA15(t)+dt*be1116*mA16*BA16(t) )/(1+dt*(mu+mA11+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo11(t+1)=0;
     else
        Bo11(t+1)=( Bo11(t)+dt*la11(t)*Bo11(t)+(dt*siF*nu)*BF11(t)+(dt*siA*nu)*BA11(t) )/(1+dt*(gaF*F11(t)/(1+F11(t))+gaA*A11(t)/(1+A11(t))+del11(t)+mu));
    end 

    F12(t+1)=( F12(t)+dt*r12(t)*F12(t)+ dt*al127*mF7*F7(t)+dt*al128*mF8*F8(t)+dt*al129*mF9*F9(t)+dt*al1210*mF10*F10(t)+dt*al1211*mF11*F11(t)+dt*al1213*mF13*F13(t)+dt*al1214*mF14*F14(t)+dt*al1215*mF15*F15(t)+dt*al1216*mF16*F16(t) )/(1+dt*(mF12+nu));
    BF12(t+1)=( BF12(t)+dt*lamF*F12(t).*BF12(t)/(1+F12(t))+dt*gaF*F12(t).*Bo12(t)/(1+F12(t))+ dt*al127*mF7*BF7(t)+dt*al128*mF8*BF8(t)+dt*al129*mF9*BF9(t)+dt*al1210*mF10*BF10(t)+dt*al1211*mF11*BF11(t)+dt*al1213*mF13*BF13(t)+dt*al1214*mF14*BF14(t)+dt*al1215*mF15*BF15(t)+dt*al1216*mF16*BF16(t) )/(1+dt*(mu+mF12+nu));
    A12(t+1)=( A12(t)+dt*rho12(t)*A12(t)+ dt*be127*mA7*A7(t)+dt*be128*mA8*A8(t)+dt*be129*mA9*A9(t)+dt*be1210*mA10*A10(t)+dt*be1211*mA11*A11(t)+dt*be1213*mA13*A13(t)+dt*be1214*mA14*A14(t)+dt*be1215*mA15*A15(t)+dt*be1216*mA16*A16(t) )/(1+dt*(mA12+nu));
    BA12(t+1)=( BA12(t)+dt*lamA*A12(t).*BA12(t)/(1+A12(t))+dt*gaA*A12(t).*Bo12(t)/(1+A12(t))+ dt*be127*mA7*BA7(t)+dt*be128*mA8*BA8(t)+dt*be129*mA9*BA9(t)+dt*be1210*mA10*BA10(t)+dt*be1211*mA11*BA11(t)+dt*be1213*mA13*BA13(t)+dt*be1214*mA14*BA14(t)+dt*be1215*mA15*BA15(t)+dt*be1216*mA16*BA16(t) )/(1+dt*(mu+mA12+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo12(t+1)=0;
    else
        Bo12(t+1)=( Bo12(t)+dt*la12(t)*Bo12(t)+(dt*siF*nu)*BF12(t)+(dt*siA*nu)*BA12(t) )/(1+dt*(gaF*F12(t)/(1+F12(t))+gaA*A12(t)/(1+A12(t))+del12(t)+mu));
    end 

    F13(t+1)=( F13(t)+dt*r13(t)*F13(t)+ dt*al137*mF7*F7(t)+dt*al138*mF8*F8(t)+dt*al139*mF9*F9(t)+dt*al1310*mF10*F10(t)+dt*al1311*mF11*F11(t)+dt*al1312*mF12*F12(t)+dt*al1314*mF14*F14(t)+dt*al1315*mF15*F15(t)+dt*al1316*mF16*F16(t) )/(1+dt*(mF13+nu));
    BF13(t+1)=( BF13(t)+dt*lamF*F13(t).*BF13(t)/(1+F13(t))+dt*gaF*F13(t).*Bo13(t)/(1+F13(t))+ dt*al137*mF7*BF7(t)+dt*al138*mF8*BF8(t)+dt*al139*mF9*BF9(t)+dt*al1310*mF10*BF10(t)+dt*al1311*mF11*BF11(t)+dt*al1312*mF12*BF12(t)+dt*al1314*mF14*BF14(t)+dt*al1315*mF15*BF15(t)+dt*al1316*mF16*BF16(t) )/(1+dt*(mu+mF13+nu));
    A13(t+1)=( A13(t)+dt*rho13(t)*A13(t)+ dt*be137*mA7*A7(t)+dt*be138*mA8*A8(t)+dt*be139*mA9*A9(t)+dt*be1310*mA10*A10(t)+dt*be1311*mA11*A11(t)+dt*be1312*mA12*A12(t)+dt*be1314*mA14*A14(t)+dt*be1315*mA15*A15(t)+dt*be1316*mA16*A16(t) )/(1+dt*(mA13+nu));
    BA13(t+1)=( BA13(t)+dt*lamA*A13(t).*BA13(t)/(1+A13(t))+dt*gaA*A13(t).*Bo13(t)/(1+A13(t))+ dt*be137*mA7*BA7(t)+dt*be138*mA8*BA8(t)+dt*be139*mA9*BA9(t)+dt*be1310*mA10*BA10(t)+dt*be1311*mA11*BA11(t)+dt*be1312*mA12*BA12(t)+dt*be1314*mA14*BA14(t)+dt*be1315*mA15*BA15(t)+dt*be1316*mA16*BA16(t) )/(1+dt*(mu+mA13+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)    
        Bo13(t+1)=0;
    else
        Bo13(t+1)=( Bo13(t)+dt*la13(t)*Bo13(t)+(dt*siF*nu)*BF13(t)+(dt*siA*nu)*BA13(t) )/(1+dt*(gaF*F13(t)/(1+F13(t))+gaA*A13(t)/(1+A13(t))+del13(t)+mu));
    end 

    F14(t+1)=( F14(t)+dt*r14(t)*F14(t)+ dt*al1411*mF11*F11(t)+dt*al1412*mF12*F12(t)+dt*al1413*mF13*F13(t)+dt*al1415*mF15*F15(t)+dt*al1416*mF16*F16(t)+dt*al1417*mF17*F17(t)+dt*al1418*mF18*F18(t)+dt*al1419*mF19*F19(t)+dt*al1420*mF20*F20(t) )/(1+dt*(mF14+nu));
    BF14(t+1)=( BF14(t)+dt*lamF*F14(t).*BF14(t)/(1+F14(t))+dt*gaF*F14(t).*Bo14(t)/(1+F14(t))+ dt*al1411*mF11*BF11(t)+dt*al1412*mF12*BF12(t)+dt*al1413*mF13*BF13(t)+dt*al1415*mF15*BF15(t)+dt*al1416*mF16*BF16(t)+dt*al1417*mF17*BF17(t)+dt*al1418*mF18*BF18(t)+dt*al1419*mF19*BF19(t)+dt*al1420*mF20*BF20(t) )/(1+dt*(mu+mF14+nu)); 
    A14(t+1)=( A14(t)+dt*rho14(t)*A14(t)+ dt*be1411*mA11*A11(t)+dt*be1412*mA12*A12(t)+dt*be1413*mA13*A13(t)+dt*be1415*mA15*A15(t)+dt*be1416*mA16*A16(t)+dt*be1417*mA17*A17(t)+dt*be1418*mA18*A18(t)+dt*be1419*mA19*A19(t)+dt*be1420*mA20*A20(t) )/(1+dt*(mA14+nu));
    BA14(t+1)=( BA14(t)+dt*lamA*A14(t).*BA14(t)/(1+A14(t))+dt*gaA*A14(t).*Bo14(t)/(1+A14(t))+ dt*be1411*mA11*BA11(t)+dt*be1412*mA12*BA12(t)+dt*be1413*mA13*BA13(t)+dt*be1415*mA15*BA15(t)+dt*be1416*mA16*BA16(t)+dt*be1417*mA17*BA17(t)+dt*be1418*mA18*BA18(t)+dt*be1419*mA19*BA19(t)+dt*be1420*mA20*BA20(t) )/(1+dt*(mu+mA14+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo14(t+1)=0; 
    else
        Bo14(t+1)=( Bo14(t)+dt*la14(t)*Bo14(t)+(dt*siF*nu)*BF14(t)+(dt*siA*nu)*BA14(t) +dt*p141(t)*del1(t)*Bo1(t)+dt*p142(t)*del2(t)*Bo2(t)+dt*p143(t)*del3(t)*Bo3(t)+dt*p144(t)*del4(t)*Bo4(t)+dt*p145(t)*del5(t)*Bo5(t)+dt*p146(t)*del6(t)*Bo6(t)+dt*p147(t)*del7(t)*Bo7(t)+dt*p148(t)*del8(t)*Bo8(t)+dt*p149(t)*del9(t)*Bo9(t)+dt*p1410(t)*del10(t)*Bo10(t)+dt*p1411(t)*del11(t)*Bo11(t)+dt*p1412(t)*del12(t)*Bo12(t)+dt*p1413(t)*del13(t)*Bo13(t) )/(1+dt*(gaF*F14(t)/(1+F14(t))+gaA*A14(t)/(1+A14(t))+del14(t)+mu));
    end 

    F15(t+1)=( F15(t)+dt*r15(t)*F15(t)+ dt*al1511*mF11*F11(t)+dt*al1512*mF12*F12(t)+dt*al1513*mF13*F13(t)+dt*al1514*mF14*F14(t)+dt*al1516*mF16*F16(t)+dt*al1517*mF17*F17(t)+dt*al1518*mF18*F18(t)+dt*al1519*mF19*F19(t)+dt*al1520*mF20*F20(t) )/(1+dt*(mF15+nu));
    BF15(t+1)=( BF15(t)+dt*lamF*F15(t).*BF15(t)/(1+F15(t))+dt*gaF*F15(t).*Bo15(t)/(1+F15(t))+ dt*al1511*mF11*BF11(t)+dt*al1512*mF12*BF12(t)+dt*al1513*mF13*BF13(t)+dt*al1514*mF14*BF14(t)+dt*al1516*mF16*BF16(t)+dt*al1517*mF17*BF17(t)+dt*al1518*mF18*BF18(t)+dt*al1519*mF19*BF19(t)+dt*al1520*mF20*BF20(t) )/(1+dt*(mu+mF15+nu));
    A15(t+1)=( A15(t)+dt*rho15(t)*A15(t)+ dt*be1511*mA11*A11(t)+dt*be1512*mA12*A12(t)+dt*be1513*mA13*A13(t)+dt*be1514*mA14*A14(t)+dt*be1516*mA16*A16(t)+dt*be1517*mA17*A17(t)+dt*be1518*mA18*A18(t)+dt*be1519*mA19*A19(t)+dt*be1520*mA20*A20(t) )/(1+dt*(mA15+nu));
    BA15(t+1)=( BA15(t)+dt*lamA*A15(t).*BA15(t)/(1+A15(t))+dt*gaA*A15(t).*Bo15(t)/(1+A15(t))+ dt*be1511*mA11*BA11(t)+dt*be1512*mA12*BA12(t)+dt*be1513*mA13*BA13(t)+dt*be1514*mA14*BA14(t)+dt*be1516*mA16*BA16(t)+dt*be1517*mA17*BA17(t)+dt*be1518*mA18*BA18(t)+dt*be1519*mA19*BA19(t)+dt*be1520*mA20*BA20(t) )/(1+dt*(mu+mA15+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo15(t+1)=0;
     else
        Bo15(t+1)=( Bo15(t)+dt*la15(t)*Bo15(t)+(dt*siF*nu)*BF15(t)+(dt*siA*nu)*BA15(t) +dt*p151(t)*del1(t)*Bo1(t)+dt*p152(t)*del2(t)*Bo2(t)+dt*p153(t)*del3(t)*Bo3(t)+dt*p154(t)*del4(t)*Bo4(t)+dt*p155(t)*del5(t)*Bo5(t)+dt*p156(t)*del6(t)*Bo6(t)+dt*p157(t)*del7(t)*Bo7(t)+dt*p158(t)*del8(t)*Bo8(t)+dt*p159(t)*del9(t)*Bo9(t)+dt*p1510(t)*del10(t)*Bo10(t)+dt*p1511(t)*del11(t)*Bo11(t)+dt*p1512(t)*del12(t)*Bo12(t)+dt*p1513(t)*del13(t)*Bo13(t) )/(1+dt*(gaF*F15(t)/(1+F15(t))+gaA*A15(t)/(1+A15(t))+del15(t)+mu));
    end 

    F16(t+1)=( F16(t)+dt*r16(t)*F16(t)+ dt*al1611*mF11*F11(t)+dt*al1612*mF12*F12(t)+dt*al1613*mF13*F13(t)+dt*al1614*mF14*F14(t)+dt*al1615*mF15*F15(t)+dt*al1617*mF17*F17(t)+dt*al1618*mF18*F18(t)+dt*al1619*mF19*F19(t)+dt*al1620*mF20*F20(t) )/(1+dt*(mF16+nu));
    BF16(t+1)=( BF16(t)+dt*lamF*F16(t).*BF16(t)/(1+F16(t))+dt*gaF*F16(t).*Bo16(t)/(1+F16(t))+ dt*al1611*mF11*BF11(t)+dt*al1612*mF12*BF12(t)+dt*al1613*mF13*BF13(t)+dt*al1614*mF14*BF14(t)+dt*al1615*mF15*BF15(t)+dt*al1617*mF17*BF17(t)+dt*al1618*mF18*BF18(t)+dt*al1619*mF19*BF19(t)+dt*al1620*mF20*BF20(t) )/(1+dt*(mu+mF16+nu));
    A16(t+1)=( A16(t)+dt*rho16(t)*A16(t)+ dt*be1611*mA11*A11(t)+dt*be1612*mA12*A12(t)+dt*be1613*mA13*A13(t)+dt*be1614*mA14*A14(t)+dt*be1615*mA15*A15(t)+dt*be1617*mA17*A17(t)+dt*be1618*mA18*A18(t)+dt*be1619*mA19*A19(t)+dt*be1620*mA20*A20(t) )/(1+dt*(mA16+nu));
    BA16(t+1)=( BA16(t)+dt*lamA*A16(t).*BA16(t)/(1+A16(t))+dt*gaA*A16(t).*Bo16(t)/(1+A16(t))+ dt*be1611*mA11*BA11(t)+dt*be1612*mA12*BA12(t)+dt*be1613*mA13*BA13(t)+dt*be1614*mA14*BA14(t)+dt*be1615*mA15*BA15(t)+dt*be1617*mA17*BA17(t)+dt*be1618*mA18*BA18(t)+dt*be1619*mA19*BA19(t)+dt*be1620*mA20*BA20(t) )/(1+dt*(mu+mA16+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo16(t+1)=0;
     else
        Bo16(t+1)=( Bo16(t)+dt*la16(t)*Bo16(t)+(dt*siF*nu)*BF16(t)+(dt*siA*nu)*BA16(t) +dt*p161(t)*del1(t)*Bo1(t)+dt*p162(t)*del2(t)*Bo2(t)+dt*p163(t)*del3(t)*Bo3(t)+dt*p164(t)*del4(t)*Bo4(t)+dt*p165(t)*del5(t)*Bo5(t)+dt*p166(t)*del6(t)*Bo6(t)+dt*p167(t)*del7(t)*Bo7(t)+dt*p168(t)*del8(t)*Bo8(t)+dt*p169(t)*del9(t)*Bo9(t)+dt*p1610(t)*del10(t)*Bo10(t)+dt*p1611(t)*del11(t)*Bo11(t)+dt*p1612(t)*del12(t)*Bo12(t)+dt*p1613(t)*del13(t)*Bo13(t) )/(1+dt*(gaF*F16(t)/(1+F16(t))+gaA*A16(t)/(1+A16(t))+del16(t)+mu));
    end 

    F17(t+1)=( F17(t)+dt*r17(t)*F17(t)+ dt*al1714*mF14*F14(t)+dt*al1715*mF15*F15(t)+dt*al1716*mF16*F16(t)+dt*al1718*mF18*F18(t)+dt*al1719*mF19*F19(t)+dt*al1720*mF20*F20(t)+dt*al1721*mF21*F21(t)+dt*al1722*mF22*F22(t)+dt*al1723*mF23*F23(t)+dt*al1724*mF24*F24(t)+dt*al1725(t)*mF25*F25(t) )/(1+dt*(mF17+nu));
    BF17(t+1)=( BF17(t)+dt*lamF*F17(t).*BF17(t)/(1+F17(t))+dt*gaF*F17(t).*Bo17(t)/(1+F17(t))+ dt*al1714*mF14*BF14(t)+dt*al1715*mF15*BF15(t)+dt*al1716*mF16*BF16(t)+dt*al1718*mF18*BF18(t)+dt*al1719*mF19*BF19(t)+dt*al1720*mF20*BF20(t)+dt*al1721*mF21*BF21(t)+dt*al1722*mF22*BF22(t)+dt*al1723*mF23*BF23(t)+dt*al1724*mF24*BF24(t)+dt*al1725(t)*mF25*BF25(t) )/(1+dt*(mu+mF17+nu));
    A17(t+1)=( A17(t)+dt*rho17(t)*A17(t)+ dt*be1714*mA14*A14(t)+dt*be1715*mA15*A15(t)+dt*be1716*mA16*A16(t)+dt*be1718*mA18*A18(t)+dt*be1719*mA19*A19(t)+dt*be1720*mA20*A20(t)+dt*be1721*mA21*A21(t)+dt*be1722*mA22*A22(t)+dt*be1723*mA23*A23(t)+dt*be1724*mA24*A24(t)+dt*be1725(t)*mA25*A25(t) )/(1+dt*(mA17+nu));
    BA17(t+1)=( BA17(t)+dt*lamA*A17(t).*BA17(t)/(1+A17(t))+dt*gaA*A17(t).*Bo17(t)/(1+A17(t))+  dt*be1714*mA14*BA14(t)+dt*be1715*mA15*BA15(t)+dt*be1716*mA16*BA16(t)+dt*be1718*mA18*BA18(t)+dt*be1719*mA19*BA19(t)+dt*be1720*mA20*BA20(t)+dt*be1721*mA21*BA21(t)+dt*be1722*mA22*BA22(t)+dt*be1723*mA23*BA23(t)+dt*be1724*mA24*BA24(t)+dt*be1725(t)*mA25*BA25(t) )/(1+dt*(mu+mA17+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo17(t+1)=0;
     else
        Bo17(t+1)=( Bo17(t)+dt*la17(t)*Bo17(t)+(dt*siF*nu)*BF17(t)+(dt*siA*nu)*BA17(t) )/(1+dt*(gaF*F17(t)/(1+F17(t))+gaA*A17(t)/(1+A17(t))+del17(t)+mu));
    end

    F18(t+1)=( F18(t)+dt*r18(t)*F18(t)+ dt*al1814*mF14*F14(t)+dt*al1815*mF15*F15(t)+dt*al1816*mF16*F16(t)+dt*al1817*mF17*F17(t)+dt*al1819*mF19*F19(t)+dt*al1820*mF20*F20(t)+dt*al1821*mF21*F21(t)+dt*al1822*mF22*F22(t)+dt*al1823*mF23*F23(t)+dt*al1824*mF24*F24(t)+dt*al1825(t)*mF25*F25(t) )/(1+dt*(mF18+nu));
    BF18(t+1)=( BF18(t)+dt*lamF*F18(t).*BF18(t)/(1+F18(t))+dt*gaF*F18(t).*Bo18(t)/(1+F18(t))+ dt*al1814*mF14*BF14(t)+dt*al1815*mF15*BF15(t)+dt*al1816*mF16*BF16(t)+dt*al1817*mF17*BF17(t)+dt*al1819*mF19*BF19(t)+dt*al1820*mF20*BF20(t)+dt*al1821*mF21*BF21(t)+dt*al1822*mF22*BF22(t)+dt*al1823*mF23*BF23(t)+dt*al1824*mF24*BF24(t)+dt*al1825(t)*mF25*BF25(t) )/(1+dt*(mu+mF18+nu));
    A18(t+1)=( A18(t)+dt*rho18(t)*A18(t)+ dt*be1814*mA14*A14(t)+dt*be1815*mA15*A15(t)+dt*be1816*mA16*A16(t)+dt*be1817*mA17*A17(t)+dt*be1819*mA19*A19(t)+dt*be1820*mA20*A20(t)+dt*be1821*mA21*A21(t)+dt*be1822*mA22*A22(t)+dt*be1823*mA23*A23(t)+dt*be1824*mA24*A24(t)+dt*be1825(t)*mA25*A25(t) )/(1+dt*(mA18+nu));
    BA18(t+1)=( BA18(t)+dt*lamA*A18(t).*BA18(t)/(1+A18(t))+dt*gaA*A18(t).*Bo18(t)/(1+A18(t))+ dt*be1814*mA14*BA14(t)+dt*be1815*mA15*BA15(t)+dt*be1816*mA16*BA16(t)+dt*be1817*mA17*BA17(t)+dt*be1819*mA19*BA19(t)+dt*be1820*mA20*BA20(t)+dt*be1821*mA21*BA21(t)+dt*be1822*mA22*BA22(t)+dt*be1823*mA23*BA23(t)+dt*be1824*mA24*BA24(t)+dt*be1825(t)*mA25*BA25(t) )/(1+dt*(mu+mA18+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo18(t+1)=0;
     else
        Bo18(t+1)=( Bo18(t)+dt*la18(t)*Bo18(t)+(dt*siF*nu)*BF18(t)+(dt*siA*nu)*BA18(t) )/(1+dt*(gaF*F18(t)/(1+F18(t))+gaA*A18(t)/(1+A18(t))+del18(t)+mu));
    end 

    F19(t+1)=( F19(t)+dt*r19(t)*F19(t)+ dt*al1914*mF14*F14(t)+dt*al1915*mF15*F15(t)+dt*al1916*mF16*F16(t)+dt*al1917*mF17*F17(t)+dt*al1918*mF18*F18(t)+dt*al1920*mF20*F20(t)+dt*al1921*mF21*F21(t)+dt*al1922*mF22*F22(t)+dt*al1923*mF23*F23(t)+dt*al1924*mF24*F24(t)+dt*al1925(t)*mF25*F25(t) )/(1+dt*(mF19+nu));
    BF19(t+1)=( BF19(t)+dt*lamF*F19(t).*BF19(t)/(1+F19(t))+dt*gaF*F19(t).*Bo19(t)/(1+F19(t))+ dt*al1914*mF14*BF14(t)+dt*al1915*mF15*BF15(t)+dt*al1916*mF16*BF16(t)+dt*al1917*mF17*BF17(t)+dt*al1918*mF18*BF18(t)+dt*al1920*mF20*BF20(t)+dt*al1921*mF21*BF21(t)+dt*al1922*mF22*BF22(t)+dt*al1923*mF23*BF23(t)+dt*al1924*mF24*BF24(t)+dt*al1925(t)*mF25*BF25(t) )/(1+dt*(mu+mF19+nu));
    A19(t+1)=( A19(t)+dt*rho19(t)*A19(t)+ dt*be1914*mA14*A14(t)+dt*be1915*mA15*A15(t)+dt*be1916*mA16*A16(t)+dt*be1917*mA17*A17(t)+dt*be1918*mA18*A18(t)+dt*be1920*mA20*A20(t)+dt*be1921*mA21*A21(t)+dt*be1922*mA22*A22(t)+dt*be1923*mA23*A23(t)+dt*be1924*mA24*A24(t)+dt*be1925(t)*mA25*A25(t) )/(1+dt*(mA19+nu));
    BA19(t+1)=( BA19(t)+dt*lamA*A19(t).*BA19(t)/(1+A19(t))+dt*gaA*A19(t).*Bo19(t)/(1+A19(t))+ dt*be1914*mA14*BA14(t)+dt*be1915*mA15*BA15(t)+dt*be1916*mA16*BA16(t)+dt*be1917*mA17*BA17(t)+dt*be1918*mA18*BA18(t)+dt*be1920*mA20*BA20(t)+dt*be1921*mA21*BA21(t)+dt*be1922*mA22*BA22(t)+dt*be1923*mA23*BA23(t)+dt*be1924*mA24*BA24(t)+dt*be1925(t)*mA25*BA25(t) )/(1+dt*(mu+mA19+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo19(t+1)=0;
     else
        Bo19(t+1)=( Bo19(t)+dt*la19(t)*Bo19(t)+(dt*siF*nu)*BF19(t)+(dt*siA*nu)*BA19(t) )/(1+dt*(gaF*F19(t)/(1+F19(t))+gaA*A19(t)/(1+A19(t))+del19(t)+mu));
    end 

    F20(t+1)=( F20(t)+dt*r20(t)*F20(t)+ dt*al2014*mF14*F14(t)+dt*al2015*mF15*F15(t)+dt*al2016*mF16*F16(t)+dt*al2017*mF17*F17(t)+dt*al2018*mF18*F18(t)+dt*al2019*mF19*F19(t)+dt*al2021*mF21*F21(t)+dt*al2022*mF22*F22(t)+dt*al2023*mF23*F23(t)+dt*al2024*mF24*F24(t)+dt*al2025(t)*mF25*F25(t) )/(1+dt*(mF20+nu));
    BF20(t+1)=( BF20(t)+dt*lamF*F20(t).*BF20(t)/(1+F20(t))+dt*gaF*F20(t).*Bo20(t)/(1+F20(t))+ dt*al2014*mF14*BF14(t)+dt*al2015*mF15*BF15(t)+dt*al2016*mF16*BF16(t)+dt*al2017*mF17*BF17(t)+dt*al2018*mF18*BF18(t)+dt*al2019*mF19*BF19(t)+dt*al2021*mF21*BF21(t)+dt*al2022*mF22*BF22(t)+dt*al2023*mF23*BF23(t)+dt*al2024*mF24*BF24(t)+dt*al2025(t)*mF25*BF25(t) )/(1+dt*(mu+mF20+nu));
    A20(t+1)=( A20(t)+dt*rho20(t)*A20(t)+ dt*be2014*mA14*A14(t)+dt*be2015*mA15*A15(t)+dt*be2016*mA16*A16(t)+dt*be2017*mA17*A17(t)+dt*be2018*mA18*A18(t)+dt*be2019*mA19*A19(t)+dt*be2021*mA21*A21(t)+dt*be2022*mA22*A22(t)+dt*be2023*mA23*A23(t)+dt*be2024*mA24*A24(t)+dt*be2025(t)*mA25*A25(t) )/(1+dt*(mA20+nu));
    BA20(t+1)=( BA20(t)+dt*lamA*A20(t).*BA20(t)/(1+A20(t))+dt*gaA*A20(t).*Bo20(t)/(1+A20(t))+ dt*be2014*mA14*BA14(t)+dt*be2015*mA15*BA15(t)+dt*be2016*mA16*BA16(t)+dt*be2017*mA17*BA17(t)+dt*be2018*mA18*BA18(t)+dt*be2019*mA19*BA19(t)+dt*be2021*mA21*BA21(t)+dt*be2022*mA22*BA22(t)+dt*be2023*mA23*BA23(t)+dt*be2024*mA24*BA24(t)+dt*be2025(t)*mA25*BA25(t) )/(1+dt*(mu+mA20+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo20(t+1)=0;
     else
        Bo20(t+1)=( Bo20(t)+dt*la20(t)*Bo20(t)+(dt*siF*nu)*BF20(t)+(dt*siA*nu)*BA20(t) )/(1+dt*(gaF*F20(t)/(1+F20(t))+gaA*A20(t)/(1+A20(t))+del20(t)+mu));
    end
        
    F21(t+1)=( F21(t)+dt*r21(t)*F21(t)+ dt*al2117*mF17*F17(t)+dt*al2118*mF18*F18(t)+dt*al2119*mF19*F19(t)+dt*al2120*mF20*F20(t)+dt*al2122*mF22*F22(t)+dt*al2123*mF23*F23(t)+dt*al2124*mF24*F24(t)+dt*al2125(t)*mF25*F25(t) )/(1+dt*(mF21+nu));
    BF21(t+1)=( BF21(t)+dt*lamF*F21(t).*BF21(t)/(1+F21(t))+dt*gaF*F21(t).*Bo21(t)/(1+F21(t))+ dt*al2117*mF17*BF17(t)+dt*al2118*mF18*BF18(t)+dt*al2119*mF19*BF19(t)+dt*al2120*mF20*BF20(t)+dt*al2122*mF22*BF22(t)+dt*al2123*mF23*BF23(t)+dt*al2124*mF24*BF24(t)+dt*al2125(t)*mF25*BF25(t) )/(1+dt*(mu+mF21+nu));
    A21(t+1)=( A21(t)+dt*rho21(t)*A21(t)+ dt*be2117*mA17*A17(t)+dt*be2118*mA18*A18(t)+dt*be2119*mA19*A19(t)+dt*be2120*mA20*A20(t)+dt*be2122*mA22*A22(t)+dt*be2123*mA23*A23(t)+dt*be2124*mA24*A24(t)+dt*be2125(t)*mA25*A25(t) )/(1+dt*(mA21+nu));
    BA21(t+1)=( BA21(t)+dt*lamA*A21(t).*BA21(t)/(1+A21(t))+dt*gaA*A21(t).*Bo21(t)/(1+A21(t))+ dt*be2117*mA17*BA17(t)+dt*be2118*mA18*BA18(t)+dt*be2119*mA19*BA19(t)+dt*be2120*mA20*BA20(t)+dt*be2122*mA22*BA22(t)+dt*be2123*mA23*BA23(t)+dt*be2124*mA24*BA24(t)+dt*be2125(t)*mA25*BA25(t) )/(1+dt*(mu+mA21+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo21(t+1)=0;
     else
        Bo21(t+1)=( Bo21(t)+dt*la21(t)*Bo21(t)+(dt*siF*nu)*BF21(t)+(dt*siA*nu)*BA21(t)+ dt*p211(t)*del1(t)*Bo1(t)+dt*p212(t)*del2(t)*Bo2(t)+dt*p213(t)*del3(t)*Bo3(t)+dt*p214(t)*del4(t)*Bo4(t)+dt*p215(t)*del5(t)*Bo5(t)+dt*p216(t)*del6(t)*Bo6(t)+dt*p217(t)*del7(t)*Bo7(t)+dt*p218(t)*del8(t)*Bo8(t)+dt*p219(t)*del9(t)*Bo9(t)+dt*p2110(t)*del10(t)*Bo10(t)+dt*p2111(t)*del11(t)*Bo11(t)+dt*p2112(t)*del12(t)*Bo12(t)+dt*p2113(t)*del13(t)*Bo13(t)+dt*p2114(t)*del14(t)*Bo14(t)+dt*p2115(t)*del15(t)*Bo15(t)+dt*p2116(t)*del16(t)*Bo16(t)+dt*p2117*del17(t)*Bo17(t)+dt*p2118*del18(t)*Bo18(t)+dt*p2119*del19(t)*Bo19(t)+dt*p2120*del20(t)*Bo20(t) )/(1+dt*(gaF*F21(t)/(1+F21(t))+gaA*A21(t)/(1+A21(t))+del21(t)+mu));
    end

    F22(t+1)=( F22(t)+dt*r22(t)*F22(t)+ dt*al2217*mF17*F17(t)+dt*al2218*mF18*F18(t)+dt*al2219*mF19*F19(t)+dt*al2220*mF20*F20(t)+dt*al2221*mF21*F21(t)+dt*al2223*mF23*F23(t)+dt*al2224*mF24*F24(t)+dt*al2225(t)*mF25*F25(t) )/(1+dt*(mF22+nu));
    BF22(t+1)=( BF22(t)+dt*lamF*F22(t).*BF22(t)/(1+F22(t))+dt*gaF*F22(t).*Bo22(t)/(1+F22(t))+ dt*al2217*mF17*BF17(t)+dt*al2218*mF18*BF18(t)+dt*al2219*mF19*BF19(t)+dt*al2220*mF20*BF20(t)+dt*al2221*mF21*BF21(t)+dt*al2223*mF23*BF23(t)+dt*al2224*mF24*BF24(t)+dt*al2225(t)*mF25*BF25(t) )/(1+dt*(mu+mF22+nu));
    A22(t+1)=( A22(t)+dt*rho22(t)*A22(t)+ dt*be2217*mA17*A17(t)+dt*be2218*mA18*A18(t)+dt*be2219*mA19*A19(t)+dt*be2220*mA20*A20(t)+dt*be2221*mA21*A21(t)+dt*be2223*mA23*A23(t)+dt*be2224*mA24*A24(t)+dt*be2225(t)*mA25*A25(t) )/(1+dt*(mA22+nu));
    BA22(t+1)=( BA22(t)+dt*lamA*A22(t).*BA22(t)/(1+A22(t))+dt*gaA*A22(t).*Bo22(t)/(1+A22(t))+ dt*be2217*mA17*BA17(t)+dt*be2218*mA18*BA18(t)+dt*be2219*mA19*BA19(t)+dt*be2220*mA20*BA20(t)+dt*be2221*mA21*BA21(t)+dt*be2223*mA23*BA23(t)+dt*be2224*mA24*BA24(t)+dt*be2225(t)*mA25*BA25(t) )/(1+dt*(mu+mA22+nu));  
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo22(t+1)=0;
     else
        Bo22(t+1)=( Bo22(t)+dt*la22(t)*Bo22(t)+(dt*siF*nu)*BF22(t)+(dt*siA*nu)*BA22(t)+ dt*p221(t)*del1(t)*Bo1(t)+dt*p222(t)*del2(t)*Bo2(t)+dt*p223(t)*del3(t)*Bo3(t)+dt*p224(t)*del4(t)*Bo4(t)+dt*p225(t)*del5(t)*Bo5(t)+dt*p226(t)*del6(t)*Bo6(t)+dt*p227(t)*del7(t)*Bo7(t)+dt*p228(t)*del8(t)*Bo8(t)+dt*p229(t)*del9(t)*Bo9(t)+dt*p2210(t)*del10(t)*Bo10(t)+dt*p2211(t)*del11(t)*Bo11(t)+dt*p2212(t)*del12(t)*Bo12(t)+dt*p2213(t)*del13(t)*Bo13(t)+dt*p2214(t)*del14(t)*Bo14(t)+dt*p2215(t)*del15(t)*Bo15(t)+dt*p2216(t)*del16(t)*Bo16(t)+dt*p2217*del17(t)*Bo17(t)+dt*p2218*del18(t)*Bo18(t)+dt*p2219*del19(t)*Bo19(t)+dt*p2220*del20(t)*Bo20(t) )/(1+dt*(gaF*F22(t)/(1+F22(t))+gaA*A22(t)/(1+A22(t))+del22(t)+mu));
    end 
    
    F23(t+1)=( F23(t)+dt*r23(t)*F23(t)+ dt*al2317*mF17*F17(t)+dt*al2318*mF18*F18(t)+dt*al2319*mF19*F19(t)+dt*al2320*mF20*F20(t)+dt*al2321*mF21*F21(t)+dt*al2322*mF22*F22(t)+dt*al2324*mF24*F24(t)+dt*al2325(t)*mF25*F25(t) )/(1+dt*(mF23+nu));
    BF23(t+1)=( BF23(t)+dt*lamF*F23(t).*BF23(t)/(1+F23(t))+dt*gaF*F23(t).*Bo23(t)/(1+F23(t))+ dt*al2317*mF17*BF17(t)+dt*al2318*mF18*BF18(t)+dt*al2319*mF19*BF19(t)+dt*al2320*mF20*BF20(t)+dt*al2321*mF21*BF21(t)+dt*al2322*mF22*BF22(t)+dt*al2324*mF24*BF24(t)+dt*al2325(t)*mF25*BF25(t) )/(1+dt*(mu+mF23+nu));
    A23(t+1)=( A23(t)+dt*rho23(t)*A23(t)+ dt*be2317*mA17*A17(t)+dt*be2318*mA18*A18(t)+dt*be2319*mA19*A19(t)+dt*be2320*mA20*A20(t)+dt*be2321*mA21*A21(t)+dt*be2322*mA22*A22(t)+dt*be2324*mA24*A24(t)+dt*be2325(t)*mA25*A25(t) )/(1+dt*(mA23+nu));
    BA23(t+1)=( BA23(t)+dt*lamA*A23(t).*BA23(t)/(1+A23(t))+dt*gaA*A23(t).*Bo23(t)/(1+A23(t))+ dt*be2317*mA17*BA17(t)+dt*be2318*mA18*BA18(t)+dt*be2319*mA19*BA19(t)+dt*be2320*mA20*BA20(t)+dt*be2321*mA21*BA21(t)+dt*be2322*mA22*BA22(t)+dt*be2324*mA24*BA24(t)+dt*be2325(t)*mA25*BA25(t) )/(1+dt*(mu+mA23+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo23(t+1)=0;
     else
        Bo23(t+1)=( Bo23(t)+dt*la23(t)*Bo23(t)+(dt*siF*nu)*BF23(t)+(dt*siA*nu)*BA23(t)+ dt*p231(t)*del1(t)*Bo1(t)+dt*p232(t)*del2(t)*Bo2(t)+dt*p233(t)*del3(t)*Bo3(t)+dt*p234(t)*del4(t)*Bo4(t)+dt*p235(t)*del5(t)*Bo5(t)+dt*p236(t)*del6(t)*Bo6(t)+dt*p237(t)*del7(t)*Bo7(t)+dt*p238(t)*del8(t)*Bo8(t)+dt*p239(t)*del9(t)*Bo9(t)+dt*p2310(t)*del10(t)*Bo10(t)+dt*p2311(t)*del11(t)*Bo11(t)+dt*p2312(t)*del12(t)*Bo12(t)+dt*p2313(t)*del13(t)*Bo13(t)+dt*p2314(t)*del14(t)*Bo14(t)+dt*p2315(t)*del15(t)*Bo15(t)+dt*p2316(t)*del16(t)*Bo16(t)+dt*p2317*del17(t)*Bo17(t)+dt*p2318*del18(t)*Bo18(t)+dt*p2319*del19(t)*Bo19(t)+dt*p2320*del20(t)*Bo20(t) )/(1+dt*(gaF*F23(t)/(1+F23(t))+gaA*A23(t)/(1+A23(t))+del23(t)+mu));
    end

    F24(t+1)=( F24(t)+dt*r24(t)*F24(t)+ dt*al2417*mF17*F17(t)+dt*al2418*mF18*F18(t)+dt*al2419*mF19*F19(t)+dt*al2420*mF20*F20(t)+dt*al2421*mF21*F21(t)+dt*al2422*mF22*F22(t)+dt*al2423*mF23*F23(t)+dt*al2425(t)*mF25*F25(t) )/(1+dt*(mF24+nu));
    BF24(t+1)=( BF24(t)+dt*lamF*F24(t).*BF24(t)/(1+F24(t))+dt*gaF*F24(t).*Bo24(t)/(1+F24(t))+ dt*al2417*mF17*BF17(t)+dt*al2418*mF18*BF18(t)+dt*al2419*mF19*BF19(t)+dt*al2420*mF20*BF20(t)+dt*al2421*mF21*BF21(t)+dt*al2422*mF22*BF22(t)+dt*al2423*mF23*BF23(t)+dt*al2425(t)*mF25*BF25(t) )/(1+dt*(mu+mF24+nu));
    A24(t+1)=( A24(t)+dt*rho24(t)*A24(t)+ dt*be2417*mA17*A17(t)+dt*be2418*mA18*A18(t)+dt*be2419*mA19*A19(t)+dt*be2420*mA20*A20(t)+dt*be2421*mA21*A21(t)+dt*be2422*mA22*A22(t)+dt*be2423*mA23*A23(t)+dt*be2425(t)*mA25*A25(t) )/(1+dt*(mA24+nu));
    BA24(t+1)=( BA24(t)+dt*lamA*A24(t).*BA24(t)/(1+A24(t))+dt*gaA*A24(t).*Bo24(t)/(1+A24(t))+ dt*be2417*mA17*BA17(t)+dt*be2418*mA18*BA18(t)+dt*be2419*mA19*BA19(t)+dt*be2420*mA20*BA20(t)+dt*be2421*mA21*BA21(t)+dt*be2422*mA22*BA22(t)+dt*be2423*mA23*BA23(t)+dt*be2425(t)*mA25*BA25(t) )/(1+dt*(mu+mA24+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo24(t+1)=0;
     else
        Bo24(t+1)=( Bo24(t)+dt*la24(t)*Bo24(t)+(dt*siF*nu)*BF24(t)+(dt*siA*nu)*BA24(t)+ dt*p241(t)*del1(t)*Bo1(t)+dt*p242(t)*del2(t)*Bo2(t)+dt*p243(t)*del3(t)*Bo3(t)+dt*p244(t)*del4(t)*Bo4(t)+dt*p245(t)*del5(t)*Bo5(t)+dt*p246(t)*del6(t)*Bo6(t)+dt*p247(t)*del7(t)*Bo7(t)+dt*p248(t)*del8(t)*Bo8(t)+dt*p249(t)*del9(t)*Bo9(t)+dt*p2410(t)*del10(t)*Bo10(t)+dt*p2411(t)*del11(t)*Bo11(t)+dt*p2412(t)*del12(t)*Bo12(t)+dt*p2413(t)*del13(t)*Bo13(t)+dt*p2414(t)*del14(t)*Bo14(t)+dt*p2415(t)*del15(t)*Bo15(t)+dt*p2416(t)*del16(t)*Bo16(t)+dt*p2417*del17(t)*Bo17(t)+dt*p2418*del18(t)*Bo18(t)+dt*p2419*del19(t)*Bo19(t)+dt*p2420*del20(t)*Bo20(t) )/(1+dt*(gaF*F24(t)/(1+F24(t))+gaA*A24(t)/(1+A24(t))+del24(t)+mu));
    end
    
    F25(t+1)=( F25(t)+dt*r25(t)*F25(t)+ dt*al2517*mF17*F17(t)+dt*al2518*mF18*F18(t)+dt*al2519*mF19*F19(t)+dt*al2520*mF20*F20(t)+dt*al2521*mF21*F21(t)+dt*al2522*mF22*F22(t)+dt*al2523*mF23*F23(t)+dt*al2524*mF24*F24(t) )/(1+dt*(mF25+nu));
    BF25(t+1)=( BF25(t)+dt*lamF*F25(t).*BF25(t)/(1+F25(t))+dt*gaF*F25(t).*Bo25(t)/(1+F25(t))+ dt*al2517*mF17*BF17(t)+dt*al2518*mF18*BF18(t)+dt*al2519*mF19*BF19(t)+dt*al2520*mF20*BF20(t)+dt*al2521*mF21*BF21(t)+dt*al2522*mF22*BF22(t)+dt*al2523*mF23*BF23(t)+dt*al2524*mF24*BF24(t) )/(1+dt*(mu+mF25+nu));
    A25(t+1)=( A25(t)+dt*rho25(t)*A25(t)+ dt*be2517*mA17*A17(t)+dt*be2518*mA18*A18(t)+dt*be2519*mA19*A19(t)+dt*be2520*mA20*A20(t)+dt*be2521*mA21*A21(t)+dt*be2522*mA22*A22(t)+dt*be2523*mA23*A23(t)+dt*be2524*mA24*A24(t) )/(1+dt*(mA25+nu));
    BA25(t+1)=( BA25(t)+dt*lamA*A25(t).*BA25(t)/(1+A25(t))+dt*gaA*A25(t).*Bo25(t)/(1+A25(t))+ dt*be2517*mA17*BA17(t)+dt*be2518*mA18*BA18(t)+dt*be2519*mA19*BA19(t)+dt*be2520*mA20*BA20(t)+dt*be2521*mA21*BA21(t)+dt*be2522*mA22*BA22(t)+dt*be2523*mA23*BA23(t)+dt*be2524*mA24*BA24(t) )/(1+dt*(mu+mA25+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo25(t+1)=0;
     else
        Bo25(t+1)=( Bo25(t)+dt*la25(t)*Bo25(t)+(dt*siF*nu)*BF25(t)+(dt*siA*nu)*BA25(t)+ dt*p251(t)*del1(t)*Bo1(t)+dt*p252(t)*del2(t)*Bo2(t)+dt*p253(t)*del3(t)*Bo3(t)+dt*p254(t)*del4(t)*Bo4(t)+dt*p255(t)*del5(t)*Bo5(t)+dt*p256(t)*del6(t)*Bo6(t)+dt*p257(t)*del7(t)*Bo7(t)+dt*p258(t)*del8(t)*Bo8(t)+dt*p259(t)*del9(t)*Bo9(t)+dt*p2510(t)*del10(t)*Bo10(t)+dt*p2511(t)*del11(t)*Bo11(t)+dt*p2512(t)*del12(t)*Bo12(t)+dt*p2513(t)*del13(t)*Bo13(t)+dt*p2514(t)*del14(t)*Bo14(t)+dt*p2515(t)*del15(t)*Bo15(t)+dt*p2516(t)*del16(t)*Bo16(t)+dt*p2517*del17(t)*Bo17(t)+dt*p2518*del18(t)*Bo18(t)+dt*p2519*del19(t)*Bo19(t)+dt*p2520*del20(t)*Bo20(t) )/(1+dt*(gaF*F25(t)/(1+F25(t))+gaA*A25(t)/(1+A25(t))+del25(t)+mu));
    end
    
end

t = 1:nt+1;
% Downstream MU abundance 
Bo(t)=Bo21(t)+Bo22(t)+Bo23(t)+Bo24(t)+Bo25(t)  ;   

% plot
t = 0:nt;
figure
plot(t,Bo,'g','LineWidth',2);
xlabel('time (weeks)'); ylabel('Concentration')
axis([0 nt 0 0.000002]);



