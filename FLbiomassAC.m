% A metacommunity model composed of two species (fish and macroinvertebrate) and a bacterial population.
%long distance migration for fish and short distance migration for macroinvertebrate 
%%

clc;
close all;
clear all;

% contant parameters     
nt=468;          %Number of time steps 
dt=0.01;         %Width of each time step
siF=2;          %recycling coefficient for Fish meta 
siA=3;          %recycling coefficetnt for Arthro meta 
lamF=0.05;       %mircrobio reprod rate for Fish
sF=1; sA=1;      % Half saturation Michaelis-Menten constant
lamA=0.5;        %mircrobio reprod rate for arthropode
gaF=0.05;        %contac rate for Fish      
gaA=0.3;         %contact rate for arthro
nu=0.1;          %death rate of fish
mu=0.1;          %death rate of bacteria

%initialization of variables of the model
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

%connectivity Fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)                %rainy period 1
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (31<=t)&&(t<=52)                 %dry period 1
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (53<=t)&&(t<=82)                %rainy period 2
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (83<=t)&&(t<=104)                 %dry period 2
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;    
    elseif (105<=t)&&(t<=134)                %rainy period 3
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (135<=t)&&(t<=156)          %dry period 3
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (157<=t)&&(t<=186)          %rainy period 4
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (187<=t)&&(t<=208)          %dry period 4
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (209<=t)&&(t<=238)          %rainy period 5
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (239<=t)&&(t<=260)        %dry period 5
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (261<=t)&&(t<=290)        %rainy period 6
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (291<=t)&&(t<=312)         %dry period 6
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (313<=t)&&(t<=342)      %rainy period 7
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (343<=t)&&(t<=364)         %dry period 7
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (365<=t)&&(t<=394)       %rainy period 8
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (395<=t)&&(t<=416)       %dry period 8
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (417<=t)&&(t<=446)         %rainy period 9
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (447<=t)&&(t<=468)          %dry period 9
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    elseif (469<=t)&&(t<=498)         %rainy period 10
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;
    else                               %dry period 10
        al21(t)=0.25; al31(t)=0.2; al41(t)=0.15; al51(t)=0.1; al61(t)=0.1;
        al71(t)=0.08; al81(t)=0.06; al91(t)=0.04; al101(t)=0.02;       
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)                %rainy period 1
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (31<=t)&&(t<=52)                                %dry period 1
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;    
    elseif  (53<=t)&&(t<=82)                %rainy period 2
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (83<=t)&&(t<=104)                                %dry period 2
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;    
    elseif (105<=t)&&(t<=134)                %rainy period 3
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (135<=t)&&(t<=156)                    %dry period 3
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;
    elseif (157<=t)&&(t<=186)                %rainy period 4
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (187<=t)&&(t<=208)                    %dry period 4
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (209<=t)&&(t<=238)                %rainy period 5
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (239<=t)&&(t<=260)                    %dry period 5
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;
    elseif (261<=t)&&(t<=290)                %rainy period 6
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (290<=t)&&(t<=312)                    %dry period 6
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;
    elseif (313<=t)&&(t<=342)                %rainy period 7
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (343<=t)&&(t<=364)                    %dry period 7
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (365<=t)&&(t<=394)                %rainy period 8
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (395<=t)&&(t<=416)                    %dry period 8
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;
    elseif (417<=t)&&(t<=446)                %rainy period 9
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0; 
    elseif (447<=t)&&(t<=468)                    %dry period 9
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;    
    elseif (469<=t)&&(t<=498)                %rainy period 10
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;    
    else                                %dry period 10
        be21(t)=0.2; be31(t)=0.2; be41(t)=0.2; be51(t)=0.2; be61(t)=0.2;
        be71(t)=0; be81(t)=0; be91(t)=0; be101(t)=0;     
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
         p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (166<=t)&&(t<179)      %migrate period 4
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (179<=t)&&(t<=186)     %end migrate period 4
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (218<=t)&&(t<231)      %migrate period 5
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (231<=t)&&(t<=238)      %end migrate period 5
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (270<=t)&&(t<283)      %migrate period 6
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (283<=t)&&(t<=290)     %end migrate period 6
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (322<=t)&&(t<335)      %migrate period 7
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (335<=t)&&(t<=342)    %end migrate period 7
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (374<=t)&&(t<387)      %migrate period 8
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (387<=t)&&(t<=394)     %end migrate period 8
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (426<=t)&&(t<439)      %migrate period 9
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (439<=t)&&(t<=446)     %end migrate period 9
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    elseif (478<=t)&&(t<491)      %migrate period 10
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0.2; p221(t)=0.2; p231(t)=0.2; p241(t)=0.2; p251(t)=0.2;
    elseif (491<=t)&&(t<=498)     %end migrate period 10
        p141(t)=0.34; p151(t)=0.33; p161(t)=0.33;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;
    else                                
        p141(t)=0; p151(t)=0; p161(t)=0;
        p211(t)=0; p221(t)=0; p231(t)=0; p241(t)=0; p251(t)=0;    
    end    
end
%Reproduction rates of carrier host  
t=0:nt ;
r= 0.3*wblpdf(t,10,1.5);        % Weibull distribution  
for t=1:nt+1
    if (16<=t)&&(t<=52)       %season 1
        r1(t)= 17.5*r(t-15);
    elseif (68<=t)&&(t<=104)  %season 2
        r1(t)= 17.5*r(t-67);
    elseif (120<=t)&&(t<=156)  %season 3
        r1(t)= 17.5*r(t-119);
    elseif (172<=t)&&(t<=208)  %season 4
        r1(t)= 17.5*r(t-171);    
    elseif (214<=t)&&(t<=260)  %season 5
        r1(t)= 17.5*r(t-213);    
    elseif (276<=t)&&(t<=312)  %season 6
        r1(t)= 17.5*r(t-275);    
    elseif (328<=t)&&(t<=364)  %season 7
        r1(t)= 17.5*r(t-327);    
    elseif (380<=t)&&(t<=416)  %season 8
        r1(t)= 17.5*r(t-379);    
    elseif (432<=t)&&(t<=468)  %season 9
        r1(t)= 17.5*r(t-431);    
    elseif (484<=t)&&(t<=520)  %season 10
        r1(t)=17.5*r(t-483);    
    else
        r1(t)= 0;
    end
end
rho1= r1;    
 % Reproduction rates of free-living bacteria
for t=1:nt+1                    
    if  (20<=t)&&(t<=40)      %season 1
        la1(t)=0.2*exp(-0.06*(t-30).^2);    
    elseif (72<=t)&&(t<=92)    %season 2
        la1(t)=0.2*exp(-0.06*(t-82).^2);
    elseif (124<=t)&&(t<=144)    %season 3
        la1(t)=0.2*exp(-0.06*(t-134).^2);    
    elseif (176<=t)&&(t<=196)    %season 4
        la1(t)=0.2*exp(-0.06*(t-186).^2);  
    elseif (228<=t)&&(t<=248)    %season 5
        la1(t)=0.2*exp(-0.06*(t-238).^2);    
    elseif (280<=t)&&(t<=300)    %season 6
        la1(t)=0.2*exp(-0.06*(t-290).^2);   
    elseif (332<=t)&&(t<=352)    %season 7
        la1(t)=0.2*exp(-0.06*(t-342).^2);    
    elseif (384<=t)&&(t<=404)    %season 8
        la1(t)=0.2*exp(-0.06*(t-394).^2);   
    elseif (436<=t)&&(t<=456)    %season 9
        la1(t)=0.2*exp(-0.06*(t-446).^2);   
    elseif (488<=t)&&(t<=508)    %season 10
        la1(t)=0.2*exp(-0.06*(t-498).^2);    
    else
        la1(t) = 0; 
    end    
end
%Migration rates
t=1:nt+1;
mF1(t)=0.4;   
mA1=mF1;
for t=1:nt+1                     
    if (10<=t)&&(t<=30)              %season 1
        m1(t)=0.6*exp(-0.2*(t-20).^2);  
    elseif (62<=t)&&(t<=82)         %season 2
        m1(t)=0.6*exp(-0.2*(t-72).^2);     
    elseif (114<=t)&&(t<=134)       %season 3
        m1(t)=0.6*exp(-0.2*(t-124).^2);  
    elseif (166<=t)&&(t<=186)       %season 4
        m1(t)=0.6*exp(-0.2*(t-176).^2);     
    elseif (218<=t)&&(t<=238)       %season 5
        m1(t)=0.6*exp(-0.2*(t-228).^2);     
    elseif (270<=t)&&(t<=290)       %season 6
        m1(t)=0.6*exp(-0.2*(t-280).^2);    
    elseif (322<=t)&&(t<=342)       %season 7
        m1(t)=0.6*exp(-0.2*(t-332).^2);     
    elseif (374<=t)&&(t<=394)       %season 8
        m1(t)=0.6*exp(-0.2*(t-384).^2);      
    elseif (426<=t)&&(t<=446)       %season 9
        m1(t)=0.6*exp(-0.2*(t-436).^2);    
    elseif (478<=t)&&(t<=498)       %season 10
        m1(t)=0.6*exp(-0.2*(t-488).^2);      
    else  
        m1(t)=0;    
    end    
end    

%% Population 2 parameters

%connectivity Fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)               %rainy period  1
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (31<=t)&&(t<=52)           %dry period 1
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;  
    elseif (53<=t)&&(t<=83)          %rainy period 2
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (84<=t)&&(t<=104)          %dry period 2
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;   
    elseif (105<=t)&&(t<=134)          %rainy period 3
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (135<=t)&&(t<=156)        %dry period 3
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (157<=t)&&(t<=186)          %rainy period 4
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (187<=t)&&(t<=208)        %dry period 4
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (209<=t)&&(t<=238)          %rainy period 5
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (239<=t)&&(t<=260)        %dry period 5
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;    
    elseif (261<=t)&&(t<=290)          %rainy period 6
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (291<=t)&&(t<=312)        %dry period 6
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;   
    elseif (313<=t)&&(t<=342)          %rainy period 7
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (343<=t)&&(t<=364)        %dry period 7
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;    
    elseif (365<=t)&&(t<=394)          %rainy period 8
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (395<=t)&&(t<=416)        %dry period 8
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;    
    elseif (417<=t)&&(t<=446)          %rainy period 9
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02; 
    elseif (447<=t)&&(t<=468)        %dry period 9
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;    
    elseif (469<=t)&&(t<=498)          %rainy period 10
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;     
    else                       %dry period 10
        al12(t)=0.225; al32(t)=0.225; al42(t)=0.15; al52(t)=0.1; al62(t)=0.1;
        al72(t)=0.08; al82(t)=0.06; al92(t)=0.04; al102(t)=0.02;  
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)               %rainy period 1
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0; 
    elseif (31<=t)&&(t<=52)                              %dry period 1
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0; 
    elseif (53<=t)&&(t<=82)               %rainy period 2
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;  
    elseif (83<=t)&&(t<=104)                              %dry period 2
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0; 
    elseif (105<=t)&&(t<=134)               %rainy period 3
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (135<=t)&&(t<=156)                  %dry period 3
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (157<=t)&&(t<=186)               %rainy period 4
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (187<=t)&&(t<=208)                  %dry period 4
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (209<=t)&&(t<=238)               %rainy period 5
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (239<=t)&&(t<=260)                  %dry period 5
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;  
    elseif (261<=t)&&(t<=290)               %rainy period 6
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (290<=t)&&(t<=312)                  %dry period 6
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (313<=t)&&(t<=342)               %rainy period 7
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (343<=t)&&(t<=364)                  %dry period 7
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (365<=t)&&(t<=394)               %rainy period 8
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (395<=t)&&(t<=416)                  %dry period 8
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (417<=t)&&(t<=446)               %rainy period 9
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;
    elseif (447<=t)&&(t<=468)                  %dry period 9
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;    
    elseif (469<=t)&&(t<=498)               %rainy period 10
        be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
        be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0;    
    else                             %dry period 10
       be12(t)=0.2; be32(t)=0.2; be42(t)=0.2; be52(t)=0.2; be62(t)=0.2;
       be72(t)=0; be82(t)=0; be92(t)=0; be102(t)=0; 
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
         p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    elseif (218<=t)&&(t<231)                 %migrate period 5   
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;   
    elseif (270<=t)&&(t<283)                 %migrate period 6   
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;  
    elseif (322<=t)&&(t<335)                 %migrate period 7   
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 8
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;  
    elseif (426<=t)&&(t<439)                 %migrate period 9
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0.2; p222(t)=0.2; p232(t)=0.2; p242(t)=0.2; p252(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p142(t)=0.34; p152(t)=0.33; p162(t)=0.33;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    else                                
        p142(t)=0; p152(t)=0; p162(t)=0;
        p212(t)=0; p222(t)=0; p232(t)=0; p242(t)=0; p252(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r2= r1; 
rho2= r2;
% Reproduction rates free-living bacteria
la2= la1;         
% Migration rates                 
mF2=mF1;  
mA2=mF2;
m2=m1;

%% Population 3 parameters

%connectivity Fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)         %rainy period  1
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (31<=t)&&(t<=52)                        %dry period 1
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02; 
    elseif (53<=t)&&(t<=82)         %rainy period 2
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (83<=t)&&(t<=104)                %dry period 2
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02; 
    elseif (105<=t)&&(t<=134)         %rainy period 3
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (135<=t)&&(t<=156)                 %dry period 3
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (157<=t)&&(t<=186)         %rainy period 4
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (187<=t)&&(t<=208)                 %dry period 4
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;
    elseif (209<=t)&&(t<=238)         %rainy period 5
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (239<=t)&&(t<=260)                 %dry period 5
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;
    elseif (261<=t)&&(t<=290)         %rainy period 6
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (290<=t)&&(t<=312)                 %dry period 6
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02; 
    elseif (313<=t)&&(t<=342)         %rainy period 7
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (343<=t)&&(t<=364)                 %dry period 7
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;
    elseif (365<=t)&&(t<=394)         %rainy period 8
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (395<=t)&&(t<=416)                 %dry period 8
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;
    elseif (417<=t)&&(t<=446)         %rainy period 9
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;  
    elseif (447<=t)&&(t<=468)                 %dry period 9
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;    
    elseif (469<=t)&&(t<=498)         %rainy period 10
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.2; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02;    
    else                        %dry period 10
        al13(t)=0.15; al23(t)=0.2; al43(t)=0.20; al53(t)=0.15; al63(t)=0.1;
        al73(t)=0.08; al83(t)=0.06; al93(t)=0.04; al103(t)=0.02; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)         %rainy period 1
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (31<=t)&&(t<=52)                        %dry period 1
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (53<=t)&&(t<=82)         %rainy period 2
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;   
    elseif (83<=t)&&(t<=104)                        %dry period 2
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;   
    elseif (105<=t)&&(t<=134)         %rainy period 3
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (135<=t)&&(t<=156)              %dry period 3
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0; 
    elseif (157<=t)&&(t<=186)         %rainy period 4
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (187<=t)&&(t<=208)              %dry period 4
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;
    elseif (209<=t)&&(t<=238)         %rainy period 5
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (239<=t)&&(t<=260)              %dry period 5
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;
    elseif (261<=t)&&(t<=290)         %rainy period 6
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (290<=t)&&(t<=312)              %dry period 6
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;
    elseif (313<=t)&&(t<=342)         %rainy period 7
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (343<=t)&&(t<=364)              %dry period 7
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;
    elseif (365<=t)&&(t<=394)         %rainy period 8
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (395<=t)&&(t<=416)              %dry period 8
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;
    elseif (417<=t)&&(t<=446)         %rainy period 9
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    elseif (447<=t)&&(t<=468)              %dry period 9
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;    
    elseif (469<=t)&&(t<=498)         %rainy period 10
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;            
    else                        %dry period 10
        be13(t)=0.2; be23(t)=0.2; be43(t)=0.2; be53(t)=0.2; be63(t)=0.2;
        be73(t)=0; be83(t)=0; be93(t)=0; be103(t)=0;  
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
         p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 8    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10    
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0.2; p223(t)=0.2; p233(t)=0.2; p243(t)=0.2; p253(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p143(t)=0.34; p153(t)=0.33; p163(t)=0.33;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;    
    else                                
        p143(t)=0; p153(t)=0; p163(t)=0;
        p213(t)=0; p223(t)=0; p233(t)=0; p243(t)=0; p253(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r3= r1; 
rho3= r3;
% Reproduction rates free-living bacteria
la3 = la1;                
% Migration rate
mF3=mF1; 
mA3=mF3;
m3=m1;

%% Population 4 parameters

%connectivity fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)              %rainy period 1
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02; 
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (53<=t)&&(t<=82)              %rainy period 2
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02; 
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (105<=t)&&(t<=134)              %rainy period 3
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (135<=t)&&(t<=156)                   %dry period 3
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (157<=t)&&(t<=186)              %rainy period 4
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (187<=t)&&(t<=208)                   %dry period 4
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (209<=t)&&(t<=238)              %rainy period 5
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (239<=t)&&(t<=260)                   %dry period 5
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (261<=t)&&(t<=290)              %rainy period 6
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (290<=t)&&(t<=312)                   %dry period 6
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (343<=t)&&(t<=364)                   %dry period 7
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (365<=t)&&(t<=394)              %rainy period 8
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (395<=t)&&(t<=416)                   %dry period 8
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;
    elseif (417<=t)&&(t<=446)              %rainy period 9
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    elseif (447<=t)&&(t<=468)                   %dry period 9
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;     
    elseif (469<=t)&&(t<=498)              %rainy period 10
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;     
    else                             %dry period 10
         al14(t)=0.1; al24(t)=0.15; al34(t)=0.2; al54(t)=0.2; al64(t)=0.15;
         al74(t)=0.08; al84(t)=0.06; al94(t)=0.04; al104(t)=0.02;  
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)              %rainy period 1
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (31<=t)&&(t<=52)                             %dry period 1
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;
    elseif (53<=t)&&(t<=82)              %rainy period 2
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (83<=t)&&(t<=104)                             %dry period 2
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0; 
    elseif (105<=t)&&(t<=134)              %rainy period 3
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (135<=t)&&(t<=156)                    %dry period 3
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (157<=t)&&(t<=186)              %rainy period 4
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (187<=t)&&(t<=208)                    %dry period 4
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0; 
    elseif (209<=t)&&(t<=238)              %rainy period 5
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (239<=t)&&(t<=260)                    %dry period 5
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0; 
    elseif (261<=t)&&(t<=290)              %rainy period 6
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (290<=t)&&(t<=312)                    %dry period 6
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (343<=t)&&(t<=364)                    %dry period 7
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;
    elseif (365<=t)&&(t<=394)              %rainy period 8
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (395<=t)&&(t<=416)                    %dry period 8
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;
    elseif (417<=t)&&(t<=446)              %rainy period 9
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;  
    elseif (447<=t)&&(t<=468)                    %dry period 9
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;     
    elseif (469<=t)&&(t<=498)              %rainy period 10
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0;     
    else                             %dry period 10
         be14(t)=0.2; be24(t)=0.2; be34(t)=0.2; be54(t)=0.2; be64(t)=0.2;
         be74(t)=0; be84(t)=0; be94(t)=0; be104(t)=0; 
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
         p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0; 
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0; 
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;
    elseif (374<=t)&&(t<387)                 %migrate period 8    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0; 
    elseif (426<=t)&&(t<439)                 %migrate period 9    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;     
    elseif (478<=t)&&(t<491)                 %migrate period 10    
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0.2; p224(t)=0.2; p234(t)=0.2; p244(t)=0.2; p254(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p144(t)=0.34; p154(t)=0.33; p164(t)=0.33;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;    
    else                                
        p144(t)=0; p154(t)=0; p164(t)=0;
        p214(t)=0; p224(t)=0; p234(t)=0; p244(t)=0; p254(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r4= r1; 
rho4= r4;
% Reproduction rates free-living bacteria                  
la4 = la1;       
% Migration rates                    
mF4=mF1;  
mA4=mF4;
m4=m1;

%% Population 5 parameters

%connectivity Fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)             %rainy period 1
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (31<=t)&&(t<=52)                            %dry period 1
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (83<=t)&&(t<=104)                            %dry period 2
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (135<=t)&&(t<=156)                            %dry period 3
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (187<=t)&&(t<=208)                            %dry period 4
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;     
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (239<=t)&&(t<=260)                            %dry period 5
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;     
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (290<=t)&&(t<=312)                            %dry period 6
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (343<=t)&&(t<=364)                            %dry period 7
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;      
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (395<=t)&&(t<=416)                            %dry period 8
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    elseif (447<=t)&&(t<=468)                            %dry period 9
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02;      
    else                            %dry period 10
         al15(t)=0.1; al25(t)=0.1; al35(t)=0.15; al45(t)=0.225; al65(t)=0.225;
         al75(t)=0.08; al85(t)=0.06; al95(t)=0.04; al105(t)=0.02; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0; 
    elseif (31<=t)&&(t<=52)                            %dry period 1
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;  
    elseif (53<=t)&&(t<=82)             %rainy period 2
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0; 
    elseif (83<=t)&&(t<=104)                            %dry period 2
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (135<=t)&&(t<=156)                            %dry period 3
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (187<=t)&&(t<=208)                %dry period 4
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (239<=t)&&(t<=260)                %dry period 5
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (290<=t)&&(t<=312)                %dry period 6
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0; 
    elseif (313<=t)&&(t<=342)             %rainy period 7
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (343<=t)&&(t<=364)                %dry period 7
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (365<=t)&&(t<=394)             %rainy period 8
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (395<=t)&&(t<=416)                %dry period 8
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;     
    elseif (417<=t)&&(t<=446)             %rainy period 9
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    elseif (447<=t)&&(t<=468)                %dry period 9
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;     
    else                            %dry period 10
         be15(t)=0.2; be25(t)=0.2; be35(t)=0.2; al2930(t)=0.2; be65(t)=0.2;
         be75(t)=0; be85(t)=0; be95(t)=0; be105(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
         p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (374<=t)&&(t<387)                 %migrate period 8   
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9   
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10   
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0.2; p225(t)=0.2; p235(t)=0.2; p245(t)=0.2; p255(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p145(t)=0.34; p155(t)=0.33; p165(t)=0.33;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;    
    else                                
        p145(t)=0; p155(t)=0; p165(t)=0;
        p215(t)=0; p225(t)=0; p235(t)=0; p245(t)=0; p255(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r5= r1; 
rho5= r5;
% Reproduction rates free-living bacteria                   
la5 = la1;       
% Migration rates                     
mF5=mF1;  
mA5=mF5;
m5=m1;

%% Population 6 parameters

%connectivity Fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)          %rainy period 1
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (31<=t)&&(t<=52)                         %dry period 1
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02; 
    elseif (53<=t)&&(t<=82)          %rainy period 2
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (83<=t)&&(t<=104)                         %dry period 2
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02; 
    elseif (105<=t)&&(t<=134)          %rainy period 3
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (135<=t)&&(t<=156)              %dry period 3
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02; 
    elseif (157<=t)&&(t<=186)          %rainy period 4
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (187<=t)&&(t<=208)              %dry period 4
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;      
    elseif (209<=t)&&(t<=238)          %rainy period 5
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (239<=t)&&(t<=260)              %dry period 5
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (261<=t)&&(t<=290)          %rainy period 6
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (290<=t)&&(t<=312)              %dry period 6
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02; 
    elseif (313<=t)&&(t<=342)          %rainy period 7
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (343<=t)&&(t<=364)              %dry period 7
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (365<=t)&&(t<=394)          %rainy period 8
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (395<=t)&&(t<=416)              %dry period 8
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (417<=t)&&(t<=446)          %rainy period 9
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;
    elseif (447<=t)&&(t<=468)              %dry period 9
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;     
    elseif (469<=t)&&(t<=498)          %rainy period 10
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02;     
    else                         %dry period 10
         al16(t)=0.1; al26(t)=0.1; al36(t)=0.15; al46(t)=0.2; al56(t)=0.25;
         al76(t)=0.08; al86(t)=0.06; al96(t)=0.04; al106(t)=0.02; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)          %rainy period 1
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (31<=t)&&(t<=52)                         %dry period 1
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;  
    elseif (53<=t)&&(t<=82)          %rainy period 2
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (83<=t)&&(t<=104)                         %dry period 2
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (105<=t)&&(t<=134)          %rainy period 3
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (135<=t)&&(t<=156)            %dry period 3
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;  
    elseif (157<=t)&&(t<=186)          %rainy period 4
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (187<=t)&&(t<=208)            %dry period 4
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0; 
    elseif (209<=t)&&(t<=238)          %rainy period 5
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (239<=t)&&(t<=260)            %dry period 5
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0; 
    elseif (261<=t)&&(t<=290)          %rainy period 6
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (290<=t)&&(t<=312)            %dry period 6
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;      
    elseif (313<=t)&&(t<=342)          %rainy period 7
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (321<=t)&&(t<=350)            %dry period 7
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (365<=t)&&(t<=394)          %rainy period 8
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (395<=t)&&(t<=416)            %dry period 8
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (417<=t)&&(t<=446)          %rainy period 9
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    elseif (447<=t)&&(t<=468)            %dry period 9
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;     
    elseif (469<=t)&&(t<=498)          %rainy period 10
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;     
    else                         %dry period 10
         be16(t)=0.2; be26(t)=0.2; be36(t)=0.2; be46(t)=0.2; be56(t)=0.2;
         be76(t)=0; be86(t)=0; be96(t)=0; be106(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;    
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0; 
    elseif (270<=t)&&(t<283)                 %migrate period 6   
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7   
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 8   
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0; 
    elseif (426<=t)&&(t<439)                 %migrate period 9   
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;     
    elseif (478<=t)&&(t<491)                 %migrate period 10   
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0.2; p226(t)=0.2; p236(t)=0.2; p246(t)=0.2; p256(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;    
    else                                
        p146(t)=0; p156(t)=0; p166(t)=0;
        p216(t)=0; p226(t)=0; p236(t)=0; p246(t)=0; p256(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r6= r1; 
rho6= r6;
% Reproduction rates free-living bacteria                    
la6 = la1;       
% Migration rates                    
mF6=mF1;  
mA6=mF6;
m6=m1;

%% Population 7 parameters
 
%connectivity fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)              %rainy period 1
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (53<=t)&&(t<=82)              %rainy period 2
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (105<=t)&&(t<=134)              %rainy period 3
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (135<=t)&&(t<=156)                             %dry period 3
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (157<=t)&&(t<=186)              %rainy period 4
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (187<=t)&&(t<=208)                             %dry period 4
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;  
    elseif (209<=t)&&(t<=238)              %rainy period 5
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (239<=t)&&(t<=260)                             %dry period 5
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (261<=t)&&(t<=290)              %rainy period 6
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (290<=t)&&(t<=312)                             %dry period 6
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (343<=t)&&(t<=364)                             %dry period 7
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06; 
    elseif (365<=t)&&(t<=394)              %rainy period 8
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (395<=t)&&(t<=416)                             %dry period 8
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (417<=t)&&(t<=446)              %rainy period 9
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    elseif (447<=t)&&(t<=468)                             %dry period 9
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;     
    elseif (469<=t)&&(t<=498)              %rainy period 10
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;     
    else                             %dry period 10
         al17(t)=0.02; al27(t)=0.03; al37(t)=0.03; al47(t)=0.04; al57(t)=0.04; al67(t)=0.04;
         al87(t)=0.25; al97(t)=0.2; al107(t)=0.15; al117(t)=0.08; al127(t)=0.06; al137(t)=0.06;
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)              %rainy period 1
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (31<=t)&&(t<=52)            %dry period 1
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (53<=t)&&(t<=82)              %rainy period 2
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (83<=t)&&(t<=104)            %dry period 2
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (105<=t)&&(t<=134)              %rainy period 3
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (135<=t)&&(t<=156)            %dry period 3
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (157<=t)&&(t<=186)              %rainy period 4
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (187<=t)&&(t<=208)            %dry period 4
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (209<=t)&&(t<=238)              %rainy period 5
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (239<=t)&&(t<=260)            %dry period 5
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (261<=t)&&(t<=290)              %rainy period 6
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (290<=t)&&(t<=312)            %dry period 6
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (343<=t)&&(t<=364)            %dry period 7
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (365<=t)&&(t<=394)              %rainy period 8
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (395<=t)&&(t<=416)            %dry period 8
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (417<=t)&&(t<=446)              %rainy period 9
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    elseif (447<=t)&&(t<=468)            %dry period 9
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;     
    elseif (469<=t)&&(t<=498)              %rainy period 10
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;     
    else            %dry period 10
         be17(t)=0; be27(t)=0; be37(t)=0; be47(t)=0; be57(t)=0; be67(t)=0;
         be87(t)=0.34; be97(t)=0.33; be107(t)=0.33; be117(t)=0; be127(t)=0; be137(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p146(t)=0.34; p156(t)=0.33; p166(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 8 
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p147(t)=0.34; p157(t)=0.33; p167(t)=0.33;
        p217(t)=0; p227(t)=0; p237(t)=0; p247(t)=0; p257(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10
        p147(t)=0; p157(t)=0; p167(t)=0;
        p217(t)=0.2; p227(t)=0.2; p237(t)=0.2; p247(t)=0.2; p257(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
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
% Reproduction rates free-living bacteria                   
la7 = la1;       
% Migration rates                    
mF7=mF1;  
mA7=mF7;
m7=m1;

%% Population 8 parameters

%connectivity fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)             %rainy period 1
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06; 
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06; 
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;   
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (135<=t)&&(t<=156)             %dry period 3
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (187<=t)&&(t<=208)             %dry period 4
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (239<=t)&&(t<=260)             %dry period 5
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (290<=t)&&(t<=312)             %dry period 6
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (343<=t)&&(t<=364)             %dry period 7
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;     
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (395<=t)&&(t<=416)             %dry period 8
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;
    elseif (447<=t)&&(t<=468)             %dry period 9
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;     
    elseif (417<=t)&&(t<=446)             %rainy period 10
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;     
    else                             %dry period 10
         al18(t)=0.02; al28(t)=0.03; al38(t)=0.03; al48(t)=0.04; al58(t)=0.04; al68(t)=0.04;
         al78(t)=0.2; al98(t)=0.2; al108(t)=0.2; al118(t)=0.08; al128(t)=0.06; al138(t)=0.06;    
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (31<=t)&&(t<=52)           %dry period 1
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (83<=t)&&(t<=104)           %dry period 2
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (135<=t)&&(t<=156)           %dry period 3
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (157<=t)&&(t<=186)             %rainy period 4
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (187<=t)&&(t<=208)           %dry period 4
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (239<=t)&&(t<=260)           %dry period 5
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (290<=t)&&(t<=312)           %dry period 6
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (343<=t)&&(t<=364)           %dry period 7
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (365<=t)&&(t<=394)             %rainy period 8
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (395<=t)&&(t<=416)           %dry period 8
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    elseif (447<=t)&&(t<=468)           %dry period 9
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0;     
    else           %dry period 10
         be18(t)=0; be28(t)=0; be38(t)=0; be48(t)=0; be58(t)=0; be68(t)=0;
         be78(t)=0.34; be98(t)=0.33; be108(t)=0.33; be118(t)=0; be128(t)=0; be138(t)=0; 
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;    
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0; 
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;  
    elseif (374<=t)&&(t<387)                 %migrate period 8    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10    
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0.2; p228(t)=0.2; p238(t)=0.2; p248(t)=0.2; p258(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p148(t)=0.34; p158(t)=0.33; p168(t)=0.33;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;    
    else                                
        p148(t)=0; p158(t)=0; p168(t)=0;
        p218(t)=0; p228(t)=0; p238(t)=0; p248(t)=0; p258(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r8= r1; 
rho8= r8;
% Reproduction rates free-living bacteria                    
la8 = la1;       
% Migration rates                     
mF8=mF1;  
mA8=mF8;
m8=m1;

%% Population 9 parameters

%connectivity fish biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)                %rainy period 1
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06; 
    elseif (31<=t)&&(t<=52)            %dry period 1
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;  
    elseif (53<=t)&&(t<=82)      %rainy period 2
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06; 
    elseif (83<=t)&&(t<=104)        %dry period 2
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;  
    elseif (105<=t)&&(t<=134)      %rainy period 3
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (135<=t)&&(t<=156)        %dry period 3
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (157<=t)&&(t<=186)      %rainy period 4
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (187<=t)&&(t<=208)        %dry period 4
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (209<=t)&&(t<=238)      %rainy period 5
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (239<=t)&&(t<=260)        %dry period 5
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (261<=t)&&(t<=290)      %rainy period 6
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (290<=t)&&(t<=312)        %dry period 6
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (313<=t)&&(t<=342)      %rainy period 7
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (343<=t)&&(t<=364)        %dry period 7
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (365<=t)&&(t<=394)      %rainy period 8
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (395<=t)&&(t<=416)        %dry period 8
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06; 
    elseif (417<=t)&&(t<=446)      %rainy period 9
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;
    elseif (447<=t)&&(t<=468)        %dry period 9
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;     
    elseif (469<=t)&&(t<=498)      %rainy period 10
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;    
    else                    %dry period 10
        al19(t)=0.02; al29(t)=0.03; al39(t)=0.03; al49(t)=0.04; al59(t)=0.04; al69(t)=0.04;
        al79(t)=0.2; al89(t)=0.2; al109(t)=0.2; al119(t)=0.08; al129(t)=0.06; al139(t)=0.06;    
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)      %rainy period 1
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0; 
    elseif (31<=t)&&(t<=52)                     %dry period 1
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;   
    elseif (53<=t)&&(t<=82)      %rainy period 2
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (83<=t)&&(t<=104)                     %dry period 2
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;   
    elseif (105<=t)&&(t<=134)      %rainy period 3
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (135<=t)&&(t<=156)                     %dry period 3
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;
    elseif (157<=t)&&(t<=186)      %rainy period 4
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (187<=t)&&(t<=208)                     %dry period 4
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;
    elseif (209<=t)&&(t<=238)      %rainy period 5
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (239<=t)&&(t<=260)                     %dry period 5
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0; 
    elseif (261<=t)&&(t<=290)      %rainy period 6
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (290<=t)&&(t<=312)                     %dry period 6
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0; 
    elseif (313<=t)&&(t<=342)      %rainy period 7
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (343<=t)&&(t<=364)                     %dry period 7
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;
    elseif (365<=t)&&(t<=394)      %rainy period 8
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (395<=t)&&(t<=416)                     %dry period 8
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;
    elseif (417<=t)&&(t<=446)      %rainy period 9
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;  
    elseif (447<=t)&&(t<=468)                     %dry period 9
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;    
    elseif (469<=t)&&(t<=498)      %rainy period 10
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;    
    else                     %dry period 10
        be19(t)=0; be29(t)=0; be39(t)=0; be49(t)=0; be59(t)=0; be69(t)=0;
        be79(t)=0.33; be89(t)=0.33; be109(t)=0.34; be119(t)=0; be129(t)=0; be139(t)=0;   
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;    
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 8    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9    
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10 
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0.2; p229(t)=0.2; p239(t)=0.2; p249(t)=0.2; p259(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p149(t)=0.34; p159(t)=0.33; p169(t)=0.33;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;    
    else                                
        p149(t)=0; p159(t)=0; p169(t)=0;
        p219(t)=0; p229(t)=0; p239(t)=0; p249(t)=0; p259(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r9= r1; 
rho9= r9;
% Reproduction rates free-living bacteria                    
la9 = la1;       
% Migration rates                    
mF9=mF1;  
mA9=mF9;
m9=m1;

%% Population 10 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)       %rainy period 1
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06; 
    elseif (31<=t)&&(t<=52)               %dry period 1
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;  
    elseif (53<=t)&&(t<=82)       %rainy period 2
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06; 
    elseif (83<=t)&&(t<=104)              %dry period 2
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;  
    elseif (105<=t)&&(t<=134)       %rainy period 3
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (135<=t)&&(t<=156)              %dry period 3
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (157<=t)&&(t<=186)       %rainy period 4
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (187<=t)&&(t<=208)              %dry period 4
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (209<=t)&&(t<=238)       %rainy period 5
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (239<=t)&&(t<=260)              %dry period 5
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (261<=t)&&(t<=290)       %rainy period 6
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (290<=t)&&(t<=312)              %dry period 6
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (313<=t)&&(t<=342)       %rainy period 7
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (343<=t)&&(t<=364)              %dry period 7
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06; 
    elseif (365<=t)&&(t<=394)       %rainy period 8
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (395<=t)&&(t<=416)              %dry period 8
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (417<=t)&&(t<=446)       %rainy period 9
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;
    elseif (447<=t)&&(t<=468)              %dry period 9
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;     
    elseif (469<=t)&&(t<=498)       %rainy period 10
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;     
    else                      %dry period 10
         al110(t)=0.02; al210(t)=0.02; al310(t)=0.03; al410(t)=0.03; al510(t)=0.05; al610(t)=0.05;
         al710(t)=0.15; al810(t)=0.2; al910(t)=0.25; al1110(t)=0.08; al1210(t)=0.06; al1310(t)=0.06;    
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)       %rainy period 1
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0; 
    elseif (31<=t)&&(t<=52)                       %dry period 1
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;    
    elseif  (53<=t)&&(t<=82)       %rainy period 2
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;  
    elseif (83<=t)&&(t<=104)                       %dry period 2
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;    
    elseif  (105<=t)&&(t<=134)       %rainy period 3
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (135<=t)&&(t<=156)               %dry period 3
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif  (157<=t)&&(t<=186)       %rainy period 4
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (187<=t)&&(t<=208)               %dry period 4
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0; 
    elseif  (209<=t)&&(t<=238)       %rainy period 5
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (239<=t)&&(t<=260)               %dry period 5
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0; 
    elseif  (261<=t)&&(t<=290)       %rainy period 6
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (290<=t)&&(t<=312)               %dry period 6
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif  (313<=t)&&(t<=342)       %rainy period 7
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (343<=t)&&(t<=364)               %dry period 7
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif  (365<=t)&&(t<=394)       %rainy period 8
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (395<=t)&&(t<=416)               %dry period 8
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif  (417<=t)&&(t<=446)       %rainy period 9
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;
    elseif (447<=t)&&(t<=468)               %dry period 9
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;     
    elseif  (469<=t)&&(t<=498)       %rainy period 10
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;     
    else                       %dry period 10
         be110(t)=0; be210(t)=0; be310(t)=0; be410(t)=0; be510(t)=0; be610(t)=0;
         be710(t)=0.33; be810(t)=0.33; be910(t)=0.34; be1110(t)=0; be1210(t)=0; be1310(t)=0;    
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0; 
    elseif (218<=t)&&(t<231)                 %migrate period 5  
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6 
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;    
    elseif (374<=t)&&(t<387)                 %migrate period 8
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p1410(t)=0.34; p1510(t)=0.33; p1610(t)=0.33;
        p2110(t)=0; p2210(t)=0; p2310(t)=0; p2410(t)=0; p2510(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10
        p1410(t)=0; p1510(t)=0; p1610(t)=0;
        p2110(t)=0.2; p2210(t)=0.2; p2310(t)=0.2; p2410(t)=0.2; p2510(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
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
m10=m1;

%% Population 11 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;   
    elseif (31<=t)&&(t<=52)                            %dry period 1
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;   
    elseif (53<=t)&&(t<=82)            %rainy period 2
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;   
    elseif (83<=t)&&(t<=104)                            %dry period 2
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;    
    elseif (105<=t)&&(t<=134)            %rainy period 3
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (135<=t)&&(t<=156)                 %dry period 3
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (187<=t)&&(t<=208)                 %dry period 4
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    elseif (209<=t)&&(t<=238)            %rainy period 5
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (239<=t)&&(t<=260)                 %dry period 5
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;
    elseif (261<=t)&&(t<=290)            %rainy period 6
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (290<=t)&&(t<=312)                 %dry period 6
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    elseif (313<=t)&&(t<=342)            %rainy period 7
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (343<=t)&&(t<=364)                 %dry period 7
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    elseif (365<=t)&&(t<=394)            %rainy period 8
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (395<=t)&&(t<=416)                 %dry period 8
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    elseif (417<=t)&&(t<=446)            %rainy period 9
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1; 
    elseif (447<=t)&&(t<=468)                 %dry period 9
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    elseif (469<=t)&&(t<=498)            %rainy period 10
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;     
    else                            %dry period 10
         al711(t)=0.05; al811(t)=0.05; al911(t)=0.1; al1011(t)=0.1; 
         al1211(t)=0.2; al1311(t)=0.2; al1411(t)=0.1; al1511(t)=0.1; al1611(t)=0.1;    
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (31<=t)&&(t<=52)                            %dry period 1
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;       
    elseif (53<=t)&&(t<=82)            %rainy period 2
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;  
    elseif (83<=t)&&(t<=104)                            %dry period 2
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;       
    elseif (105<=t)&&(t<=134)            %rainy period 3
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (135<=t)&&(t<=156)                            %dry period 3
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (187<=t)&&(t<=208)                            %dry period 4
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;
    elseif (209<=t)&&(t<=238)            %rainy period 5
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (239<=t)&&(t<=260)                            %dry period 5
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;
    elseif (261<=t)&&(t<=290)            %rainy period 6
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (290<=t)&&(t<=312)                            %dry period 6
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;
    elseif (313<=t)&&(t<=342)            %rainy period 7
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (343<=t)&&(t<=364)                            %dry period 7
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;
    elseif (365<=t)&&(t<=394)            %rainy period 8
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (395<=t)&&(t<=416)                            %dry period 8
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0; 
    elseif (417<=t)&&(t<=446)            %rainy period 9
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;   
    elseif (447<=t)&&(t<=468)                            %dry period 9
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;      
    elseif (469<=t)&&(t<=498)            %rainy period 10
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;      
    else                           %dry period 10
         be711(t)=0; be811(t)=0; be911(t)=0; be1011(t)=0; 
         be1211(t)=0.5; be1311(t)=0.5; be1411(t)=0; be1511(t)=0; be1611(t)=0;    
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0; 
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0; 
    elseif (270<=t)&&(t<283)                 %migrate period 6    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;
    elseif (374<=t)&&(t<387)                 %migrate period 8    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;
    elseif (426<=t)&&(t<439)                 %migrate period 9    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;    
    elseif (478<=t)&&(t<491)                 %migrate period 10    
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0.2; p2211(t)=0.2; p2311(t)=0.2; p2411(t)=0.2; p2511(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p1411(t)=0.34; p1511(t)=0.33; p1611(t)=0.33;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;     
    else                                
        p1411(t)=0; p1511(t)=0; p1611(t)=0;
        p2111(t)=0; p2211(t)=0; p2311(t)=0; p2411(t)=0; p2511(t)=0;    
    end    
end
%Reproduction rates of carrier host
t=0:nt ;
r11= r1; 
rho11= r11;
% Reproduction rate of free-living bacteria
la11=la1;       
%Migration rates
mF11=mF1;
mA11=mF11;
m11=m1;

%% Population 12 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)           %rainy period 1
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;  
    elseif (31<=t)&&(t<=52)                           %dry period 1
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;  
    elseif (53<=t)&&(t<=82)           %rainy period 2
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;  
    elseif (83<=t)&&(t<=104)                           %dry period 2
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;  
    elseif (105<=t)&&(t<=134)           %rainy period 3
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (135<=t)&&(t<=156)                           %dry period 3
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;
    elseif (157<=t)&&(t<=186)           %rainy period 4
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (187<=t)&&(t<=208)                           %dry period 4
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;
    elseif (209<=t)&&(t<=238)           %rainy period 5
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (239<=t)&&(t<=260)                           %dry period 5
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;     
    elseif (261<=t)&&(t<=290)           %rainy period 6
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (290<=t)&&(t<=312)                           %dry period 6
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;     
    elseif (313<=t)&&(t<=342)           %rainy period 7
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (343<=t)&&(t<=364)                           %dry period 7
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;
    elseif (365<=t)&&(t<=394)           %rainy period 8
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (395<=t)&&(t<=416)                           %dry period 8
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (417<=t)&&(t<=446)           %rainy period 9
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08; 
    elseif (447<=t)&&(t<=468)                           %dry period 9
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;
    elseif (469<=t)&&(t<=498)           %rainy period 10
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;     
    else                           %dry period 10
         al712(t)=0.04; al812(t)=0.06; al912(t)=0.1; al1012(t)=0.1; 
         al1112(t)=0.2; al1312(t)=0.2; al1412(t)=0.12; al1512(t)=0.1; al1612(t)=0.08;  
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)           %rainy period 1
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;  
    elseif (31<=t)&&(t<=52)                           %dry period 1
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0; 
    elseif (53<=t)&&(t<=82)           %rainy period 2
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0; 
    elseif (83<=t)&&(t<=104)            %dry period 2
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0; 
    elseif (105<=t)&&(t<=134)           %rainy period 3
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (135<=t)&&(t<=156)                %dry period 3
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (157<=t)&&(t<=186)           %rainy period 4
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (187<=t)&&(t<=208)                %dry period 4
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;     
    elseif (209<=t)&&(t<=238)           %rainy period 5
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (239<=t)&&(t<=260)                %dry period 5
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (261<=t)&&(t<=290)           %rainy period 6
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (290<=t)&&(t<=312)                %dry period 6
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (313<=t)&&(t<=342)           %rainy period 7
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (343<=t)&&(t<=364)                %dry period 7
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0; 
    elseif (365<=t)&&(t<=394)           %rainy period 8
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (395<=t)&&(t<=416)                %dry period 8
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (417<=t)&&(t<=446)           %rainy period 9
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    elseif (447<=t)&&(t<=468)                %dry period 9
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;     
    elseif (469<=t)&&(t<=498)           %rainy period 10
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;     
    else                           %dry period 190
         be712(t)=0.; be812(t)=0; be912(t)=0; be1012(t)=0; 
         be1112(t)=0.5; be1312(t)=0.5; be1412(t)=0; be1512(t)=0; be1612(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0; 
    elseif (218<=t)&&(t<231)                 %migrate period 5    
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 6  
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 6
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 7
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 7
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;
    elseif (374<=t)&&(t<387)                 %migrate period 8
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 8
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0; 
    elseif (426<=t)&&(t<439)                 %migrate period 9
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (439<=t)&&(t<=446)                %end migrate period 9
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;     
    elseif (478<=t)&&(t<491)                 %migrate period 10
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0.2; p2212(t)=0.2; p2312(t)=0.2; p2412(t)=0.2; p2512(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p1412(t)=0.34; p1512(t)=0.33; p1612(t)=0.33;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;    
    else                                
        p1412(t)=0; p1512(t)=0; p1612(t)=0;
        p2112(t)=0; p2212(t)=0; p2312(t)=0; p2412(t)=0; p2512(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r12= r1; 
rho12= r12;
% Reproduction rate of free-living bacteria
la12=la1;
%Migration rates
mF12=mF1;
mA12=mF12;
m12=m1;

%% Population 13 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;  
    elseif (53<=t)&&(t<=82)            %rainy period 2
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;  
    elseif (105<=t)&&(t<=134)            %rainy period 3
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (135<=t)&&(t<=156)                             %dry period 3
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (187<=t)&&(t<=208)                             %dry period 4
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (209<=t)&&(t<=238)            %rainy period 5
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (239<=t)&&(t<=260)                             %dry period 5
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (261<=t)&&(t<=290)            %rainy period 6
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (290<=t)&&(t<=312)                             %dry period 6
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (313<=t)&&(t<=342)            %rainy period 7
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (343<=t)&&(t<=364)                             %dry period 7
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (365<=t)&&(t<=394)            %rainy period 8
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (395<=t)&&(t<=416)                             %dry period 8
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;
    elseif (417<=t)&&(t<=446)            %rainy period 9
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05; 
    elseif (447<=t)&&(t<=468)                             %dry period 9
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;     
    elseif (469<=t)&&(t<=498)            %rainy period 10
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;      
    else                             %dry period 10
         al713(t)=0.03; al813(t)=0.07; al913(t)=0.09; al1013(t)=0.11; 
         al1113(t)=0.17; al1213(t)=0.23;  al1413(t)=0.13; al1513(t)=0.12; al1613(t)=0.05;    
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0; 
    elseif (31<=t)&&(t<=52)                            %dry period 1
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (53<=t)&&(t<=82)            %rainy period 2
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (83<=t)&&(t<=104)                            %dry period 2
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0; 
    elseif (105<=t)&&(t<=134)            %rainy period 3
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (135<=t)&&(t<=156)            %dry period 3
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0; 
    elseif (157<=t)&&(t<=186)            %rainy period 4
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (187<=t)&&(t<=208)            %dry period 4
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;
    elseif (209<=t)&&(t<=238)            %rainy period 5
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (239<=t)&&(t<=260)            %dry period 5
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;
    elseif (261<=t)&&(t<=290)            %rainy period 6
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (290<=t)&&(t<=312)            %dry period 6
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0; 
    elseif (313<=t)&&(t<=342)            %rainy period 7
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (343<=t)&&(t<=364)            %dry period 7
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;      
    elseif (365<=t)&&(t<=394)            %rainy period 8
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (395<=t)&&(t<=416)            %dry period 8
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;     
    elseif (417<=t)&&(t<=446)            %rainy period 9
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;  
    elseif (447<=t)&&(t<=468)            %dry period 9
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;    
    elseif (469<=t)&&(t<=498)            %rainy period 10
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0;     
    else                            %dry period 10
         be713(t)=0; be813(t)=0; be913(t)=0; be1013(t)=0; 
         be1113(t)=0.5; be1213(t)=0.5;  be1413(t)=0; be1513(t)=0; be1613(t)=0; 
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t)&&(t<23)             %migrate period 1
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (23<=t)&&(t<=30)                 %end migrate period 1
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0; 
    elseif (62<=t)&&(t<75)                %migrate period 2
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (75<=t)&&(t<=82)          %end migrate period 2
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (114<=t)&&(t<127)                 %migrate period 3    
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (127<=t)&&(t<=134)               %end migrate period 3
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (166<=t)&&(t<179)                 %migrate period 4    
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (179<=t)&&(t<=186)                %end migrate period 4
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 5   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 5
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 6   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 6
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (218<=t)&&(t<231)                 %migrate period 6   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (231<=t)&&(t<=238)                 %end migrate period 6
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (270<=t)&&(t<283)                 %migrate period 7   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (283<=t)&&(t<=290)                %end migrate period 7
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;
    elseif (322<=t)&&(t<335)                 %migrate period 8   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (335<=t)&&(t<=342)               %end migrate period 8
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0; 
    elseif (374<=t)&&(t<387)                 %migrate period 9   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (387<=t)&&(t<=394)                %end migrate period 9
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;     
    elseif (478<=t)&&(t<491)                 %migrate period 10   
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0.2; p2213(t)=0.2; p2313(t)=0.2; p2413(t)=0.2; p2513(t)=0.2;
    elseif (491<=t)&&(t<=498)                %end migrate period 10
        p1413(t)=0.34; p1513(t)=0.33; p1613(t)=0.33;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;    
    else                                
        p1413(t)=0; p1513(t)=0; p1613(t)=0;
        p2113(t)=0; p2213(t)=0; p2313(t)=0; p2413(t)=0; p2513(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r13=r1; 
rho13= r13;
% Reproduction rate of free-living bacteria
la13=la1;
%Migration rates
mF13=mF1;
mA13=mF13;
m13=m1;

%% Population 14 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)          %rainy period 1
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (31<=t)&&(t<=52)                         %dry period 1
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    elseif (53<=t)&&(t<=82)          %rainy period 2
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (83<=t)&&(t<=104)                         %dry period 2
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    elseif (105<=t)&&(t<=134)          %rainy period 3
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (135<=t)&&(t<=156)                         %dry period 3
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;
    elseif (150<=t)&&(t<=180)          %rainy period 4
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (187<=t)&&(t<=208)                         %dry period 4
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    elseif (209<=t)&&(t<=238)          %rainy period 5
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (239<=t)&&(t<=260)                         %dry period 5
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    elseif (261<=t)&&(t<=290)          %rainy period 6
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (290<=t)&&(t<=312)                         %dry period 6
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    elseif (313<=t)&&(t<=342)          %rainy period 7
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (343<=t)&&(t<=364)                         %dry period 7
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;    
    elseif (365<=t)&&(t<=394)          %rainy period 8
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (395<=t)&&(t<=416)                         %dry period 8
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;
    elseif (417<=t)&&(t<=446)          %rainy period 9
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;   
    elseif (447<=t)&&(t<=468)                         %dry period 9
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;     
    elseif (469<=t)&&(t<=498)          %rainy period 10
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05;     
    else                         %dry period 10
         al1114(t)=0.1; al1214(t)=0.1; al1314(t)=0.1;  al1514(t)=0.22; al1614(t)=0.18;
         al1714(t)=0.1; al1814(t)=0.08;  al1914(t)=0.07; al2014(t)=0.05; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)          %rainy period 1
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;   
    elseif (31<=t)&&(t<=52)                 %dry period 1
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;    
    elseif (53<=t)&&(t<=82)          %rainy period 2
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (83<=t)&&(t<=104)                 %dry period 2
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;    
    elseif (105<=t)&&(t<=134)          %rainy period 3
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (135<=t)&&(t<=156)                 %dry period 3
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;
    elseif (157<=t)&&(t<=186)          %rainy period 4
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (187<=t)&&(t<=208)                 %dry period 4
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;
    elseif (209<=t)&&(t<=238)          %rainy period 5
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (239<=t)&&(t<=260)                 %dry period 5
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0; 
    elseif (261<=t)&&(t<=290)          %rainy period 6
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (290<=t)&&(t<=312)                 %dry period 6
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;
    elseif (313<=t)&&(t<=342)          %rainy period 7
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (343<=t)&&(t<=364)                 %dry period 7
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0; 
    elseif (365<=t)&&(t<=394)          %rainy period 8
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (395<=t)&&(t<=416)                 %dry period 8
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;
    elseif (417<=t)&&(t<=446)          %rainy period 9
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (447<=t)&&(t<=468)                 %dry period 9
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    elseif (469<=t)&&(t<=498)          %rainy period 10
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;     
    else                 %dry period 10
         be1114(t)=0; be1214(t)=0; be1314(t)=0;  be1514(t)=0.5; be1614(t)=0.5;
         be1714(t)=0; be1814(t)=0;  be1914(t)=0; be2014(t)=0;    
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2; 
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;
    elseif (374<=t)&&(t<=394)                 %migrate period 8    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2; 
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2; 
    elseif (478<=t)&&(t<=498)                %migrate period 10   
        p2114(t)=0.2; p2214(t)=0.2; p2314(t)=0.2; p2414(t)=0.2; p2514(t)=0.2;     
    else                                
        p2114(t)=0; p2214(t)=0; p2314(t)=0; p2414(t)=0; p2514(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r14= r1; 
rho14= r14;
% Reproduction rate of free-living bacteria
la14=la1;
%Migration rates
mF14=mF1;
mA14=mF14;
m14=m1;

%% Population 15 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (31<=t)&&(t<=52)                           %dry period 1
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (53<=t)&&(t<=82)            %rainy period 2
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (83<=t)&&(t<=104)                           %dry period 2
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03; 
    elseif (105<=t)&&(t<=134)            %rainy period 3
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (135<=t)&&(t<=156)                           %dry period 3
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (187<=t)&&(t<=208)                           %dry period 4
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (209<=t)&&(t<=238)            %rainy period 5
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (239<=t)&&(t<=260)                           %dry period 5
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03; 
    elseif (261<=t)&&(t<=290)            %rainy period 6
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (290<=t)&&(t<=312)                           %dry period 6
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (313<=t)&&(t<=342)            %rainy period 7
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (343<=t)&&(t<=364)                           %dry period 7
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (365<=t)&&(t<=394)            %rainy period 8
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (395<=t)&&(t<=416)                           %dry period 8
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;     
    elseif (417<=t)&&(t<=446)            %rainy period 9
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    elseif (447<=t)&&(t<=468)                           %dry period 9
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;      
    elseif (469<=t)&&(t<=498)            %rainy period 10
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;     
    else                          %dry period 10
         al1115(t)=0.07; al1215(t)=0.11; al1315(t)=0.12;  al1415(t)=0.2; al1615(t)=0.2;
         al1715(t)=0.12; al1815(t)=0.09;  al1915(t)=0.06; al2015(t)=0.03;
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (31<=t)&&(t<=52)                           %dry period 1
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (53<=t)&&(t<=82)            %rainy period 2
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (83<=t)&&(t<=104)                           %dry period 2
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (105<=t)&&(t<=134)            %rainy period 3
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (135<=t)&&(t<=156)                 %dry period 3
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;     
    elseif (157<=t)&&(t<=186)            %rainy period 4
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (187<=t)&&(t<=208)                 %dry period 4
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (209<=t)&&(t<=238)            %rainy period 5
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (239<=t)&&(t<=260)                 %dry period 5
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (261<=t)&&(t<=290)            %rainy period 6
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (290<=t)&&(t<=312)                 %dry period 6
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;    
    elseif (313<=t)&&(t<=342)            %rainy period 7
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (343<=t)&&(t<=364)                 %dry period 7
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (365<=t)&&(t<=394)            %rainy period 8
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (395<=t)&&(t<=416)                 %dry period 8
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0; 
    elseif (365<=t)&&(t<=394)            %rainy period 9
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    elseif (395<=t)&&(t<=416)                 %dry period 9
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;      
    elseif (417<=t)&&(t<=446)            %rainy period 10
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;     
    else                         %dry period 10
          be1115(t)=0; be1215(t)=0; be1315(t)=0;  be1415(t)=0.5; be1615(t)=0.5;
         be1715(t)=0; be1815(t)=0;  be1915(t)=0; be2015(t)=0;
    end    
end

for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 4    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 5    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;    
    elseif (218<=t)&&(t<=238)                 %migrate period 6    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2; 
    elseif (270<=t)&&(t<=290)                 %migrate period 7    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (322<=t)&&(t<=342)                 %migrate period 8    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;    
     elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2115(t)=0.2; p2215(t)=0.2; p2315(t)=0.2; p2415(t)=0.2; p2515(t)=0.2;    
    else                                
        p2115(t)=0; p2215(t)=0; p2315(t)=0; p2415(t)=0; p2515(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r15= r1; 
rho15= r15;
% Reproduction rate of free-living bacteria
la15=la1;
%Migration rates
mF15=mF1;
mA15=mF15;
m15=m1;

%% Population 16 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (31<=t)&&(t<=52)                           %dry period 1
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (53<=t)&&(t<=82)            %rainy period 2
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (83<=t)&&(t<=104)                           %dry period 2
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;  
    elseif (105<=t)&&(t<=134)            %rainy period 3
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (135<=t)&&(t<=156)                           %dry period 3
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;  
    elseif (157<=t)&&(t<=186)            %rainy period 4
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (187<=t)&&(t<=208)                           %dry period 4
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;   
    elseif (209<=t)&&(t<=238)            %rainy period 5
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (239<=t)&&(t<=260)                           %dry period 5
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (261<=t)&&(t<=290)            %rainy period 6
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (290<=t)&&(t<=312)                           %dry period 6
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;     
    elseif (313<=t)&&(t<=342)            %rainy period 7
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (343<=t)&&(t<=364)                           %dry period 7
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;
    elseif (365<=t)&&(t<=394)            %rainy period 8
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (395<=t)&&(t<=416)                           %dry period 8
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (417<=t)&&(t<=446)            %rainy period 9
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05; 
    elseif (447<=t)&&(t<=468)                           %dry period 9
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;      
    elseif (469<=t)&&(t<=498)            %rainy period 10
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;     
    else                           %dry period 10
         al1116(t)=0.06; al1216(t)=0.08; al1316(t)=0.16;  al1416(t)=0.16; al1516(t)=0.24;
         al1716(t)=0.11; al1816(t)=0.09;  al1916(t)=0.05; al2016(t)=0.05;     
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)            %rainy period 1
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;   
    elseif (31<=t)&&(t<=52)                           %dry period 1
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (53<=t)&&(t<=82)            %rainy period 2
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;  
    elseif (83<=t)&&(t<=104)                           %dry period 2
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (105<=t)&&(t<=134)            %rainy period 3
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (135<=t)&&(t<=156)                %dry period 3
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (187<=t)&&(t<=208)                %dry period 4
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (157<=t)&&(t<=186)            %rainy period 4
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (187<=t)&&(t<=208)                %dry period 4
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (209<=t)&&(t<=238)            %rainy period 5
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (239<=t)&&(t<=260)                %dry period 5
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (261<=t)&&(t<=290)            %rainy period 6
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (290<=t)&&(t<=312)                %dry period 6
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (313<=t)&&(t<=342)            %rainy period 7
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (343<=t)&&(t<=364)                %dry period 7
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (365<=t)&&(t<=394)            %rainy period 8
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (395<=t)&&(t<=416)                %dry period 8
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    elseif (417<=t)&&(t<=446)            %rainy period 9
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0; 
    elseif (447<=t)&&(t<=468)                %dry period 9
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;     
    elseif (469<=t)&&(t<=498)            %rainy period 10
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;     
    else                          %dry period 10
         be1116(t)=0; be1216(t)=0; be1316(t)=0;  be1416(t)=0.5; be1516(t)=0.5;
         be1716(t)=0; be1816(t)=0;  be1916(t)=0; be2016(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;    
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2; 
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;     
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;
    elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2116(t)=0.2; p2216(t)=0.2; p2316(t)=0.2; p2416(t)=0.2; p2516(t)=0.2;    
    else                                
        p2116(t)=0; p2216(t)=0; p2316(t)=0; p2416(t)=0; p2516(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r16= r1; 
rho16= r16;
% Reproduction rate of free-living bacteria
la16=la1;
%Migration rates
mF16=mF1;
mA16=mF16;
m16=m1;

%% Population 17 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (31<=t)&&(t<=52)                            %dry period 1
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (83<=t)&&(t<=104)                            %dry period 2
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;    
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (135<=t)&&(t<=156)                            %dry period 3
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (187<=t)&&(t<=208)                            %dry period 4
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (239<=t)&&(t<=260)                            %dry period 5
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04; 
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (290<=t)&&(t<=312)                            %dry period 6
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (343<=t)&&(t<=364)                            %dry period 7
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;     
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (395<=t)&&(t<=416)                            %dry period 8
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;
    elseif (447<=t)&&(t<=468)                            %dry period 9
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04;     
    else                            %dry period 10
         al1417(t)=0.05; al1517(t)=0.1; al1617(t)=0.1; al1817(t)=0.2; al1917(t)=0.15; al2017(t)=0.1;
         al2117(t)=0.08; al2217(t)=0.06;  al2317(t)=0.07; al2417(t)=0.05; al2517(t)=0.04; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (31<=t)&&(t<=52)                            %dry period 1
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (53<=t)&&(t<=82)             %rainy period 2
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (83<=t)&&(t<=104)          %dry period 2
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (105<=t)&&(t<=134)             %rainy period 3
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (135<=t)&&(t<=156)                  %dry period 3
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0; 
    elseif (157<=t)&&(t<=186)             %rainy period 4
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (187<=t)&&(t<=208)                  %dry period 4
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (209<=t)&&(t<=238)             %rainy period 5
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (239<=t)&&(t<=260)                  %dry period 5
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (261<=t)&&(t<=290)             %rainy period 6
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (290<=t)&&(t<=312)                  %dry period 6
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (313<=t)&&(t<=342)             %rainy period 7
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (343<=t)&&(t<=364)                  %dry period 7
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0; 
    elseif (365<=t)&&(t<=394)             %rainy period 8
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (395<=t)&&(t<=416)                  %dry period 8
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (417<=t)&&(t<=446)             %rainy period 9
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    elseif (447<=t)&&(t<=468)                  %dry period 9
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
          be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;     
    else                            %dry period 3
         be1417(t)=0; be1517(t)=0; be1617(t)=0; be1817(t)=0.34; be1917(t)=0.33; be2017(t)=0.33;
         be2117(t)=0; be2217(t)=0;  be2317(t)=0; be2417(t)=0; be2517(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;    
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;    
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;    
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;    
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;
    elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2117(t)=0.2; p2217(t)=0.2; p2317(t)=0.2; p2417(t)=0.2; p2517(t)=0.2;    
    else                                
        p2117(t)=0; p2217(t)=0; p2317(t)=0; p2417(t)=0; p2517(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r17= r1; 
rho17= r17;
% Reproduction rate of free-living bacteria
la17=la1;
%Migration rates
mF17=mF1;
mA17=mF17;
m17=m1;

%% Population 18 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (135<=t)&&(t<=156)                             %dry period 3
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (187<=t)&&(t<=208)                             %dry period 4
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (239<=t)&&(t<=260)                             %dry period 5
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (290<=t)&&(t<=312)                             %dry period 6
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (343<=t)&&(t<=364)                             %dry period 7
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (395<=t)&&(t<=416)                             %dry period 8
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    elseif (447<=t)&&(t<=468)                             %dry period 9
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04;    
    else                             %dry period 10
         al1418(t)=0.05; al1518(t)=0.08; al1618(t)=0.1; al1718(t)=0.1; al1918(t)=0.2; al2018(t)=0.1;
         al2118(t)=0.09; al2218(t)=0.09;  al2318(t)=0.08; al2418(t)=0.07; al2518(t)=0.04; 
    end      
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0; 
    elseif (31<=t)&&(t<=52)              %dry period 1
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (83<=t)&&(t<=104)              %dry period 2
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (135<=t)&&(t<=156)              %dry period 3
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (187<=t)&&(t<=208)              %dry period 4
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (239<=t)&&(t<=260)              %dry period 5
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0; 
    elseif (261<=t)&&(t<=290)             %rainy period 6
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (290<=t)&&(t<=312)              %dry period 6
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (343<=t)&&(t<=364)              %dry period 7
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;
    elseif (365<=t)&&(t<=394)             %rainy period 8
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (395<=t)&&(t<=416)              %dry period 8
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;  
    elseif (447<=t)&&(t<=468)              %dry period 9
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0;     
    else              %dry period 10
         be1418(t)=0; be1518(t)=0; be1618(t)=0; be1718(t)=0.34; be1918(t)=0.33; be2018(t)=0.33;
         be2118(t)=0; be2218(t)=0;  be2318(t)=0; be2418(t)=0; be2518(t)=0; 
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2; 
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;    
    elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2118(t)=0.2; p2218(t)=0.2; p2318(t)=0.2; p2418(t)=0.2; p2518(t)=0.2;    
    else                                
        p2118(t)=0; p2218(t)=0; p2318(t)=0; p2418(t)=0; p2518(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r18= r1; 
rho18= r18;
% Reproduction rate of free-living bacteria
la18=la1;
%Migration rates
mF18=mF1;
mA18=mF18;
m18=m1;

%% Population 19 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)       %rainy period 1
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (31<=t)&&(t<=52)        %dry period 1
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (53<=t)&&(t<=82)       %rainy period 2
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (83<=t)&&(t<=104)        %dry period 2
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (105<=t)&&(t<=134)       %rainy period 3
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (135<=t)&&(t<=156)        %dry period 3
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;
    elseif (157<=t)&&(t<=186)       %rainy period 4
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (187<=t)&&(t<=208)        %dry period 4
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;
    elseif (209<=t)&&(t<=238)       %rainy period 5
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (239<=t)&&(t<=260)        %dry period 5
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;
    elseif (261<=t)&&(t<=290)       %rainy period 6
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (290<=t)&&(t<=312)        %dry period 6
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;  
    elseif (313<=t)&&(t<=342)       %rainy period 7
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (343<=t)&&(t<=364)        %dry period 7
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;
    elseif (365<=t)&&(t<=394)       %rainy period 8
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (395<=t)&&(t<=416)        %dry period 8
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;     
    elseif (417<=t)&&(t<=446)       %rainy period 9
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    elseif (447<=t)&&(t<=468)        %dry period 9
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;     
    elseif (469<=t)&&(t<=498)       %rainy period 10
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06;     
    else        %dry period 10
         al1419(t)=0.05; al1519(t)=0.05; al1619(t)=0.1; al1719(t)=0.08; al1819(t)=0.2; al2019(t)=0.12;
         al2119(t)=0.1; al2219(t)=0.1;  al2319(t)=0.08; al2419(t)=0.06; al2519(t)=0.06; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)      %rainy period 1
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (31<=t)&&(t<=52)         %dry period 1
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;  
    elseif (53<=t)&&(t<=82)      %rainy period 2
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (83<=t)&&(t<=104)         %dry period 2
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;  
    elseif (105<=t)&&(t<=134)      %rainy period 3
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (135<=t)&&(t<=156)         %dry period 3
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;     
    elseif (157<=t)&&(t<=186)      %rainy period 4
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (187<=t)&&(t<=208)         %dry period 4
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;
    elseif (209<=t)&&(t<=238)      %rainy period 5
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (239<=t)&&(t<=260)         %dry period 5
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;     
    elseif (261<=t)&&(t<=290)      %rainy period 6
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (290<=t)&&(t<=312)         %dry period 6
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;
    elseif (313<=t)&&(t<=342)      %rainy period 7
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (343<=t)&&(t<=364)         %dry period 7
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (365<=t)&&(t<=394)      %rainy period 8
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (395<=t)&&(t<=416)         %dry period 8
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;      
    elseif (417<=t)&&(t<=446)      %rainy period 9
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0; 
    elseif (447<=t)&&(t<=468)         %dry period 9
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;     
    elseif (469<=t)&&(t<=498)      %rainy period 10
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;      
    else        %dry period 10
         be1419(t)=0; be1519(t)=0; be1619(t)=0; be1719(t)=0.33; be1819(t)=0.33; be2019(t)=0.34;
         be2119(t)=0; be2219(t)=0;  be2319(t)=0; be2419(t)=0; be2519(t)=0;  
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;    
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2; 
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;    
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;
    elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2119(t)=0.2; p2219(t)=0.2; p2319(t)=0.2; p2419(t)=0.2; p2519(t)=0.2;    
    else                                
        p2119(t)=0; p2219(t)=0; p2319(t)=0; p2419(t)=0; p2519(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r19= r1; 
rho19= r19;
% Reproduction rate of free-living bacteria
la19=la1;
%Migration rates
mF19=mF1;
mA19=mF19;
m19=m1;

%% Population 20 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)                %rainy period 1
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (31<=t)&&(t<=52)            %dry period 1
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (53<=t)&&(t<=82)            %rainy period 2
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (83<=t)&&(t<=104)           %dry period 2
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (105<=t)&&(t<=134)            %rainy period 3
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (135<=t)&&(t<=156)           %dry period 3
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;    
    elseif (157<=t)&&(t<=186)            %rainy period 4
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (187<=t)&&(t<=208)           %dry period 4
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (209<=t)&&(t<=238)            %rainy period 5
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (239<=t)&&(t<=260)           %dry period 5
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;       
    elseif (261<=t)&&(t<=290)            %rainy period 6
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (290<=t)&&(t<=312)           %dry period 6
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (313<=t)&&(t<=342)            %rainy period 7
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (343<=t)&&(t<=364)           %dry period 7
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (365<=t)&&(t<=394)            %rainy period 8
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (395<=t)&&(t<=416)           %dry period 8
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05; 
    elseif (417<=t)&&(t<=446)            %rainy period 9
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    elseif (447<=t)&&(t<=468)           %dry period 9
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;      
    elseif (469<=t)&&(t<=498)            %rainy period 10
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;      
    else                            %dry period 10
         al1420(t)=0.05; al1520(t)=0.05; al1620(t)=0.1; al1720(t)=0.1; al1820(t)=0.1; al1920(t)=0.2;
         al2120(t)=0.1; al2220(t)=0.1;  al2320(t)=0.1; al2420(t)=0.05; al2520(t)=0.05;  
    end       
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)    %rainy period 1
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (31<=t)&&(t<=52)        %dry period 1
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (53<=t)&&(t<=82)    %rainy period 2
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (83<=t)&&(t<=104)        %dry period 2
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (105<=t)&&(t<=134)    %rainy period 3
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (135<=t)&&(t<=156)        %dry period 3
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (157<=t)&&(t<=186)    %rainy period 4
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (187<=t)&&(t<=208)        %dry period 4
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;  
    elseif (209<=t)&&(t<=238)    %rainy period 5
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (239<=t)&&(t<=260)        %dry period 5
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (261<=t)&&(t<=290)    %rainy period 6
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (290<=t)&&(t<=312)        %dry period 6
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (313<=t)&&(t<=342)    %rainy period 7
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (343<=t)&&(t<=364)        %dry period 7
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    elseif (365<=t)&&(t<=394)    %rainy period 8
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (395<=t)&&(t<=416)        %dry period 8
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;     
    elseif (417<=t)&&(t<=446)    %rainy period 9
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0; 
    elseif (447<=t)&&(t<=468)        %dry period 9
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;     
    elseif (469<=t)&&(t<=498)    %rainy period 10
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;     
    else                           %dry period 10
         be1420(t)=0; be1520(t)=0; be1620(t)=0; be1720(t)=0.33; be1820(t)=0.33; be1920(t)=0.34;
         be2120(t)=0; be2220(t)=0;  be2320(t)=0; be2420(t)=0; be2520(t)=0;
    end    
end
%connectivity free-living bacteria
for t=1:nt+1                    
    if (10<=t )&&(t<=30)              %migrate period 1
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (62<=t)&&(t<=82)                %migrate period 2
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (114<=t)&&(t<=134)                 %migrate period 3    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (166<=t)&&(t<=186)                 %migrate period 4    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2; 
    elseif (218<=t)&&(t<=238)                 %migrate period 5    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (270<=t)&&(t<=290)                 %migrate period 6    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;    
    elseif (322<=t)&&(t<=342)                 %migrate period 7    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (371<=t)&&(t<=381)                 %migrate period 8    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (426<=t)&&(t<=446)                 %migrate period 9    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;
    elseif (478<=t)&&(t<=498)                %migrate period 10    
        p2120(t)=0.2; p2220(t)=0.2; p2320(t)=0.2; p2420(t)=0.2; p2520(t)=0.2;    
    else                                
        p2120(t)=0; p2220(t)=0; p2320(t)=0; p2420(t)=0; p2520(t)=0;    
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r20= r1; 
rho20= r20;
% Reproduction rate of free-living bacteria
la20=la1;
%Migration rates
mF20=mF1;
mA20=mF20;
m20=m1;
        
%% Population 21 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)           %rainy period 1
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (31<=t)&&(t<=52)                      %dry period 1
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (53<=t)&&(t<=82)           %rainy period 2
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (83<=t)&&(t<=104)                          %dry period 2
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (105<=t)&&(t<=134)           %rainy period 3
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (135<=t)&&(t<=156)                %dry period 3
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (157<=t)&&(t<=186)           %rainy period 4
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (187<=t)&&(t<=208)                %dry period 4
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;  
    elseif (209<=t)&&(t<=238)           %rainy period 5
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (239<=t)&&(t<=260)                %dry period 5
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (261<=t)&&(t<=290)           %rainy period 6
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (290<=t)&&(t<=312)                %dry period 6
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (313<=t)&&(t<=342)           %rainy period 7
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (343<=t)&&(t<=364)                %dry period 7
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    elseif (365<=t)&&(t<=394)           %rainy period 8
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (395<=t)&&(t<=416)                %dry period 8
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;     
    elseif (417<=t)&&(t<=446)           %rainy period 9
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1; 
    elseif (447<=t)&&(t<=468)                %dry period 9
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;     
    elseif (469<=t)&&(t<=498)           %rainy period 10
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;     
    else                         %dry period 10
         al1721(t)=0.05; al1821(t)=0.1; al1921(t)=0.1; al2021(t)=0.15; 
         al2221(t)=0.2; al2321(t)=0.15; al2421(t)=0.15; al2521(t)=0.1;
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)           %rainy period 1
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif  (31<=t)&&(t<=52)                         %dry period 1
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    elseif (53<=t)&&(t<=82)           %rainy period 2
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (83<=t)&&(t<=104)                         %dry period 2
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    elseif (105<=t)&&(t<=134)           %rainy period 3
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (135<=t)&&(t<=156)              %dry period 3
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    elseif (157<=t)&&(t<=186)           %rainy period 4
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (187<=t)&&(t<=208)              %dry period 4
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;     
    elseif (209<=t)&&(t<=238)           %rainy period 5
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (239<=t)&&(t<=260)              %dry period 5
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    elseif (261<=t)&&(t<=290)           %rainy period 6
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (290<=t)&&(t<=312)              %dry period 6
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    elseif (313<=t)&&(t<=342)           %rainy period 7
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (343<=t)&&(t<=364)              %dry period 7
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (365<=t)&&(t<=394)           %rainy period 8
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (395<=t)&&(t<=416)              %dry period 8
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;      
    elseif (417<=t)&&(t<=446)           %rainy period 9
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25; 
    elseif (447<=t)&&(t<=468)              %dry period 9
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;  
    elseif (469<=t)&&(t<=498)           %rainy period 10
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;      
    else                         %dry period 10
         be1721(t)=0; be1821(t)=0; be1921(t)=0; be2021(t)=0; 
         be2221(t)=0.25; be2321(t)=0.25; be2421(t)=0.25; be2521(t)=0.25;
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r21= r1;
rho21= r21;
% Reproduction rate of free-living bacteria
la21=la1;
%Migration rates
mF21=mF1;
mA21=mF21;
m21=m1;

%% Population 22 parameters

%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)        %rainy period 1
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1; 
    elseif (31<=t)&&(t<=52)                       %dry period 1
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (53<=t)&&(t<=82)        %rainy period 2
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;  
    elseif (83<=t)&&(t<=104)                       %dry period 2
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (105<=t)&&(t<=134)        %rainy period 3
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (135<=t)&&(t<=156)                       %dry period 3
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1; 
    elseif (157<=t)&&(t<=186)        %rainy period 4
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (187<=t)&&(t<=208)                       %dry period 4
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (209<=t)&&(t<=238)        %rainy period 5
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (239<=t)&&(t<=260)                       %dry period 5
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;     
    elseif (261<=t)&&(t<=290)        %rainy period 6
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (290<=t)&&(t<=312)                       %dry period 6
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (313<=t)&&(t<=342)        %rainy period 7
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (343<=t)&&(t<=364)                       %dry period 7
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;     
    elseif (365<=t)&&(t<=394)        %rainy period 8
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (395<=t)&&(t<=416)                       %dry period 8
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;     
    elseif (417<=t)&&(t<=446)        %rainy period 9
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    elseif (447<=t)&&(t<=468)                       %dry period 9
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;     
    elseif (469<=t)&&(t<=498)        %rainy period 10
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;     
    else                      %dry period 10
         al1722(t)=0.05; al1822(t)=0.05; al1922(t)=0.1; al2022(t)=0.15; 
         al2122(t)=0.25; al2322(t)=0.15; al2422(t)=0.15; al2522(t)=0.1;
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)        %rainy period 1
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (31<=t)&&(t<=52)                       %dry period 1
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (53<=t)&&(t<=82)        %rainy period 2
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;  
    elseif (83<=t)&&(t<=104)                       %dry period 2
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (105<=t)&&(t<=134)        %rainy period 3
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (135<=t)&&(t<=156)                   %dry period 3
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;     
    elseif (157<=t)&&(t<=186)        %rainy period 4
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (187<=t)&&(t<=208)                   %dry period 4
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;
    elseif (209<=t)&&(t<=238)        %rainy period 5
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (239<=t)&&(t<=260)                   %dry period 5
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;     
    elseif (261<=t)&&(t<=290)        %rainy period 6
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (290<=t)&&(t<=312)                   %dry period 6
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;
    elseif (313<=t)&&(t<=342)        %rainy period 7
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (343<=t)&&(t<=364)                   %dry period 7
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;     
    elseif (365<=t)&&(t<=394)        %rainy period 8
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (395<=t)&&(t<=416)                   %dry period 8
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;
    elseif (417<=t)&&(t<=446)        %rainy period 9
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    elseif (447<=t)&&(t<=468)                   %dry period 9
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;     
    elseif (469<=t)&&(t<=498)        %rainy period 10
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25;     
    else                       %dry period 10
         be1722(t)=0; be1822(t)=0; be1922(t)=0; be2022(t)=0; 
         be2122(t)=0.25; be2322(t)=0.25; be2422(t)=0.25; be2522(t)=0.25; 
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r22= r1;
rho22= r22;
% Reproduction rate of free-living bacteria
la22=la1;
%Migration rates
mF22=mF1;
mA22=mF22;
m22=m1;

%% Population 23 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (31<=t)&&(t<=52)                            %dry period 1
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (83<=t)&&(t<=104)                            %dry period 2
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (135<=t)&&(t<=156)                     %dry period 3
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (187<=t)&&(t<=208)                     %dry period 4
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;      
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (239<=t)&&(t<=260)                     %dry period 5
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;     
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (290<=t)&&(t<=312)                     %dry period 6
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (343<=t)&&(t<=364)                     %dry period 7
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;      
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (395<=t)&&(t<=416)                     %dry period 8
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    elseif (447<=t)&&(t<=468)                     %dry period 9
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15;     
    else                            %dry period 10
         al1723(t)=0.04; al1823(t)=0.07; al1923(t)=0.09; al2023(t)=0.1; 
         al2123(t)=0.15; al2223(t)=0.2; al2423(t)=0.2; al2523(t)=0.15; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)             %rainy period 1
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (31<=t)&&(t<=52)             %dry period 1
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (83<=t)&&(t<=104)             %dry period 2
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (105<=t)&&(t<=134)             %rainy period 3
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (135<=t)&&(t<=156)             %dry period 3
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;     
    elseif (157<=t)&&(t<=186)             %rainy period 4
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (187<=t)&&(t<=208)             %dry period 4
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (239<=t)&&(t<=260)             %dry period 5
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (290<=t)&&(t<=312)             %dry period 6
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (313<=t)&&(t<=342)             %rainy period 7
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (343<=t)&&(t<=364)             %dry period 7
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    elseif (365<=t)&&(t<=394)             %rainy period 8
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (395<=t)&&(t<=416)             %dry period 8
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;     
    elseif (401<=t)&&(t<=230)             %rainy period 9
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (447<=t)&&(t<=468)             %dry period 9
        be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25; 
    elseif (469<=t)&&(t<=498)             %rainy period 10
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;      
    else             %dry period 10
         be1723(t)=0; be1823(t)=0; be1923(t)=0; be2023(t)=0; 
         be2123(t)=0.25; be2223(t)=0.25; be2423(t)=0.25; be2523(t)=0.25;
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r23= r1;
rho23= r23;
% Reproduction rate of free-living bacteria
la23=la1;
%Migration rates
mF23=mF1;
mA23=mF23;
m23=m1;

%% Population 24 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)             %rainy period 1
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (31<=t)&&(t<=52)                 %dry period 1
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (83<=t)&&(t<=104)                 %dry period 2
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (135<=t)&&(t<=156)                 %dry period 3
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (157<=t)&&(t<=186)             %rainy period 4
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (187<=t)&&(t<=208)                 %dry period 4
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (239<=t)&&(t<=260)                 %dry period 5
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (290<=t)&&(t<=312)                 %dry period 6
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (313<=t)&&(t<=342)             %rainy period 7
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (343<=t)&&(t<=364)                 %dry period 7
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;  
    elseif (365<=t)&&(t<=394)             %rainy period 8
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (395<=t)&&(t<=416)                 %dry period 8
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;
    elseif (417<=t)&&(t<=446)             %rainy period 9
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    elseif (447<=t)&&(t<=468)                 %dry period 9
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;     
    elseif (469<=t)&&(t<=498)             %rainy period 10
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2;     
    else                 %dry period 10
         al1724(t)=0.07; al1824(t)=0.08; al1924(t)=0.1; al2024(t)=0.1; 
         al2124(t)=0.1; al2224(t)=0.15; al2324(t)=0.2; al2524(t)=0.2; 
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                     
    if (1<=t)&&(t<=30)             %rainy period 1
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (31<=t)&&(t<=52)                            %dry period 1
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (53<=t)&&(t<=82)             %rainy period 2
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (83<=t)&&(t<=104)               %dry period 2
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (105<=t)&&(t<=134)             %rainy period 3
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (135<=t)&&(t<=156)               %dry period 3
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;
    elseif (157<=t)&&(t<=186)             %rainy period 4
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (187<=t)&&(t<=208)               %dry period 4
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;
    elseif (209<=t)&&(t<=238)             %rainy period 5
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (239<=t)&&(t<=260)               %dry period 5
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;
    elseif (261<=t)&&(t<=290)             %rainy period 6
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (290<=t)&&(t<=312)               %dry period 6
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;     
    elseif (313<=t)&&(t<=342)             %rainy period 7
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (343<=t)&&(t<=364)               %dry period 7
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (365<=t)&&(t<=394)             %rainy period 8
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (395<=t)&&(t<=416)               %dry period 8
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    elseif (417<=t)&&(t<=446)             %rainy period 9
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (447<=t)&&(t<=468)               %dry period 9
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;  
    elseif (469<=t)&&(t<=498)             %rainy period 10
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25;     
    else                            %dry period 10
         be1724(t)=0; be1824(t)=0; be1924(t)=0; be2024(t)=0; 
         be2124(t)=0.25; be2224(t)=0.25; be2324(t)=0.25; be2524(t)=0.25; 
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r24= r1;
rho24= r24;
% Reproduction rate of free-living bacteria
la24=la1;
%Migration rates
mF24=mF1;
mA24=mF24;
m24=m1;

%% Population 25 parameters
 
%connectivity fish biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)              %rainy period 1
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 
    elseif (31<=t)&&(t<=52)                             %dry period 1
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 
    elseif (53<=t)&&(t<=82)              %rainy period 2
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 
    elseif (83<=t)&&(t<=104)                             %dry period 2
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (105<=t)&&(t<=134)              %rainy period 3
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (135<=t)&&(t<=156)                   %dry period 3
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 
    elseif (157<=t)&&(t<=186)              %rainy period 4
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (187<=t)&&(t<=208)                   %dry period 4
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;      
    elseif (209<=t)&&(t<=238)              %rainy period 5
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (239<=t)&&(t<=260)                   %dry period 5
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;     
    elseif (261<=t)&&(t<=290)              %rainy period 6
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (290<=t)&&(t<=312)                   %dry period 6
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (343<=t)&&(t<=364)                   %dry period 7
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.13; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25; 
    elseif (365<=t)&&(t<=394)              %rainy period 8
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (395<=t)&&(t<=416)                   %dry period 8
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;   
    elseif (417<=t)&&(t<=446)              %rainy period 9
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.13; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (447<=t)&&(t<=468)                   %dry period 9
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    elseif (469<=t)&&(t<=498)              %rainy period 10
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;     
    else                             %dry period 10
         al1725(t)=0.03; al1825(t)=0.07; al1925(t)=0.1; al2025(t)=0.1; 
         al2125(t)=0.12; al2225(t)=0.15; al2325(t)=0.18; al2425(t)=0.25;
    end    
end
%connectivity macroinvertebrate biomass
for t=1:nt+1                    
    if (1<=t)&&(t<=30)              %rainy period 1
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (31<=t)&&(t<=52)               %dry period 1
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (53<=t)&&(t<=82)              %rainy period 2
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (83<=t)&&(t<=104)               %dry period 2
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (105<=t)&&(t<=134)              %rainy period 3
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (135<=t)&&(t<=156)               %dry period 3
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (157<=t)&&(t<=186)              %rainy period 4
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (187<=t)&&(t<=208)               %dry period 4
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (209<=t)&&(t<=238)              %rainy period 5
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (239<=t)&&(t<=260)               %dry period 5
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (261<=t)&&(t<=290)              %rainy period 6
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (290<=t)&&(t<=312)               %dry period 6
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (313<=t)&&(t<=342)              %rainy period 7
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (343<=t)&&(t<=364)               %dry period 7
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (365<=t)&&(t<=394)              %rainy period 8
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (395<=t)&&(t<=416)               %dry period 8
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;     
    elseif (417<=t)&&(t<=446)              %rainy period 9
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    elseif (447<=t)&&(t<=468)               %dry period 9
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;
    elseif (469<=t)&&(t<=498)              %rainy period 10
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25;     
    else               %dry period 10
         be1725(t)=0; be1825(t)=0; be1925(t)=0; be2025(t)=0; 
         be2125(t)=0.25; be2225(t)=0.25; be2325(t)=0.25; be2425(t)=0.25; 
    end    
end
% Reproduction rates of carrier host
t=0:nt ;
r25= r1;
rho25= r25;
% Reproduction rate of free-living bacteria
la25=la1;
%Migration rates
mF25=mF1;
mA25=mF25;
m25=m1;
%%
%% Calculating variables for each time step

for t=1:nt 
    
    %Explicit-implicit method 
    F1(t+1)=( F1(t)+dt*r1(t)*F1(t)+ dt*al12(t)*mF2(t)*F2(t)+dt*al13(t)*mF3(t)*F3(t)+dt*al14(t)*mF4(t)*F4(t)+dt*al15(t)*mF5(t)*F5(t)+dt*al16(t)*mF6(t)*F6(t)+dt*al17(t)*mF7(t)*F7(t)+dt*al18(t)*mF8(t)*F8(t)+dt*al19(t)*mF9(t)*F9(t)+dt*al110(t)*mF10(t)*F10(t) )/(1+dt*(mF1(t)+nu));
    BF1(t+1)=( BF1(t)+dt*lamF*F1(t).*BF1(t)/(1+F1(t))+dt*gaF*F1(t).*Bo1(t)/(1+F1(t))+ dt*al12(t)*mF2(t)*BF2(t)+dt*al13(t)*mF3(t)*BF3(t)+dt*al14(t)*mF4(t)*BF4(t)+dt*al15(t)*mF5(t)*BF5(t)+dt*al16(t)*mF6(t)*BF6(t)+dt*al17(t)*mF7(t)*BF7(t)+dt*al18(t)*mF8(t)*BF8(t)+dt*al19(t)*mF9(t)*BF9(t)+dt*al110(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF1(t)+nu));
    A1(t+1)=( A1(t)+dt*rho1(t)*A1(t)+ dt*be12(t)*mA2(t)*A2(t)+dt*be13(t)*mA3(t)*A3(t)+dt*be14(t)*mA4(t)*A4(t)+dt*be15(t)*mA5(t)*A5(t)+dt*be16(t)*mA6(t)*A6(t)+dt*be17(t)*mA7(t)*A7(t)+dt*be18(t)*mA8(t)*A8(t)+dt*be19(t)*mA9(t)*A9(t)+dt*be110(t)*mA10(t)*A10(t) )/(1+dt*(mA1(t)+nu));
    BA1(t+1)=( BA1(t)+dt*lamA*A1(t).*BA1(t)/(1+A1(t))+dt*gaA*A1(t).*Bo1(t)/(1+A1(t))+ dt*be12(t)*mA2(t)*BA2(t)+dt*be13(t)*mA3(t)*BA3(t)+dt*be14(t)*mA4(t)*BA4(t)+dt*be15(t)*mA5(t)*BA5(t)+dt*be16(t)*mA6(t)*BA6(t)+dt*be17(t)*mA7(t)*BA7(t)+dt*be18(t)*mA8(t)*BA8(t)+dt*be19(t)*mA9(t)*BA9(t)+dt*be110(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA1(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo1(t+1)=0;
    elseif mod(t,52)==0 
        Bo1(t)=Bo1(t-1)+0.2;
    else
        Bo1(t+1)=( Bo1(t)+dt*la1(t)*Bo1(t)+(dt*siF*nu)*BF1(t)+(dt*siA*nu)*BA1(t) )/(1+dt*(gaF*F1(t)/(1+F1(t))+gaA*A1(t)/(1+A1(t))+mu+m1(t)));
    end 
    
    F2(t+1)=( F2(t)+dt*r2(t)*F2(t)+ dt*al21(t)*mF1(t)*F1(t)+dt*al23(t)*mF3(t)*F3(t)+dt*al24(t)*mF4(t)*F4(t)+dt*al25(t)*mF5(t)*F5(t)+dt*al26(t)*mF6(t)*F6(t)+dt*al27(t)*mF7(t)*F7(t)+dt*al28(t)*mF8(t)*F8(t)+dt*al29(t)*mF9(t)*F9(t)+dt*al210(t)*mF10(t)*F10(t) )/(1+dt*(mF2(t)+nu));
    BF2(t+1)=( BF2(t)+dt*lamF*F2(t).*BF2(t)/(1+F2(t))+dt*gaF*F2(t).*Bo2(t)/(1+F2(t))+ dt*al21(t)*mF1(t)*BF1(t)+dt*al23(t)*mF3(t)*BF3(t)+dt*al24(t)*mF4(t)*BF4(t)+dt*al25(t)*mF5(t)*BF5(t)+dt*al26(t)*mF6(t)*BF6(t)+dt*al27(t)*mF7(t)*BF7(t)+dt*al28(t)*mF8(t)*BF8(t)+dt*al29(t)*mF9(t)*BF9(t)+dt*al210(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF2(t)+nu));
    A2(t+1)=( A2(t)+dt*rho2(t)*A2(t)+ dt*be21(t)*mA1(t)*A1(t)+dt*be23(t)*mA3(t)*A3(t)+dt*be24(t)*mA4(t)*A4(t)+dt*be25(t)*mA5(t)*A5(t)+dt*be26(t)*mA6(t)*A6(t)+dt*be27(t)*mA7(t)*A7(t)+dt*be28(t)*mA8(t)*A8(t)+dt*be29(t)*mA9(t)*A9(t)+dt*be210(t)*mA10(t)*A10(t) )/(1+dt*(mA2(t)+nu));
    BA2(t+1)=( BA2(t)+dt*lamA*A2(t).*BA2(t)/(1+A2(t))+dt*gaA*A2(t).*Bo2(t)/(1+A2(t))+ dt*be21(t)*mA1(t)*BA1(t)+dt*be23(t)*mA3(t)*BA3(t)+dt*be24(t)*mA4(t)*BA4(t)+dt*be25(t)*mA5(t)*BA5(t)+dt*be26(t)*mA6(t)*BA6(t)+dt*be27(t)*mA7(t)*BA7(t)+dt*be28(t)*mA8(t)*BA8(t)+dt*be29(t)*mA9(t)*BA9(t)+dt*be210(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA2(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo2(t+1)=0;
     else
        Bo2(t+1)=( Bo2(t)+dt*la2(t)*Bo2(t)+(dt*siF*nu)*BF2(t)+(dt*siA*nu)*BA2(t) )/(1+dt*(gaF*F2(t)/(1+F2(t))+gaA*A1(t)/(1+A1(t))+m2(t)+mu));
     end 
     
    F3(t+1)=( F3(t)+dt*r3(t)*F3(t)+ dt*al31(t)*mF1(t)*F1(t)+dt*al32(t)*mF2(t)*F2(t)+dt*al34(t)*mF4(t)*F4(t)+dt*al35(t)*mF5(t)*F5(t)+dt*al36(t)*mF6(t)*F6(t)+dt*al37(t)*mF7(t)*F7(t)+dt*al38(t)*mF8(t)*F8(t)+dt*al39(t)*mF9(t)*F9(t)+dt*al310(t)*mF10(t)*F10(t) )/(1+dt*(mF3(t)+nu));
    BF3(t+1)=( BF3(t)+dt*lamF*F3(t).*BF3(t)/(1+F3(t))+dt*gaF*F3(t).*Bo3(t)/(1+F3(t))+ dt*al31(t)*mF1(t)*BF1(t)+dt*al32(t)*mF2(t)*BF2(t)+dt*al34(t)*mF4(t)*BF4(t)+dt*al35(t)*mF5(t)*BF5(t)+dt*al36(t)*mF6(t)*BF6(t)+dt*al37(t)*mF7(t)*BF7(t)+dt*al38(t)*mF8(t)*BF8(t)+dt*al39(t)*mF9(t)*BF9(t)+dt*al310(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF3(t)+nu));
    A3(t+1)=( A3(t)+dt*rho3(t)*A3(t)+ dt*be31(t)*mA1(t)*A1(t)+dt*be32(t)*mA2(t)*A2(t)+dt*be34(t)*mA4(t)*A4(t)+dt*be35(t)*mA5(t)*A5(t)+dt*be36(t)*mA6(t)*A6(t)+dt*be37(t)*mA7(t)*A7(t)+dt*be38(t)*mA8(t)*A8(t)+dt*be39(t)*mA9(t)*A9(t)+dt*be310(t)*mA10(t)*A10(t) )/(1+dt*(mA3(t)+nu));
    BA3(t+1)=( BA3(t)+dt*lamA*A3(t).*BA3(t)/(1+A3(t))+dt*gaA*A3(t).*Bo3(t)/(1+A3(t))+ dt*be31(t)*mA1(t)*BA1(t)+dt*be32(t)*mA2(t)*BA2(t)+dt*be34(t)*mA4(t)*BA4(t)+dt*be35(t)*mA5(t)*BA5(t)+dt*be36(t)*mA6(t)*BA6(t)+dt*be37(t)*mA7(t)*BA7(t)+dt*be38(t)*mA8(t)*BA8(t)+dt*be39(t)*mA9(t)*BA9(t)+dt*be310(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA3(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo3(t+1)=0;
     else
        Bo3(t+1)=( Bo3(t)+dt*la3(t)*Bo3(t)+(dt*siF*nu)*BF3(t)+(dt*siA*nu)*BA3(t) )/(1+dt*(gaF*F3(t)/(1+F3(t))+gaA*A3(t)/(1+A3(t))+m3(t)+mu));     
     end
     
    F4(t+1)=( F4(t)+dt*r4(t)*F4(t)+ dt*al41(t)*mF1(t)*F1(t)+dt*al42(t)*mF2(t)*F2(t)+dt*al43(t)*mF3(t)*F3(t)+dt*al45(t)*mF5(t)*F5(t)+dt*al46(t)*mF6(t)*F6(t)+dt*al47(t)*mF7(t)*F7(t)+dt*al48(t)*mF8(t)*F8(t)+dt*al49(t)*mF9(t)*F9(t)+dt*al410(t)*mF10(t)*F10(t) )/(1+dt*(mF4(t)+nu));
    BF4(t+1)=( BF4(t)+dt*lamF*F4(t).*BF4(t)/(1+F4(t))+dt*gaF*F4(t).*Bo4(t)/(1+F4(t))+ dt*al41(t)*mF1(t)*BF1(t)+dt*al42(t)*mF2(t)*BF2(t)+dt*al43(t)*mF3(t)*BF3(t)+dt*al45(t)*mF5(t)*BF5(t)+dt*al46(t)*mF6(t)*BF6(t)+dt*al47(t)*mF7(t)*BF7(t)+dt*al48(t)*mF8(t)*BF8(t)+dt*al49(t)*mF9(t)*BF9(t)+dt*al410(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF4(t)+nu));
    A4(t+1)=( A4(t)+dt*rho4(t)*A4(t)+ dt*be41(t)*mA1(t)*A1(t)+dt*be42(t)*mA2(t)*A2(t)+dt*be43(t)*mA3(t)*A3(t)+dt*al2930(t)*mA5(t)*A5(t)+dt*be46(t)*mA6(t)*A6(t)+dt*be47(t)*mA7(t)*A7(t)+dt*be48(t)*mA8(t)*A8(t)+dt*be49(t)*mA9(t)*A9(t)+dt*be410(t)*mA10(t)*A10(t) )/(1+dt*(mA4(t)+nu));
    BA4(t+1)=( BA4(t)+dt*lamA*A4(t).*BA4(t)/(1+A4(t))+dt*gaA*A4(t).*Bo4(t)/(1+A4(t))+ dt*be41(t)*mA1(t)*BA1(t)+dt*be42(t)*mA2(t)*BA2(t)+dt*be43(t)*mA3(t)*BA3(t)+dt*al2930(t)*mA5(t)*BA5(t)+dt*be46(t)*mA6(t)*BA6(t)+dt*be47(t)*mA7(t)*BA7(t)+dt*be48(t)*mA8(t)*BA8(t)+dt*be49(t)*mA9(t)*BA9(t)+dt*be410(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA4(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo4(t+1)=0;
     else
        Bo4(t+1)=( Bo4(t)+dt*la4(t)*Bo4(t)+(dt*siF*nu)*BF4(t)+(dt*siA*nu)*BA4(t) )/(1+dt*(gaF*F4(t)/(1+F4(t))+gaA*A4(t)/(1+A4(t))+m4(t)+mu)); 
     end 
     
    F5(t+1)=( F5(t)+dt*r5(t)*F5(t)+ dt*al51(t)*mF1(t)*F1(t)+dt*al52(t)*mF2(t)*F2(t)+dt*al53(t)*mF3(t)*F3(t)+dt*al54(t)*mF4(t)*F4(t)+dt*al56(t)*mF6(t)*F6(t)+dt*al57(t)*mF7(t)*F7(t)+dt*al58(t)*mF8(t)*F8(t)+dt*al59(t)*mF9(t)*F9(t)+dt*al510(t)*mF10(t)*F10(t) )/(1+dt*(mF5(t)+nu));
    BF5(t+1)=( BF5(t)+dt*lamF*F5(t).*BF5(t)/(1+F5(t))+dt*gaF*F5(t).*Bo5(t)/(1+F5(t))+ dt*al51(t)*mF1(t)*BF1(t)+dt*al52(t)*mF2(t)*BF2(t)+dt*al53(t)*mF3(t)*BF3(t)+dt*al54(t)*mF4(t)*BF4(t)+dt*al56(t)*mF6(t)*BF6(t)+dt*al57(t)*mF7(t)*BF7(t)+dt*al58(t)*mF8(t)*BF8(t)+dt*al59(t)*mF9(t)*BF9(t)+dt*al510(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF5(t)+nu));
    A5(t+1)=( A5(t)+dt*rho5(t)*A5(t)+ dt*be51(t)*mA1(t)*A1(t)+dt*be52(t)*mA2(t)*A2(t)+dt*be53(t)*mA3(t)*A3(t)+dt*be54(t)*mA4(t)*A4(t)+dt*be56(t)*mA6(t)*A6(t)+dt*be57(t)*mA7(t)*A7(t)+dt*be58(t)*mA8(t)*A8(t)+dt*be59(t)*mA9(t)*A9(t)+dt*be510(t)*mA10(t)*A10(t) )/(1+dt*(mA5(t)+nu));
    BA5(t+1)=( BA5(t)+dt*lamA*A5(t).*BA5(t)/(1+A5(t))+dt*gaA*A5(t).*Bo5(t)/(1+A5(t))+ dt*be51(t)*mA1(t)*BA1(t)+dt*be52(t)*mA2(t)*BA2(t)+dt*be53(t)*mA3(t)*BA3(t)+dt*be54(t)*mA4(t)*BA4(t)+dt*be56(t)*mA6(t)*BA6(t)+dt*be57(t)*mA7(t)*BA7(t)+dt*be58(t)*mA8(t)*BA8(t)+dt*be59(t)*mA9(t)*BA9(t)+dt*be510(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA5(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo5(t+1)=0;
     else
        Bo5(t+1)=( Bo5(t)+dt*la5(t)*Bo5(t)+(dt*siF*nu)*BF5(t)+(dt*siA*nu)*BA5(t) )/(1+dt*(gaF*F5(t)/(1+F5(t))+gaA*A5(t)/(1+A5(t))+m5(t)+mu));
     end 
     
    F6(t+1)=( F6(t)+dt*r6(t)*F6(t)+ dt*al61(t)*mF1(t)*F1(t)+dt*al62(t)*mF2(t)*F2(t)+dt*al63(t)*mF3(t)*F3(t)+dt*al64(t)*mF4(t)*F4(t)+dt*al65(t)*mF5(t)*F5(t)+dt*al67(t)*mF7(t)*F7(t)+dt*al68(t)*mF8(t)*F8(t)+dt*al69(t)*mF9(t)*F9(t)+dt*al610(t)*mF10(t)*F10(t) )/(1+dt*(mF6(t)+nu));
    BF6(t+1)=( BF6(t)+dt*lamF*F6(t).*BF6(t)/(1+F6(t))+dt*gaF*F6(t).*Bo6(t)/(1+F6(t))+ dt*al61(t)*mF1(t)*BF1(t)+dt*al62(t)*mF2(t)*BF2(t)+dt*al63(t)*mF3(t)*BF3(t)+dt*al64(t)*mF4(t)*BF4(t)+dt*al65(t)*mF5(t)*BF5(t)+dt*al67(t)*mF7(t)*BF7(t)+dt*al68(t)*mF8(t)*BF8(t)+dt*al69(t)*mF9(t)*BF9(t)+dt*al610(t)*mF10(t)*BF10(t) )/(1+dt*(mu+mF6(t)+nu));
    A6(t+1)=( A6(t)+dt*rho6(t)*A6(t)+ dt*be61(t)*mA1(t)*A1(t)+dt*be62(t)*mA2(t)*A2(t)+dt*be63(t)*mA3(t)*A3(t)+dt*be64(t)*mA4(t)*A4(t)+dt*be65(t)*mA5(t)*A5(t)+dt*be67(t)*mA7(t)*A7(t)+dt*be68(t)*mA8(t)*A8(t)+dt*be69(t)*mA9(t)*A9(t)+dt*be610(t)*mA10(t)*A10(t) )/(1+dt*(mA6(t)+nu));
    BA6(t+1)=( BA6(t)+dt*lamA*A6(t).*BA6(t)/(1+A6(t))+dt*gaA*A6(t).*Bo6(t)/(1+A6(t))+ dt*be61(t)*mA1(t)*BA1(t)+dt*be62(t)*mA2(t)*BA2(t)+dt*be63(t)*mA3(t)*BA3(t)+dt*be64(t)*mA4(t)*BA4(t)+dt*be65(t)*mA5(t)*BA5(t)+dt*be67(t)*mA7(t)*BA7(t)+dt*be68(t)*mA8(t)*BA8(t)+dt*be69(t)*mA9(t)*BA9(t)+dt*be610(t)*mA10(t)*BA10(t) )/(1+dt*(mu+mA6(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo6(t+1)=0;
    else
        Bo6(t+1)=( Bo6(t)+dt*la6(t)*Bo6(t)+(dt*siF*nu)*BF6(t)+(dt*siA*nu)*BA6(t) )/(1+dt*(gaF*F6(t)/(1+F6(t))+gaA*A6(t)/(1+A6(t))+m6(t)+mu));
    end 
     
    F7(t+1)=( F7(t)+dt*r7(t)*F7(t)+ dt*al71(t)*mF1(t)*F1(t)+dt*al72(t)*mF2(t)*F2(t)+dt*al73(t)*mF3(t)*F3(t)+dt*al74(t)*mF4(t)*F4(t)+dt*al75(t)*mF5(t)*F5(t)+dt*al76(t)*mF6(t)*F6(t)+dt*al78(t)*mF8(t)*F8(t)+dt*al79(t)*mF9(t)*F9(t)+dt*al710(t)*mF10(t)*F10(t)+dt*al711(t)*mF11(t)*F11(t)+dt*al712(t)*mF12(t)*F12(t)+dt*al713(t)*mF13(t)*F13(t) )/(1+dt*(mF7(t)+nu));
    BF7(t+1)=( BF7(t)+dt*lamF*F7(t).*BF7(t)/(1+F7(t))+dt*gaF*F7(t).*Bo7(t)/(1+F7(t))+ dt*al71(t)*mF1(t)*BF1(t)+dt*al72(t)*mF2(t)*BF2(t)+dt*al73(t)*mF3(t)*BF3(t)+dt*al74(t)*mF4(t)*BF4(t)+dt*al75(t)*mF5(t)*BF5(t)+dt*al76(t)*mF6(t)*BF6(t)+dt*al78(t)*mF8(t)*BF8(t)+dt*al79(t)*mF9(t)*BF9(t)+dt*al710(t)*mF10(t)*BF10(t)+dt*al711(t)*mF11(t)*BF11(t)+dt*al712(t)*mF12(t)*BF12(t)+dt*al713(t)*mF13(t)*BF13(t) )/(1+dt*(mu+mF7(t)+nu));
    A7(t+1)=( A7(t)+dt*rho7(t)*A7(t)+ dt*be71(t)*mA1(t)*A1(t)+dt*be72(t)*mA2(t)*A2(t)+dt*be73(t)*mA3(t)*A3(t)+dt*be74(t)*mA4(t)*A4(t)+dt*be75(t)*mA5(t)*A5(t)+dt*be76(t)*mA6(t)*A6(t)+dt*be78(t)*mA8(t)*A8(t)+dt*be79(t)*mA9(t)*A9(t)+dt*be710(t)*mA10(t)*A10(t)+dt*be711(t)*mA11(t)*A11(t)+dt*be712(t)*mA12(t)*A12(t)+dt*be713(t)*mA13(t)*A13(t) )/(1+dt*(mA7(t)+nu));
    BA7(t+1)=( BA7(t)+dt*lamA*A7(t).*BA7(t)/(1+A7(t))+dt*gaA*A7(t).*Bo7(t)/(1+A7(t))+ dt*be71(t)*mA1(t)*BA1(t)+dt*be72(t)*mA2(t)*BA2(t)+dt*be73(t)*mA3(t)*BA3(t)+dt*be74(t)*mA4(t)*BA4(t)+dt*be75(t)*mA5(t)*BA5(t)+dt*be76(t)*mA6(t)*BA6(t)+dt*be78(t)*mA8(t)*BA8(t)+dt*be79(t)*mA9(t)*BA9(t)+dt*be710(t)*mA10(t)*BA10(t)+dt*be711(t)*mA11(t)*BA11(t)+dt*be712(t)*mA12(t)*BA12(t)+dt*be713(t)*mA13(t)*BA13(t) )/(1+dt*(mu+mA7(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo7(t+1)=0;
     else
        Bo7(t+1)=( Bo7(t)+dt*la7(t)*Bo7(t)+(dt*siF*nu)*BF7(t)+(dt*siA*nu)*BA7(t) )/(1+dt*(gaF*F7(t)/(1+F7(t))+gaA*A7(t)/(1+A7(t))+m7(t)+mu));
     end 
     
    F8(t+1)=( F8(t)+dt*r8(t)*F8(t)+ dt*al81(t)*mF1(t)*F1(t)+dt*al82(t)*mF2(t)*F2(t)+dt*al83(t)*mF3(t)*F3(t)+dt*al84(t)*mF4(t)*F4(t)+dt*al85(t)*mF5(t)*F5(t)+dt*al86(t)*mF6(t)*F6(t)+dt*al87(t)*mF7(t)*F7(t)+dt*al89(t)*mF9(t)*F9(t)+dt*al810(t)*mF10(t)*F10(t)+dt*al811(t)*mF11(t)*F11(t)+dt*al812(t)*mF12(t)*F12(t)+dt*al813(t)*mF13(t)*F13(t) )/(1+dt*(mF8(t)+nu));
    BF8(t+1)=( BF8(t)+dt*lamF*F8(t).*BF8(t)/(1+F8(t))+dt*gaF*F8(t).*Bo8(t)/(1+F8(t))+ dt*al81(t)*mF1(t)*BF1(t)+dt*al82(t)*mF2(t)*BF2(t)+dt*al83(t)*mF3(t)*BF3(t)+dt*al84(t)*mF4(t)*BF4(t)+dt*al85(t)*mF5(t)*BF5(t)+dt*al86(t)*mF6(t)*BF6(t)+dt*al87(t)*mF7(t)*BF7(t)+dt*al89(t)*mF9(t)*BF9(t)+dt*al810(t)*mF10(t)*BF10(t)+dt*al811(t)*mF11(t)*BF11(t)+dt*al812(t)*mF12(t)*BF12(t)+dt*al813(t)*mF13(t)*BF13(t) )/(1+dt*(mu+mF8(t)+nu));
    A8(t+1)=( A8(t)+dt*rho8(t)*A8(t)+ dt*be81(t)*mA1(t)*A1(t)+dt*be82(t)*mA2(t)*A2(t)+dt*be83(t)*mA3(t)*A3(t)+dt*be84(t)*mA4(t)*A4(t)+dt*be85(t)*mA5(t)*A5(t)+dt*be86(t)*mA6(t)*A6(t)+dt*be87(t)*mA7(t)*A7(t)+dt*be89(t)*mA9(t)*A9(t)+dt*be810(t)*mA10(t)*A10(t)+dt*be811(t)*mA11(t)*A11(t)+dt*be812(t)*mA12(t)*A12(t)+dt*be813(t)*mA13(t)*A13(t) )/(1+dt*(mA8(t)+nu));
    BA8(t+1)=( BA8(t)+dt*lamA*A8(t).*BA8(t)/(1+A8(t))+dt*gaA*A8(t).*Bo8(t)/(1+A8(t))+ dt*be81(t)*mA1(t)*BA1(t)+dt*be82(t)*mA2(t)*BA2(t)+dt*be83(t)*mA3(t)*BA3(t)+dt*be84(t)*mA4(t)*BA4(t)+dt*be85(t)*mA5(t)*BA5(t)+dt*be86(t)*mA6(t)*BA6(t)+dt*be87(t)*mA7(t)*BA7(t)+dt*be89(t)*mA9(t)*BA9(t)+dt*be810(t)*mA10(t)*BA10(t)+dt*be811(t)*mA11(t)*BA11(t)+dt*be812(t)*mA12(t)*BA12(t)+dt*be813(t)*mA13(t)*BA13(t) )/(1+dt*(mu+mA8(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo8(t+1)=0;
     else
        Bo8(t+1)=( Bo8(t)+dt*la8(t)*Bo8(t)+(dt*siF*nu)*BF8(t)+(dt*siA*nu)*BA8(t) )/(1+dt*(gaF*F8(t)/(1+F8(t))+gaA*A8(t)/(1+A8(t))+m8(t)+mu));
     end 
     
    F9(t+1)=( F9(t)+dt*r9(t)*F9(t)+ dt*al91(t)*mF1(t)*F1(t)+dt*al92(t)*mF2(t)*F2(t)+dt*al93(t)*mF3(t)*F3(t)+dt*al94(t)*mF4(t)*F4(t)+dt*al95(t)*mF5(t)*F5(t)+dt*al96(t)*mF6(t)*F6(t)+dt*al97(t)*mF7(t)*F7(t)+dt*al98(t)*mF8(t)*F8(t)+dt*al910(t)*mF10(t)*F10(t)+dt*al911(t)*mF11(t)*F11(t)+dt*al912(t)*mF12(t)*F12(t)+dt*al913(t)*mF13(t)*F13(t) )/(1+dt*(mF9(t)+nu));
    BF9(t+1)=( BF9(t)+dt*lamF*F9(t).*BF9(t)/(1+F9(t))+dt*gaF*F9(t).*Bo9(t)/(1+F9(t))+ dt*al91(t)*mF1(t)*BF1(t)+dt*al92(t)*mF2(t)*BF2(t)+dt*al93(t)*mF3(t)*BF3(t)+dt*al94(t)*mF4(t)*BF4(t)+dt*al95(t)*mF5(t)*BF5(t)+dt*al96(t)*mF6(t)*BF6(t)+dt*al97(t)*mF7(t)*BF7(t)+dt*al98(t)*mF8(t)*BF8(t)+dt*al910(t)*mF10(t)*BF10(t)+dt*al911(t)*mF11(t)*BF11(t)+dt*al912(t)*mF12(t)*BF12(t)+dt*al913(t)*mF13(t)*BF13(t) )/(1+dt*(mu+mF9(t)+nu)); 
    A9(t+1)=( A9(t)+dt*rho9(t)*A9(t)+ dt*be91(t)*mA1(t)*A1(t)+dt*be92(t)*mA2(t)*A2(t)+dt*be93(t)*mA3(t)*A3(t)+dt*be94(t)*mA4(t)*A4(t)+dt*be95(t)*mA5(t)*A5(t)+dt*be96(t)*mA6(t)*A6(t)+dt*be97(t)*mA7(t)*A7(t)+dt*be98(t)*mA8(t)*A8(t)+dt*be910(t)*mA10(t)*A10(t)+dt*be911(t)*mA11(t)*A11(t)+dt*be912(t)*mA12(t)*A12(t)+dt*be913(t)*mA13(t)*A13(t) )/(1+dt*(mA9(t)+nu));
    BA9(t+1)=( BA9(t)+dt*lamA*A9(t).*BA9(t)/(1+A9(t))+dt*gaA*A9(t).*Bo9(t)/(1+A9(t))+ dt*be91(t)*mA1(t)*BA1(t)+dt*be92(t)*mA2(t)*BA2(t)+dt*be93(t)*mA3(t)*BA3(t)+dt*be94(t)*mA4(t)*BA4(t)+dt*be95(t)*mA5(t)*BA5(t)+dt*be96(t)*mA6(t)*BA6(t)+dt*be97(t)*mA7(t)*BA7(t)+dt*be98(t)*mA8(t)*BA8(t)+dt*be910(t)*mA10(t)*BA10(t)+dt*be911(t)*mA11(t)*BA11(t)+dt*be912(t)*mA12(t)*BA12(t)+dt*be913(t)*mA13(t)*BA13(t) )/(1+dt*(mu+mA9(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo9(t+1)=0;
     else
        Bo9(t+1)=( Bo9(t)+dt*la9(t)*Bo9(t)+(dt*siF*nu)*BF9(t)+(dt*siA*nu)*BA9(t) )/(1+dt*(gaF*F9(t)/(1+F9(t))+gaA*A9(t)/(1+A9(t))+m9(t)+mu));
     end 
     
    F10(t+1)=( F10(t)+dt*r10(t)*F10(t)+ dt*al101(t)*mF1(t)*F1(t)+dt*al102(t)*mF2(t)*F2(t)+dt*al103(t)*mF3(t)*F3(t)+dt*al104(t)*mF4(t)*F4(t)+dt*al105(t)*mF5(t)*F5(t)+dt*al106(t)*mF6(t)*F6(t)+dt*al107(t)*mF7(t)*F7(t)+dt*al108(t)*mF8(t)*F8(t)+dt*al109(t)*mF9(t)*F9(t)+dt*al1011(t)*mF11(t)*F11(t)+dt*al1012(t)*mF12(t)*F12(t)+dt*al1013(t)*mF13(t)*F13(t) )/(1+dt*(mF10(t)+nu));
    BF10(t+1)=( BF10(t)+dt*lamF*F10(t).*BF10(t)/(1+F10(t))+dt*gaF*F10(t).*Bo10(t)/(1+F10(t))+ dt*al101(t)*mF1(t)*BF1(t)+dt*al102(t)*mF2(t)*BF2(t)+dt*al103(t)*mF3(t)*BF3(t)+dt*al104(t)*mF4(t)*BF4(t)+dt*al105(t)*mF5(t)*BF5(t)+dt*al106(t)*mF6(t)*BF6(t)+dt*al107(t)*mF7(t)*BF7(t)+dt*al108(t)*mF8(t)*BF8(t)+dt*al109(t)*mF9(t)*BF9(t)+dt*al1011(t)*mF11(t)*BF11(t)+dt*al1012(t)*mF12(t)*BF12(t)+dt*al1013(t)*mF13(t)*BF13(t) )/(1+dt*(mu+mF10(t)+nu));
    A10(t+1)=( A10(t)+dt*rho10(t)*A10(t)+ dt*be101(t)*mA1(t)*A1(t)+dt*be102(t)*mA2(t)*A2(t)+dt*be103(t)*mA3(t)*A3(t)+dt*be104(t)*mA4(t)*A4(t)+dt*be105(t)*mA5(t)*A5(t)+dt*be106(t)*mA6(t)*A6(t)+dt*be107(t)*mA7(t)*A7(t)+dt*be108(t)*mA8(t)*A8(t)+dt*be109(t)*mA9(t)*A9(t)+dt*be1011(t)*mA11(t)*A11(t)+dt*be1012(t)*mA12(t)*A12(t)+dt*be1013(t)*mA13(t)*A13(t) )/(1+dt*(mA10(t)+nu));
    BA10(t+1)=( BA10(t)+dt*lamA*A10(t).*BA10(t)/(1+A10(t))+dt*gaA*A10(t).*Bo10(t)/(1+A10(t))+ dt*be101(t)*mA1(t)*BA1(t)+dt*be102(t)*mA2(t)*BA2(t)+dt*be103(t)*mA3(t)*BA3(t)+dt*be104(t)*mA4(t)*BA4(t)+dt*be105(t)*mA5(t)*BA5(t)+dt*be106(t)*mA6(t)*BA6(t)+dt*be107(t)*mA7(t)*BA7(t)+dt*be108(t)*mA8(t)*BA8(t)+dt*be109(t)*mA9(t)*BA9(t)+dt*be1011(t)*mA11(t)*BA11(t)+dt*be1012(t)*mA12(t)*BA12(t)+dt*be1013(t)*mA13(t)*BA13(t) )/(1+dt*(mu+mA10(t)+nu));
     if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo10(t+1)=0;
     else
        Bo10(t+1)=( Bo10(t)+dt*la10(t)*Bo10(t)+(dt*siF*nu)*BF10(t)+(dt*siA*nu)*BA10(t) )/(1+dt*(gaF*F10(t)/(1+F10(t))+gaA*A10(t)/(1+A10(t))+m10(t)+mu));
    end 
     
    F11(t+1)=( F11(t)+dt*r11(t)*F11(t)+ dt*al117(t)*mF7(t)*F7(t)+dt*al118(t)*mF8(t)*F8(t)+dt*al119(t)*mF9(t)*F9(t)+dt*al1110(t)*mF10(t)*F10(t)+dt*al1112(t)*mF12(t)*F12(t)+dt*al1113(t)*mF13(t)*F13(t)+dt*al1114(t)*mF14(t)*F14(t)+dt*al1115(t)*mF15(t)*F15(t)+dt*al1116(t)*mF16(t)*F16(t) )/(1+dt*(mF11(t)+nu));
    BF11(t+1)=( BF11(t)+dt*lamF*F11(t).*BF11(t)/(1+F11(t))+dt*gaF*F11(t).*Bo11(t)/(1+F11(t))+ dt*al117(t)*mF7(t)*BF7(t)+dt*al118(t)*mF8(t)*BF8(t)+dt*al119(t)*mF9(t)*BF9(t)+dt*al1110(t)*mF10(t)*BF10(t)+dt*al1112(t)*mF12(t)*BF12(t)+dt*al1113(t)*mF13(t)*BF13(t)+dt*al1114(t)*mF14(t)*BF14(t)+dt*al1115(t)*mF15(t)*BF15(t)+dt*al1116(t)*mF16(t)*BF16(t) )/(1+dt*(mu+mF11(t)+nu));
    A11(t+1)=( A11(t)+dt*rho11(t)*A11(t)+ dt*be117(t)*mA7(t)*A7(t)+dt*be118(t)*mA8(t)*A8(t)+dt*be119(t)*mA9(t)*A9(t)+dt*be1110(t)*mA10(t)*A10(t)+dt*be1112(t)*mA12(t)*A12(t)+dt*be1113(t)*mA13(t)*A13(t)+dt*be1114(t)*mA14(t)*A14(t)+dt*be1115(t)*mA15(t)*A15(t)+dt*be1116(t)*mA16(t)*A16(t) )/(1+dt*(mA11(t)+nu));
    BA11(t+1)=( BA11(t)+dt*lamA*A11(t).*BA11(t)/(1+A11(t))+dt*gaA*A11(t).*Bo11(t)/(1+A11(t))+ dt*be117(t)*mA7(t)*BA7(t)+dt*be118(t)*mA8(t)*BA8(t)+dt*be119(t)*mA9(t)*BA9(t)+dt*be1110(t)*mA10(t)*BA10(t)+dt*be1112(t)*mA12(t)*BA12(t)+dt*be1113(t)*mA13(t)*BA13(t)+dt*be1114(t)*mA14(t)*BA14(t)+dt*be1115(t)*mA15(t)*BA15(t)+dt*be1116(t)*mA16(t)*BA16(t) )/(1+dt*(mu+mA11(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo11(t+1)=0;
     else
        Bo11(t+1)=( Bo11(t)+dt*la11(t)*Bo11(t)+(dt*siF*nu)*BF11(t)+(dt*siA*nu)*BA11(t) )/(1+dt*(gaF*F11(t)/(1+F11(t))+gaA*A11(t)/(1+A11(t))+m11(t)+mu));
    end 

    F12(t+1)=( F12(t)+dt*r12(t)*F12(t)+ dt*al127(t)*mF7(t)*F7(t)+dt*al128(t)*mF8(t)*F8(t)+dt*al129(t)*mF9(t)*F9(t)+dt*al1210(t)*mF10(t)*F10(t)+dt*al1211(t)*mF11(t)*F11(t)+dt*al1213(t)*mF13(t)*F13(t)+dt*al1214(t)*mF14(t)*F14(t)+dt*al1215(t)*mF15(t)*F15(t)+dt*al1216(t)*mF16(t)*F16(t) )/(1+dt*(mF12(t)+nu));
    BF12(t+1)=( BF12(t)+dt*lamF*F12(t).*BF12(t)/(1+F12(t))+dt*gaF*F12(t).*Bo12(t)/(1+F12(t))+ dt*al127(t)*mF7(t)*BF7(t)+dt*al128(t)*mF8(t)*BF8(t)+dt*al129(t)*mF9(t)*BF9(t)+dt*al1210(t)*mF10(t)*BF10(t)+dt*al1211(t)*mF11(t)*BF11(t)+dt*al1213(t)*mF13(t)*BF13(t)+dt*al1214(t)*mF14(t)*BF14(t)+dt*al1215(t)*mF15(t)*BF15(t)+dt*al1216(t)*mF16(t)*BF16(t) )/(1+dt*(mu+mF12(t)+nu));
    A12(t+1)=( A12(t)+dt*rho12(t)*A12(t)+ dt*be127(t)*mA7(t)*A7(t)+dt*be128(t)*mA8(t)*A8(t)+dt*be129(t)*mA9(t)*A9(t)+dt*be1210(t)*mA10(t)*A10(t)+dt*be1211(t)*mA11(t)*A11(t)+dt*be1213(t)*mA13(t)*A13(t)+dt*be1214(t)*mA14(t)*A14(t)+dt*be1215(t)*mA15(t)*A15(t)+dt*be1216(t)*mA16(t)*A16(t) )/(1+dt*(mA12(t)+nu));
    BA12(t+1)=( BA12(t)+dt*lamA*A12(t).*BA12(t)/(1+A12(t))+dt*gaA*A12(t).*Bo12(t)/(1+A12(t))+ dt*be127(t)*mA7(t)*BA7(t)+dt*be128(t)*mA8(t)*BA8(t)+dt*be129(t)*mA9(t)*BA9(t)+dt*be1210(t)*mA10(t)*BA10(t)+dt*be1211(t)*mA11(t)*BA11(t)+dt*be1213(t)*mA13(t)*BA13(t)+dt*be1214(t)*mA14(t)*BA14(t)+dt*be1215(t)*mA15(t)*BA15(t)+dt*be1216(t)*mA16(t)*BA16(t) )/(1+dt*(mu+mA12(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo12(t+1)=0;
    else
        Bo12(t+1)=( Bo12(t)+dt*la12(t)*Bo12(t)+(dt*siF*nu)*BF12(t)+(dt*siA*nu)*BA12(t) )/(1+dt*(gaF*F12(t)/(1+F12(t))+gaA*A12(t)/(1+A12(t))+m12(t)+mu));
    end 

    F13(t+1)=( F13(t)+dt*r13(t)*F13(t)+ dt*al137(t)*mF7(t)*F7(t)+dt*al138(t)*mF8(t)*F8(t)+dt*al139(t)*mF9(t)*F9(t)+dt*al1310(t)*mF10(t)*F10(t)+dt*al1311(t)*mF11(t)*F11(t)+dt*al1312(t)*mF12(t)*F12(t)+dt*al1314(t)*mF14(t)*F14(t)+dt*al1315(t)*mF15(t)*F15(t)+dt*al1316(t)*mF16(t)*F16(t) )/(1+dt*(mF13(t)+nu));
    BF13(t+1)=( BF13(t)+dt*lamF*F13(t).*BF13(t)/(1+F13(t))+dt*gaF*F13(t).*Bo13(t)/(1+F13(t))+ dt*al137(t)*mF7(t)*BF7(t)+dt*al138(t)*mF8(t)*BF8(t)+dt*al139(t)*mF9(t)*BF9(t)+dt*al1310(t)*mF10(t)*BF10(t)+dt*al1311(t)*mF11(t)*BF11(t)+dt*al1312(t)*mF12(t)*BF12(t)+dt*al1314(t)*mF14(t)*BF14(t)+dt*al1315(t)*mF15(t)*BF15(t)+dt*al1316(t)*mF16(t)*BF16(t) )/(1+dt*(mu+mF13(t)+nu));
    A13(t+1)=( A13(t)+dt*rho13(t)*A13(t)+ dt*be137(t)*mA7(t)*A7(t)+dt*be138(t)*mA8(t)*A8(t)+dt*be139(t)*mA9(t)*A9(t)+dt*be1310(t)*mA10(t)*A10(t)+dt*be1311(t)*mA11(t)*A11(t)+dt*be1312(t)*mA12(t)*A12(t)+dt*be1314(t)*mA14(t)*A14(t)+dt*be1315(t)*mA15(t)*A15(t)+dt*be1316(t)*mA16(t)*A16(t) )/(1+dt*(mA13(t)+nu));
    BA13(t+1)=( BA13(t)+dt*lamA*A13(t).*BA13(t)/(1+A13(t))+dt*gaA*A13(t).*Bo13(t)/(1+A13(t))+ dt*be137(t)*mA7(t)*BA7(t)+dt*be138(t)*mA8(t)*BA8(t)+dt*be139(t)*mA9(t)*BA9(t)+dt*be1310(t)*mA10(t)*BA10(t)+dt*be1311(t)*mA11(t)*BA11(t)+dt*be1312(t)*mA12(t)*BA12(t)+dt*be1314(t)*mA14(t)*BA14(t)+dt*be1315(t)*mA15(t)*BA15(t)+dt*be1316(t)*mA16(t)*BA16(t) )/(1+dt*(mu+mA13(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)    
        Bo13(t+1)=0;
    else
        Bo13(t+1)=( Bo13(t)+dt*la13(t)*Bo13(t)+(dt*siF*nu)*BF13(t)+(dt*siA*nu)*BA13(t) )/(1+dt*(gaF*F13(t)/(1+F13(t))+gaA*A13(t)/(1+A13(t))+m13(t)+mu));
    end 

    F14(t+1)=( F14(t)+dt*r14(t)*F14(t)+ dt*al1411(t)*mF11(t)*F11(t)+dt*al1412(t)*mF12(t)*F12(t)+dt*al1413(t)*mF13(t)*F13(t)+dt*al1415(t)*mF15(t)*F15(t)+dt*al1416(t)*mF16(t)*F16(t)+dt*al1417(t)*mF17(t)*F17(t)+dt*al1418(t)*mF18(t)*F18(t)+dt*al1419(t)*mF19(t)*F19(t)+dt*al1420(t)*mF20(t)*F20(t) )/(1+dt*(mF14(t)+nu));
    BF14(t+1)=( BF14(t)+dt*lamF*F14(t).*BF14(t)/(1+F14(t))+dt*gaF*F14(t).*Bo14(t)/(1+F14(t))+ dt*al1411(t)*mF11(t)*BF11(t)+dt*al1412(t)*mF12(t)*BF12(t)+dt*al1413(t)*mF13(t)*BF13(t)+dt*al1415(t)*mF15(t)*BF15(t)+dt*al1416(t)*mF16(t)*BF16(t)+dt*al1417(t)*mF17(t)*BF17(t)+dt*al1418(t)*mF18(t)*BF18(t)+dt*al1419(t)*mF19(t)*BF19(t)+dt*al1420(t)*mF20(t)*BF20(t) )/(1+dt*(mu+mF14(t)+nu)); 
    A14(t+1)=( A14(t)+dt*rho14(t)*A14(t)+ dt*be1411(t)*mA11(t)*A11(t)+dt*be1412(t)*mA12(t)*A12(t)+dt*be1413(t)*mA13(t)*A13(t)+dt*be1415(t)*mA15(t)*A15(t)+dt*be1416(t)*mA16(t)*A16(t)+dt*be1417(t)*mA17(t)*A17(t)+dt*be1418(t)*mA18(t)*A18(t)+dt*be1419(t)*mA19(t)*A19(t)+dt*be1420(t)*mA20(t)*A20(t) )/(1+dt*(mA14(t)+nu));
    BA14(t+1)=( BA14(t)+dt*lamA*A14(t).*BA14(t)/(1+A14(t))+dt*gaA*A14(t).*Bo14(t)/(1+A14(t))+ dt*be1411(t)*mA11(t)*BA11(t)+dt*be1412(t)*mA12(t)*BA12(t)+dt*be1413(t)*mA13(t)*BA13(t)+dt*be1415(t)*mA15(t)*BA15(t)+dt*be1416(t)*mA16(t)*BA16(t)+dt*be1417(t)*mA17(t)*BA17(t)+dt*be1418(t)*mA18(t)*BA18(t)+dt*be1419(t)*mA19(t)*BA19(t)+dt*be1420(t)*mA20(t)*BA20(t) )/(1+dt*(mu+mA14(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo14(t+1)=0;
    else
        Bo14(t+1)=( Bo14(t)+dt*la14(t)*Bo14(t)+(dt*siF*nu)*BF14(t)+(dt*siA*nu)*BA14(t) +dt*p141(t)*m1(t)*Bo1(t)+dt*p142(t)*m2(t)*Bo2(t)+dt*p143(t)*m3(t)*Bo3(t)+dt*p144(t)*m4(t)*Bo4(t)+dt*p145(t)*m5(t)*Bo5(t)+dt*p146(t)*m6(t)*Bo6(t)+dt*p147(t)*m7(t)*Bo7(t)+dt*p148(t)*m8(t)*Bo8(t)+dt*p149(t)*m9(t)*Bo9(t)+dt*p1410(t)*m10(t)*Bo10(t)+dt*p1411(t)*m11(t)*Bo11(t)+dt*p1412(t)*m12(t)*Bo12(t)+dt*p1413(t)*m13(t)*Bo13(t) )/(1+dt*(gaF*F14(t)/(1+F14(t))+gaA*A14(t)/(1+A14(t))+m14(t)+mu));
    end 

    F15(t+1)=( F15(t)+dt*r15(t)*F15(t)+ dt*al1511(t)*mF11(t)*F11(t)+dt*al1512(t)*mF12(t)*F12(t)+dt*al1513(t)*mF13(t)*F13(t)+dt*al1514(t)*mF14(t)*F14(t)+dt*al1516(t)*mF16(t)*F16(t)+dt*al1517(t)*mF17(t)*F17(t)+dt*al1518(t)*mF18(t)*F18(t)+dt*al1519(t)*mF19(t)*F19(t)+dt*al1520(t)*mF20(t)*F20(t) )/(1+dt*(mF15(t)+nu));
    BF15(t+1)=( BF15(t)+dt*lamF*F15(t).*BF15(t)/(1+F15(t))+dt*gaF*F15(t).*Bo15(t)/(1+F15(t))+ dt*al1511(t)*mF11(t)*BF11(t)+dt*al1512(t)*mF12(t)*BF12(t)+dt*al1513(t)*mF13(t)*BF13(t)+dt*al1514(t)*mF14(t)*BF14(t)+dt*al1516(t)*mF16(t)*BF16(t)+dt*al1517(t)*mF17(t)*BF17(t)+dt*al1518(t)*mF18(t)*BF18(t)+dt*al1519(t)*mF19(t)*BF19(t)+dt*al1520(t)*mF20(t)*BF20(t) )/(1+dt*(mu+mF15(t)+nu));
    A15(t+1)=( A15(t)+dt*rho15(t)*A15(t)+ dt*be1511(t)*mA11(t)*A11(t)+dt*be1512(t)*mA12(t)*A12(t)+dt*be1513(t)*mA13(t)*A13(t)+dt*be1514(t)*mA14(t)*A14(t)+dt*be1516(t)*mA16(t)*A16(t)+dt*be1517(t)*mA17(t)*A17(t)+dt*be1518(t)*mA18(t)*A18(t)+dt*be1519(t)*mA19(t)*A19(t)+dt*be1520(t)*mA20(t)*A20(t) )/(1+dt*(mA15(t)+nu));
    BA15(t+1)=( BA15(t)+dt*lamA*A15(t).*BA15(t)/(1+A15(t))+dt*gaA*A15(t).*Bo15(t)/(1+A15(t))+ dt*be1511(t)*mA11(t)*BA11(t)+dt*be1512(t)*mA12(t)*BA12(t)+dt*be1513(t)*mA13(t)*BA13(t)+dt*be1514(t)*mA14(t)*BA14(t)+dt*be1516(t)*mA16(t)*BA16(t)+dt*be1517(t)*mA17(t)*BA17(t)+dt*be1518(t)*mA18(t)*BA18(t)+dt*be1519(t)*mA19(t)*BA19(t)+dt*be1520(t)*mA20(t)*BA20(t) )/(1+dt*(mu+mA15(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo15(t+1)=0;
     else
        Bo15(t+1)=( Bo15(t)+dt*la15(t)*Bo15(t)+(dt*siF*nu)*BF15(t)+(dt*siA*nu)*BA15(t) +dt*p151(t)*m1(t)*Bo1(t)+dt*p152(t)*m2(t)*Bo2(t)+dt*p153(t)*m3(t)*Bo3(t)+dt*p154(t)*m4(t)*Bo4(t)+dt*p155(t)*m5(t)*Bo5(t)+dt*p156(t)*m6(t)*Bo6(t)+dt*p157(t)*m7(t)*Bo7(t)+dt*p158(t)*m8(t)*Bo8(t)+dt*p159(t)*m9(t)*Bo9(t)+dt*p1510(t)*m10(t)*Bo10(t)+dt*p1511(t)*m11(t)*Bo11(t)+dt*p1512(t)*m12(t)*Bo12(t)+dt*p1513(t)*m13(t)*Bo13(t) )/(1+dt*(gaF*F15(t)/(1+F15(t))+gaA*A15(t)/(1+A15(t))+m15(t)+mu));
    end 

    F16(t+1)=( F16(t)+dt*r16(t)*F16(t)+ dt*al1611(t)*mF11(t)*F11(t)+dt*al1612(t)*mF12(t)*F12(t)+dt*al1613(t)*mF13(t)*F13(t)+dt*al1614(t)*mF14(t)*F14(t)+dt*al1615(t)*mF15(t)*F15(t)+dt*al1617(t)*mF17(t)*F17(t)+dt*al1618(t)*mF18(t)*F18(t)+dt*al1619(t)*mF19(t)*F19(t)+dt*al1620(t)*mF20(t)*F20(t) )/(1+dt*(mF16(t)+nu));
    BF16(t+1)=( BF16(t)+dt*lamF*F16(t).*BF16(t)/(1+F16(t))+dt*gaF*F16(t).*Bo16(t)/(1+F16(t))+ dt*al1611(t)*mF11(t)*BF11(t)+dt*al1612(t)*mF12(t)*BF12(t)+dt*al1613(t)*mF13(t)*BF13(t)+dt*al1614(t)*mF14(t)*BF14(t)+dt*al1615(t)*mF15(t)*BF15(t)+dt*al1617(t)*mF17(t)*BF17(t)+dt*al1618(t)*mF18(t)*BF18(t)+dt*al1619(t)*mF19(t)*BF19(t)+dt*al1620(t)*mF20(t)*BF20(t) )/(1+dt*(mu+mF16(t)+nu));
    A16(t+1)=( A16(t)+dt*rho16(t)*A16(t)+ dt*be1611(t)*mA11(t)*A11(t)+dt*be1612(t)*mA12(t)*A12(t)+dt*be1613(t)*mA13(t)*A13(t)+dt*be1614(t)*mA14(t)*A14(t)+dt*be1615(t)*mA15(t)*A15(t)+dt*be1617(t)*mA17(t)*A17(t)+dt*be1618(t)*mA18(t)*A18(t)+dt*be1619(t)*mA19(t)*A19(t)+dt*be1620(t)*mA20(t)*A20(t) )/(1+dt*(mA16(t)+nu));
    BA16(t+1)=( BA16(t)+dt*lamA*A16(t).*BA16(t)/(1+A16(t))+dt*gaA*A16(t).*Bo16(t)/(1+A16(t))+ dt*be1611(t)*mA11(t)*BA11(t)+dt*be1612(t)*mA12(t)*BA12(t)+dt*be1613(t)*mA13(t)*BA13(t)+dt*be1614(t)*mA14(t)*BA14(t)+dt*be1615(t)*mA15(t)*BA15(t)+dt*be1617(t)*mA17(t)*BA17(t)+dt*be1618(t)*mA18(t)*BA18(t)+dt*be1619(t)*mA19(t)*BA19(t)+dt*be1620(t)*mA20(t)*BA20(t) )/(1+dt*(mu+mA16(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo16(t+1)=0;
     else
        Bo16(t+1)=( Bo16(t)+dt*la16(t)*Bo16(t)+(dt*siF*nu)*BF16(t)+(dt*siA*nu)*BA16(t) +dt*p161(t)*m1(t)*Bo1(t)+dt*p162(t)*m2(t)*Bo2(t)+dt*p163(t)*m3(t)*Bo3(t)+dt*p164(t)*m4(t)*Bo4(t)+dt*p165(t)*m5(t)*Bo5(t)+dt*p166(t)*m6(t)*Bo6(t)+dt*p167(t)*m7(t)*Bo7(t)+dt*p168(t)*m8(t)*Bo8(t)+dt*p169(t)*m9(t)*Bo9(t)+dt*p1610(t)*m10(t)*Bo10(t)+dt*p1611(t)*m11(t)*Bo11(t)+dt*p1612(t)*m12(t)*Bo12(t)+dt*p1613(t)*m13(t)*Bo13(t) )/(1+dt*(gaF*F16(t)/(1+F16(t))+gaA*A16(t)/(1+A16(t))+m16(t)+mu));
    end 

    F17(t+1)=( F17(t)+dt*r17(t)*F17(t)+ dt*al1714(t)*mF14(t)*F14(t)+dt*al1715(t)*mF15(t)*F15(t)+dt*al1716(t)*mF16(t)*F16(t)+dt*al1718(t)*mF18(t)*F18(t)+dt*al1719(t)*mF19(t)*F19(t)+dt*al1720(t)*mF20(t)*F20(t)+dt*al1721(t)*mF21(t)*F21(t)+dt*al1722(t)*mF22(t)*F22(t)+dt*al1723(t)*mF23(t)*F23(t)+dt*al1724(t)*mF24(t)*F24(t)+dt*al1725(t)*mF25(t)*F25(t) )/(1+dt*(mF17(t)+nu));
    BF17(t+1)=( BF17(t)+dt*lamF*F17(t).*BF17(t)/(1+F17(t))+dt*gaF*F17(t).*Bo17(t)/(1+F17(t))+ dt*al1714(t)*mF14(t)*BF14(t)+dt*al1715(t)*mF15(t)*BF15(t)+dt*al1716(t)*mF16(t)*BF16(t)+dt*al1718(t)*mF18(t)*BF18(t)+dt*al1719(t)*mF19(t)*BF19(t)+dt*al1720(t)*mF20(t)*BF20(t)+dt*al1721(t)*mF21(t)*BF21(t)+dt*al1722(t)*mF22(t)*BF22(t)+dt*al1723(t)*mF23(t)*BF23(t)+dt*al1724(t)*mF24(t)*BF24(t)+dt*al1725(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF17(t)+nu));
    A17(t+1)=( A17(t)+dt*rho17(t)*A17(t)+ dt*be1714(t)*mA14(t)*A14(t)+dt*be1715(t)*mA15(t)*A15(t)+dt*be1716(t)*mA16(t)*A16(t)+dt*be1718(t)*mA18(t)*A18(t)+dt*be1719(t)*mA19(t)*A19(t)+dt*be1720(t)*mA20(t)*A20(t)+dt*be1721(t)*mA21(t)*A21(t)+dt*be1722(t)*mA22(t)*A22(t)+dt*be1723(t)*mA23(t)*A23(t)+dt*be1724(t)*mA24(t)*A24(t)+dt*be1725(t)*mA25(t)*A25(t) )/(1+dt*(mA17(t)+nu));
    BA17(t+1)=( BA17(t)+dt*lamA*A17(t).*BA17(t)/(1+A17(t))+dt*gaA*A17(t).*Bo17(t)/(1+A17(t))+  dt*be1714(t)*mA14(t)*BA14(t)+dt*be1715(t)*mA15(t)*BA15(t)+dt*be1716(t)*mA16(t)*BA16(t)+dt*be1718(t)*mA18(t)*BA18(t)+dt*be1719(t)*mA19(t)*BA19(t)+dt*be1720(t)*mA20(t)*BA20(t)+dt*be1721(t)*mA21(t)*BA21(t)+dt*be1722(t)*mA22(t)*BA22(t)+dt*be1723(t)*mA23(t)*BA23(t)+dt*be1724(t)*mA24(t)*BA24(t)+dt*be1725(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA17(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo17(t+1)=0;
     else
        Bo17(t+1)=( Bo17(t)+dt*la17(t)*Bo17(t)+(dt*siF*nu)*BF17(t)+(dt*siA*nu)*BA17(t) )/(1+dt*(gaF*F17(t)/(1+F17(t))+gaA*A17(t)/(1+A17(t))+m17(t)+mu));
    end

    F18(t+1)=( F18(t)+dt*r18(t)*F18(t)+ dt*al1814(t)*mF14(t)*F14(t)+dt*al1815(t)*mF15(t)*F15(t)+dt*al1816(t)*mF16(t)*F16(t)+dt*al1817(t)*mF17(t)*F17(t)+dt*al1819(t)*mF19(t)*F19(t)+dt*al1820(t)*mF20(t)*F20(t)+dt*al1821(t)*mF21(t)*F21(t)+dt*al1822(t)*mF22(t)*F22(t)+dt*al1823(t)*mF23(t)*F23(t)+dt*al1824(t)*mF24(t)*F24(t)+dt*al1825(t)*mF25(t)*F25(t) )/(1+dt*(mF18(t)+nu));
    BF18(t+1)=( BF18(t)+dt*lamF*F18(t).*BF18(t)/(1+F18(t))+dt*gaF*F18(t).*Bo18(t)/(1+F18(t))+ dt*al1814(t)*mF14(t)*BF14(t)+dt*al1815(t)*mF15(t)*BF15(t)+dt*al1816(t)*mF16(t)*BF16(t)+dt*al1817(t)*mF17(t)*BF17(t)+dt*al1819(t)*mF19(t)*BF19(t)+dt*al1820(t)*mF20(t)*BF20(t)+dt*al1821(t)*mF21(t)*BF21(t)+dt*al1822(t)*mF22(t)*BF22(t)+dt*al1823(t)*mF23(t)*BF23(t)+dt*al1824(t)*mF24(t)*BF24(t)+dt*al1825(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF18(t)+nu));
    A18(t+1)=( A18(t)+dt*rho18(t)*A18(t)+ dt*be1814(t)*mA14(t)*A14(t)+dt*be1815(t)*mA15(t)*A15(t)+dt*be1816(t)*mA16(t)*A16(t)+dt*be1817(t)*mA17(t)*A17(t)+dt*be1819(t)*mA19(t)*A19(t)+dt*be1820(t)*mA20(t)*A20(t)+dt*be1821(t)*mA21(t)*A21(t)+dt*be1822(t)*mA22(t)*A22(t)+dt*be1823(t)*mA23(t)*A23(t)+dt*be1824(t)*mA24(t)*A24(t)+dt*be1825(t)*mA25(t)*A25(t) )/(1+dt*(mA18(t)+nu));
    BA18(t+1)=( BA18(t)+dt*lamA*A18(t).*BA18(t)/(1+A18(t))+dt*gaA*A18(t).*Bo18(t)/(1+A18(t))+ dt*be1814(t)*mA14(t)*BA14(t)+dt*be1815(t)*mA15(t)*BA15(t)+dt*be1816(t)*mA16(t)*BA16(t)+dt*be1817(t)*mA17(t)*BA17(t)+dt*be1819(t)*mA19(t)*BA19(t)+dt*be1820(t)*mA20(t)*BA20(t)+dt*be1821(t)*mA21(t)*BA21(t)+dt*be1822(t)*mA22(t)*BA22(t)+dt*be1823(t)*mA23(t)*BA23(t)+dt*be1824(t)*mA24(t)*BA24(t)+dt*be1825(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA18(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo18(t+1)=0;
     else
        Bo18(t+1)=( Bo18(t)+dt*la18(t)*Bo18(t)+(dt*siF*nu)*BF18(t)+(dt*siA*nu)*BA18(t) )/(1+dt*(gaF*F18(t)/(1+F18(t))+gaA*A18(t)/(1+A18(t))+m18(t)+mu));
    end 

    F19(t+1)=( F19(t)+dt*r19(t)*F19(t)+ dt*al1914(t)*mF14(t)*F14(t)+dt*al1915(t)*mF15(t)*F15(t)+dt*al1916(t)*mF16(t)*F16(t)+dt*al1917(t)*mF17(t)*F17(t)+dt*al1918(t)*mF18(t)*F18(t)+dt*al1920(t)*mF20(t)*F20(t)+dt*al1921(t)*mF21(t)*F21(t)+dt*al1922(t)*mF22(t)*F22(t)+dt*al1923(t)*mF23(t)*F23(t)+dt*al1924(t)*mF24(t)*F24(t)+dt*al1925(t)*mF25(t)*F25(t) )/(1+dt*(mF19(t)+nu));
    BF19(t+1)=( BF19(t)+dt*lamF*F19(t).*BF19(t)/(1+F19(t))+dt*gaF*F19(t).*Bo19(t)/(1+F19(t))+ dt*al1914(t)*mF14(t)*BF14(t)+dt*al1915(t)*mF15(t)*BF15(t)+dt*al1916(t)*mF16(t)*BF16(t)+dt*al1917(t)*mF17(t)*BF17(t)+dt*al1918(t)*mF18(t)*BF18(t)+dt*al1920(t)*mF20(t)*BF20(t)+dt*al1921(t)*mF21(t)*BF21(t)+dt*al1922(t)*mF22(t)*BF22(t)+dt*al1923(t)*mF23(t)*BF23(t)+dt*al1924(t)*mF24(t)*BF24(t)+dt*al1925(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF19(t)+nu));
    A19(t+1)=( A19(t)+dt*rho19(t)*A19(t)+ dt*be1914(t)*mA14(t)*A14(t)+dt*be1915(t)*mA15(t)*A15(t)+dt*be1916(t)*mA16(t)*A16(t)+dt*be1917(t)*mA17(t)*A17(t)+dt*be1918(t)*mA18(t)*A18(t)+dt*be1920(t)*mA20(t)*A20(t)+dt*be1921(t)*mA21(t)*A21(t)+dt*be1922(t)*mA22(t)*A22(t)+dt*be1923(t)*mA23(t)*A23(t)+dt*be1924(t)*mA24(t)*A24(t)+dt*be1925(t)*mA25(t)*A25(t) )/(1+dt*(mA19(t)+nu));
    BA19(t+1)=( BA19(t)+dt*lamA*A19(t).*BA19(t)/(1+A19(t))+dt*gaA*A19(t).*Bo19(t)/(1+A19(t))+ dt*be1914(t)*mA14(t)*BA14(t)+dt*be1915(t)*mA15(t)*BA15(t)+dt*be1916(t)*mA16(t)*BA16(t)+dt*be1917(t)*mA17(t)*BA17(t)+dt*be1918(t)*mA18(t)*BA18(t)+dt*be1920(t)*mA20(t)*BA20(t)+dt*be1921(t)*mA21(t)*BA21(t)+dt*be1922(t)*mA22(t)*BA22(t)+dt*be1923(t)*mA23(t)*BA23(t)+dt*be1924(t)*mA24(t)*BA24(t)+dt*be1925(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA19(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo19(t+1)=0;
     else
        Bo19(t+1)=( Bo19(t)+dt*la19(t)*Bo19(t)+(dt*siF*nu)*BF19(t)+(dt*siA*nu)*BA19(t) )/(1+dt*(gaF*F19(t)/(1+F19(t))+gaA*A19(t)/(1+A19(t))+m19(t)+mu));
    end 

    F20(t+1)=( F20(t)+dt*r20(t)*F20(t)+ dt*al2014(t)*mF14(t)*F14(t)+dt*al2015(t)*mF15(t)*F15(t)+dt*al2016(t)*mF16(t)*F16(t)+dt*al2017(t)*mF17(t)*F17(t)+dt*al2018(t)*mF18(t)*F18(t)+dt*al2019(t)*mF19(t)*F19(t)+dt*al2021(t)*mF21(t)*F21(t)+dt*al2022(t)*mF22(t)*F22(t)+dt*al2023(t)*mF23(t)*F23(t)+dt*al2024(t)*mF24(t)*F24(t)+dt*al2025(t)*mF25(t)*F25(t) )/(1+dt*(mF20(t)+nu));
    BF20(t+1)=( BF20(t)+dt*lamF*F20(t).*BF20(t)/(1+F20(t))+dt*gaF*F20(t).*Bo20(t)/(1+F20(t))+ dt*al2014(t)*mF14(t)*BF14(t)+dt*al2015(t)*mF15(t)*BF15(t)+dt*al2016(t)*mF16(t)*BF16(t)+dt*al2017(t)*mF17(t)*BF17(t)+dt*al2018(t)*mF18(t)*BF18(t)+dt*al2019(t)*mF19(t)*BF19(t)+dt*al2021(t)*mF21(t)*BF21(t)+dt*al2022(t)*mF22(t)*BF22(t)+dt*al2023(t)*mF23(t)*BF23(t)+dt*al2024(t)*mF24(t)*BF24(t)+dt*al2025(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF20(t)+nu));
    A20(t+1)=( A20(t)+dt*rho20(t)*A20(t)+ dt*be2014(t)*mA14(t)*A14(t)+dt*be2015(t)*mA15(t)*A15(t)+dt*be2016(t)*mA16(t)*A16(t)+dt*be2017(t)*mA17(t)*A17(t)+dt*be2018(t)*mA18(t)*A18(t)+dt*be2019(t)*mA19(t)*A19(t)+dt*be2021(t)*mA21(t)*A21(t)+dt*be2022(t)*mA22(t)*A22(t)+dt*be2023(t)*mA23(t)*A23(t)+dt*be2024(t)*mA24(t)*A24(t)+dt*be2025(t)*mA25(t)*A25(t) )/(1+dt*(mA20(t)+nu));
    BA20(t+1)=( BA20(t)+dt*lamA*A20(t).*BA20(t)/(1+A20(t))+dt*gaA*A20(t).*Bo20(t)/(1+A20(t))+ dt*be2014(t)*mA14(t)*BA14(t)+dt*be2015(t)*mA15(t)*BA15(t)+dt*be2016(t)*mA16(t)*BA16(t)+dt*be2017(t)*mA17(t)*BA17(t)+dt*be2018(t)*mA18(t)*BA18(t)+dt*be2019(t)*mA19(t)*BA19(t)+dt*be2021(t)*mA21(t)*BA21(t)+dt*be2022(t)*mA22(t)*BA22(t)+dt*be2023(t)*mA23(t)*BA23(t)+dt*be2024(t)*mA24(t)*BA24(t)+dt*be2025(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA20(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo20(t+1)=0;
     else
        Bo20(t+1)=( Bo20(t)+dt*la20(t)*Bo20(t)+(dt*siF*nu)*BF20(t)+(dt*siA*nu)*BA20(t) )/(1+dt*(gaF*F20(t)/(1+F20(t))+gaA*A20(t)/(1+A20(t))+m20(t)+mu));
    end
        
    F21(t+1)=( F21(t)+dt*r21(t)*F21(t)+ dt*al2117(t)*mF17(t)*F17(t)+dt*al2118(t)*mF18(t)*F18(t)+dt*al2119(t)*mF19(t)*F19(t)+dt*al2120(t)*mF20(t)*F20(t)+dt*al2122(t)*mF22(t)*F22(t)+dt*al2123(t)*mF23(t)*F23(t)+dt*al2124(t)*mF24(t)*F24(t)+dt*al2125(t)*mF25(t)*F25(t) )/(1+dt*(mF21(t)+nu));
    BF21(t+1)=( BF21(t)+dt*lamF*F21(t).*BF21(t)/(1+F21(t))+dt*gaF*F21(t).*Bo21(t)/(1+F21(t))+ dt*al2117(t)*mF17(t)*BF17(t)+dt*al2118(t)*mF18(t)*BF18(t)+dt*al2119(t)*mF19(t)*BF19(t)+dt*al2120(t)*mF20(t)*BF20(t)+dt*al2122(t)*mF22(t)*BF22(t)+dt*al2123(t)*mF23(t)*BF23(t)+dt*al2124(t)*mF24(t)*BF24(t)+dt*al2125(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF21(t)+nu));
    A21(t+1)=( A21(t)+dt*rho21(t)*A21(t)+ dt*be2117(t)*mA17(t)*A17(t)+dt*be2118(t)*mA18(t)*A18(t)+dt*be2119(t)*mA19(t)*A19(t)+dt*be2120(t)*mA20(t)*A20(t)+dt*be2122(t)*mA22(t)*A22(t)+dt*be2123(t)*mA23(t)*A23(t)+dt*be2124(t)*mA24(t)*A24(t)+dt*be2125(t)*mA25(t)*A25(t) )/(1+dt*(mA21(t)+nu));
    BA21(t+1)=( BA21(t)+dt*lamA*A21(t).*BA21(t)/(1+A21(t))+dt*gaA*A21(t).*Bo21(t)/(1+A21(t))+ dt*be2117(t)*mA17(t)*BA17(t)+dt*be2118(t)*mA18(t)*BA18(t)+dt*be2119(t)*mA19(t)*BA19(t)+dt*be2120(t)*mA20(t)*BA20(t)+dt*be2122(t)*mA22(t)*BA22(t)+dt*be2123(t)*mA23(t)*BA23(t)+dt*be2124(t)*mA24(t)*BA24(t)+dt*be2125(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA21(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo21(t+1)=0;
     else
        Bo21(t+1)=( Bo21(t)+dt*la21(t)*Bo21(t)+(dt*siF*nu)*BF21(t)+(dt*siA*nu)*BA21(t)+ dt*p211(t)*m1(t)*Bo1(t)+dt*p212(t)*m2(t)*Bo2(t)+dt*p213(t)*m3(t)*Bo3(t)+dt*p214(t)*m4(t)*Bo4(t)+dt*p215(t)*m5(t)*Bo5(t)+dt*p216(t)*m6(t)*Bo6(t)+dt*p217(t)*m7(t)*Bo7(t)+dt*p218(t)*m8(t)*Bo8(t)+dt*p219(t)*m9(t)*Bo9(t)+dt*p2110(t)*m10(t)*Bo10(t)+dt*p2111(t)*m11(t)*Bo11(t)+dt*p2112(t)*m12(t)*Bo12(t)+dt*p2113(t)*m13(t)*Bo13(t)+dt*p2114(t)*m14(t)*Bo14(t)+dt*p2115(t)*m15(t)*Bo15(t)+dt*p2116(t)*m16(t)*Bo16(t)+dt*p2117(t)*m17(t)*Bo17(t)+dt*p2118(t)*m18(t)*Bo18(t)+dt*p2119(t)*m19(t)*Bo19(t)+dt*p2120(t)*m20(t)*Bo20(t) )/(1+dt*(gaF*F21(t)/(1+F21(t))+gaA*A21(t)/(1+A21(t))+m21(t)+mu));
    end

    F22(t+1)=( F22(t)+dt*r22(t)*F22(t)+ dt*al2217(t)*mF17(t)*F17(t)+dt*al2218(t)*mF18(t)*F18(t)+dt*al2219(t)*mF19(t)*F19(t)+dt*al2220(t)*mF20(t)*F20(t)+dt*al2221(t)*mF21(t)*F21(t)+dt*al2223(t)*mF23(t)*F23(t)+dt*al2224(t)*mF24(t)*F24(t)+dt*al2225(t)*mF25(t)*F25(t) )/(1+dt*(mF22(t)+nu));
    BF22(t+1)=( BF22(t)+dt*lamF*F22(t).*BF22(t)/(1+F22(t))+dt*gaF*F22(t).*Bo22(t)/(1+F22(t))+ dt*al2217(t)*mF17(t)*BF17(t)+dt*al2218(t)*mF18(t)*BF18(t)+dt*al2219(t)*mF19(t)*BF19(t)+dt*al2220(t)*mF20(t)*BF20(t)+dt*al2221(t)*mF21(t)*BF21(t)+dt*al2223(t)*mF23(t)*BF23(t)+dt*al2224(t)*mF24(t)*BF24(t)+dt*al2225(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF22(t)+nu));
    A22(t+1)=( A22(t)+dt*rho22(t)*A22(t)+ dt*be2217(t)*mA17(t)*A17(t)+dt*be2218(t)*mA18(t)*A18(t)+dt*be2219(t)*mA19(t)*A19(t)+dt*be2220(t)*mA20(t)*A20(t)+dt*be2221(t)*mA21(t)*A21(t)+dt*be2223(t)*mA23(t)*A23(t)+dt*be2224(t)*mA24(t)*A24(t)+dt*be2225(t)*mA25(t)*A25(t) )/(1+dt*(mA22(t)+nu));
    BA22(t+1)=( BA22(t)+dt*lamA*A22(t).*BA22(t)/(1+A22(t))+dt*gaA*A22(t).*Bo22(t)/(1+A22(t))+ dt*be2217(t)*mA17(t)*BA17(t)+dt*be2218(t)*mA18(t)*BA18(t)+dt*be2219(t)*mA19(t)*BA19(t)+dt*be2220(t)*mA20(t)*BA20(t)+dt*be2221(t)*mA21(t)*BA21(t)+dt*be2223(t)*mA23(t)*BA23(t)+dt*be2224(t)*mA24(t)*BA24(t)+dt*be2225(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA22(t)+nu));  
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo22(t+1)=0;
     else
        Bo22(t+1)=( Bo22(t)+dt*la22(t)*Bo22(t)+(dt*siF*nu)*BF22(t)+(dt*siA*nu)*BA22(t)+ dt*p221(t)*m1(t)*Bo1(t)+dt*p222(t)*m2(t)*Bo2(t)+dt*p223(t)*m3(t)*Bo3(t)+dt*p224(t)*m4(t)*Bo4(t)+dt*p225(t)*m5(t)*Bo5(t)+dt*p226(t)*m6(t)*Bo6(t)+dt*p227(t)*m7(t)*Bo7(t)+dt*p228(t)*m8(t)*Bo8(t)+dt*p229(t)*m9(t)*Bo9(t)+dt*p2210(t)*m10(t)*Bo10(t)+dt*p2211(t)*m11(t)*Bo11(t)+dt*p2212(t)*m12(t)*Bo12(t)+dt*p2213(t)*m13(t)*Bo13(t)+dt*p2214(t)*m14(t)*Bo14(t)+dt*p2215(t)*m15(t)*Bo15(t)+dt*p2216(t)*m16(t)*Bo16(t)+dt*p2217(t)*m17(t)*Bo17(t)+dt*p2218(t)*m18(t)*Bo18(t)+dt*p2219(t)*m19(t)*Bo19(t)+dt*p2220(t)*m20(t)*Bo20(t) )/(1+dt*(gaF*F22(t)/(1+F22(t))+gaA*A22(t)/(1+A22(t))+m22(t)+mu));
    end 
    
    F23(t+1)=( F23(t)+dt*r23(t)*F23(t)+ dt*al2317(t)*mF17(t)*F17(t)+dt*al2318(t)*mF18(t)*F18(t)+dt*al2319(t)*mF19(t)*F19(t)+dt*al2320(t)*mF20(t)*F20(t)+dt*al2321(t)*mF21(t)*F21(t)+dt*al2322(t)*mF22(t)*F22(t)+dt*al2324(t)*mF24(t)*F24(t)+dt*al2325(t)*mF25(t)*F25(t) )/(1+dt*(mF23(t)+nu));
    BF23(t+1)=( BF23(t)+dt*lamF*F23(t).*BF23(t)/(1+F23(t))+dt*gaF*F23(t).*Bo23(t)/(1+F23(t))+ dt*al2317(t)*mF17(t)*BF17(t)+dt*al2318(t)*mF18(t)*BF18(t)+dt*al2319(t)*mF19(t)*BF19(t)+dt*al2320(t)*mF20(t)*BF20(t)+dt*al2321(t)*mF21(t)*BF21(t)+dt*al2322(t)*mF22(t)*BF22(t)+dt*al2324(t)*mF24(t)*BF24(t)+dt*al2325(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF23(t)+nu));
    A23(t+1)=( A23(t)+dt*rho23(t)*A23(t)+ dt*be2317(t)*mA17(t)*A17(t)+dt*be2318(t)*mA18(t)*A18(t)+dt*be2319(t)*mA19(t)*A19(t)+dt*be2320(t)*mA20(t)*A20(t)+dt*be2321(t)*mA21(t)*A21(t)+dt*be2322(t)*mA22(t)*A22(t)+dt*be2324(t)*mA24(t)*A24(t)+dt*be2325(t)*mA25(t)*A25(t) )/(1+dt*(mA23(t)+nu));
    BA23(t+1)=( BA23(t)+dt*lamA*A23(t).*BA23(t)/(1+A23(t))+dt*gaA*A23(t).*Bo23(t)/(1+A23(t))+ dt*be2317(t)*mA17(t)*BA17(t)+dt*be2318(t)*mA18(t)*BA18(t)+dt*be2319(t)*mA19(t)*BA19(t)+dt*be2320(t)*mA20(t)*BA20(t)+dt*be2321(t)*mA21(t)*BA21(t)+dt*be2322(t)*mA22(t)*BA22(t)+dt*be2324(t)*mA24(t)*BA24(t)+dt*be2325(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA23(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo23(t+1)=0;
     else
        Bo23(t+1)=( Bo23(t)+dt*la23(t)*Bo23(t)+(dt*siF*nu)*BF23(t)+(dt*siA*nu)*BA23(t)+ dt*p231(t)*m1(t)*Bo1(t)+dt*p232(t)*m2(t)*Bo2(t)+dt*p233(t)*m3(t)*Bo3(t)+dt*p234(t)*m4(t)*Bo4(t)+dt*p235(t)*m5(t)*Bo5(t)+dt*p236(t)*m6(t)*Bo6(t)+dt*p237(t)*m7(t)*Bo7(t)+dt*p238(t)*m8(t)*Bo8(t)+dt*p239(t)*m9(t)*Bo9(t)+dt*p2310(t)*m10(t)*Bo10(t)+dt*p2311(t)*m11(t)*Bo11(t)+dt*p2312(t)*m12(t)*Bo12(t)+dt*p2313(t)*m13(t)*Bo13(t)+dt*p2314(t)*m14(t)*Bo14(t)+dt*p2315(t)*m15(t)*Bo15(t)+dt*p2316(t)*m16(t)*Bo16(t)+dt*p2317(t)*m17(t)*Bo17(t)+dt*p2318(t)*m18(t)*Bo18(t)+dt*p2319(t)*m19(t)*Bo19(t)+dt*p2320(t)*m20(t)*Bo20(t) )/(1+dt*(gaF*F23(t)/(1+F23(t))+gaA*A23(t)/(1+A23(t))+m23(t)+mu));
    end

    F24(t+1)=( F24(t)+dt*r24(t)*F24(t)+ dt*al2417(t)*mF17(t)*F17(t)+dt*al2418(t)*mF18(t)*F18(t)+dt*al2419(t)*mF19(t)*F19(t)+dt*al2420(t)*mF20(t)*F20(t)+dt*al2421(t)*mF21(t)*F21(t)+dt*al2422(t)*mF22(t)*F22(t)+dt*al2423(t)*mF23(t)*F23(t)+dt*al2425(t)*mF25(t)*F25(t) )/(1+dt*(mF24(t)+nu));
    BF24(t+1)=( BF24(t)+dt*lamF*F24(t).*BF24(t)/(1+F24(t))+dt*gaF*F24(t).*Bo24(t)/(1+F24(t))+ dt*al2417(t)*mF17(t)*BF17(t)+dt*al2418(t)*mF18(t)*BF18(t)+dt*al2419(t)*mF19(t)*BF19(t)+dt*al2420(t)*mF20(t)*BF20(t)+dt*al2421(t)*mF21(t)*BF21(t)+dt*al2422(t)*mF22(t)*BF22(t)+dt*al2423(t)*mF23(t)*BF23(t)+dt*al2425(t)*mF25(t)*BF25(t) )/(1+dt*(mu+mF24(t)+nu));
    A24(t+1)=( A24(t)+dt*rho24(t)*A24(t)+ dt*be2417(t)*mA17(t)*A17(t)+dt*be2418(t)*mA18(t)*A18(t)+dt*be2419(t)*mA19(t)*A19(t)+dt*be2420(t)*mA20(t)*A20(t)+dt*be2421(t)*mA21(t)*A21(t)+dt*be2422(t)*mA22(t)*A22(t)+dt*be2423(t)*mA23(t)*A23(t)+dt*be2425(t)*mA25(t)*A25(t) )/(1+dt*(mA24(t)+nu));
    BA24(t+1)=( BA24(t)+dt*lamA*A24(t).*BA24(t)/(1+A24(t))+dt*gaA*A24(t).*Bo24(t)/(1+A24(t))+ dt*be2417(t)*mA17(t)*BA17(t)+dt*be2418(t)*mA18(t)*BA18(t)+dt*be2419(t)*mA19(t)*BA19(t)+dt*be2420(t)*mA20(t)*BA20(t)+dt*be2421(t)*mA21(t)*BA21(t)+dt*be2422(t)*mA22(t)*BA22(t)+dt*be2423(t)*mA23(t)*BA23(t)+dt*be2425(t)*mA25(t)*BA25(t) )/(1+dt*(mu+mA24(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo24(t+1)=0;
     else
        Bo24(t+1)=( Bo24(t)+dt*la24(t)*Bo24(t)+(dt*siF*nu)*BF24(t)+(dt*siA*nu)*BA24(t)+ dt*p241(t)*m1(t)*Bo1(t)+dt*p242(t)*m2(t)*Bo2(t)+dt*p243(t)*m3(t)*Bo3(t)+dt*p244(t)*m4(t)*Bo4(t)+dt*p245(t)*m5(t)*Bo5(t)+dt*p246(t)*m6(t)*Bo6(t)+dt*p247(t)*m7(t)*Bo7(t)+dt*p248(t)*m8(t)*Bo8(t)+dt*p249(t)*m9(t)*Bo9(t)+dt*p2410(t)*m10(t)*Bo10(t)+dt*p2411(t)*m11(t)*Bo11(t)+dt*p2412(t)*m12(t)*Bo12(t)+dt*p2413(t)*m13(t)*Bo13(t)+dt*p2414(t)*m14(t)*Bo14(t)+dt*p2415(t)*m15(t)*Bo15(t)+dt*p2416(t)*m16(t)*Bo16(t)+dt*p2417(t)*m17(t)*Bo17(t)+dt*p2418(t)*m18(t)*Bo18(t)+dt*p2419(t)*m19(t)*Bo19(t)+dt*p2420(t)*m20(t)*Bo20(t) )/(1+dt*(gaF*F24(t)/(1+F24(t))+gaA*A24(t)/(1+A24(t))+m24(t)+mu));
    end
    
    F25(t+1)=( F25(t)+dt*r25(t)*F25(t)+ dt*al2517(t)*mF17(t)*F17(t)+dt*al2518(t)*mF18(t)*F18(t)+dt*al2519(t)*mF19(t)*F19(t)+dt*al2520(t)*mF20(t)*F20(t)+dt*al2521(t)*mF21(t)*F21(t)+dt*al2522(t)*mF22(t)*F22(t)+dt*al2523(t)*mF23(t)*F23(t)+dt*al2524(t)*mF24(t)*F24(t) )/(1+dt*(mF25(t)+nu));
    BF25(t+1)=( BF25(t)+dt*lamF*F25(t).*BF25(t)/(1+F25(t))+dt*gaF*F25(t).*Bo25(t)/(1+F25(t))+ dt*al2517(t)*mF17(t)*BF17(t)+dt*al2518(t)*mF18(t)*BF18(t)+dt*al2519(t)*mF19(t)*BF19(t)+dt*al2520(t)*mF20(t)*BF20(t)+dt*al2521(t)*mF21(t)*BF21(t)+dt*al2522(t)*mF22(t)*BF22(t)+dt*al2523(t)*mF23(t)*BF23(t)+dt*al2524(t)*mF24(t)*BF24(t) )/(1+dt*(mu+mF25(t)+nu));
    A25(t+1)=( A25(t)+dt*rho25(t)*A25(t)+ dt*be2517(t)*mA17(t)*A17(t)+dt*be2518(t)*mA18(t)*A18(t)+dt*be2519(t)*mA19(t)*A19(t)+dt*be2520(t)*mA20(t)*A20(t)+dt*be2521(t)*mA21(t)*A21(t)+dt*be2522(t)*mA22(t)*A22(t)+dt*be2523(t)*mA23(t)*A23(t)+dt*be2524(t)*mA24(t)*A24(t) )/(1+dt*(mA25(t)+nu));
    BA25(t+1)=( BA25(t)+dt*lamA*A25(t).*BA25(t)/(1+A25(t))+dt*gaA*A25(t).*Bo25(t)/(1+A25(t))+ dt*be2517(t)*mA17(t)*BA17(t)+dt*be2518(t)*mA18(t)*BA18(t)+dt*be2519(t)*mA19(t)*BA19(t)+dt*be2520(t)*mA20(t)*BA20(t)+dt*be2521(t)*mA21(t)*BA21(t)+dt*be2522(t)*mA22(t)*BA22(t)+dt*be2523(t)*mA23(t)*BA23(t)+dt*be2524(t)*mA24(t)*BA24(t) )/(1+dt*(mu+mA25(t)+nu));
    if (6<=mod(t,52))&&(mod(t,52)<=9)  
        Bo25(t+1)=0;
     else
        Bo25(t+1)=( Bo25(t)+dt*la25(t)*Bo25(t)+(dt*siF*nu)*BF25(t)+(dt*siA*nu)*BA25(t)+ dt*p251(t)*m1(t)*Bo1(t)+dt*p252(t)*m2(t)*Bo2(t)+dt*p253(t)*m3(t)*Bo3(t)+dt*p254(t)*m4(t)*Bo4(t)+dt*p255(t)*m5(t)*Bo5(t)+dt*p256(t)*m6(t)*Bo6(t)+dt*p257(t)*m7(t)*Bo7(t)+dt*p258(t)*m8(t)*Bo8(t)+dt*p259(t)*m9(t)*Bo9(t)+dt*p2510(t)*m10(t)*Bo10(t)+dt*p2511(t)*m11(t)*Bo11(t)+dt*p2512(t)*m12(t)*Bo12(t)+dt*p2513(t)*m13(t)*Bo13(t)+dt*p2514(t)*m14(t)*Bo14(t)+dt*p2515(t)*m15(t)*Bo15(t)+dt*p2516(t)*m16(t)*Bo16(t)+dt*p2517(t)*m17(t)*Bo17(t)+dt*p2518(t)*m18(t)*Bo18(t)+dt*p2519(t)*m19(t)*Bo19(t)+dt*p2520(t)*m20(t)*Bo20(t) )/(1+dt*(gaF*F25(t)/(1+F25(t))+gaA*A25(t)/(1+A25(t))+m25(t)+mu));
    end
    
end

t = 1:nt+1;
% Downstream MU abundance 
Bo(t)=Bo21(t)+Bo22(t)+Bo23(t)+Bo24(t)+Bo25(t)  ;   

% 
t = 0:nt;
figure
plot(t,Bo,'g','LineWidth',2);
xlabel('time (weeks)'); ylabel('Concentration')
axis([0 nt 0 0.000001]);



