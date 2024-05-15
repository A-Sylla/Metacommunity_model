
% Implementation of the system of equations

function [F,A,BF,BA,Bo] = meta_system(time, dt, F0, A0, b0, n, T, lambda, theta, nu, eta, mu, sF, sA, mF, mA, delta, r, la, rho, alpha, beta, p, sigmaF, sigmaA, gamma, zeta)
    
    %initialization of variables of the model
    F = zeros(n,length(time));   A = zeros(n,length(time));  
    BF = zeros(n,length(time));  BA = zeros(n,length(time));   Bo = zeros(n,length(time)); 
    
    % Initial conditions 
        F(:,1) = F0;
        A(:,1) = A0;
        Bo(:,1) = b0; 

    for t = 1:length(time)-1   %Explicit-implicit method 
            
            % dynamics of fish and macroinvertebrate biomasses
            F(:,t+1) = ( F(:,t) + dt*(r(time(t))*F(:,t) + alpha*(mF.*F(:,t))) )./( 1+dt*(mF+nu) );
            A(:,t+1) = ( A(:,t) + dt*(rho(time(t))*A(:,t) + beta*(mA.*A(:,t))) )./( 1+dt*(mA+eta) );
            
            % dynamics of fish-associated and macroinvertebrate-associated bacteria
            BF(:,t+1) = ( BF(:,t) + dt*(lambda*F(:,t).*BF(:,t)./(sF+F(:,t)) + gamma*F(:,t).*Bo(:,t)./(1+F(:,t)) + alpha*(mF.*BF(:,t))) )./( 1+dt*(mu+mF+nu) );
            BA(:,t+1) = ( BA(:,t) + dt*(theta*A(:,t).*BA(:,t)./(sA+A(:,t)) + zeta*A(:,t).*Bo(:,t)./(1+A(:,t)) + beta*(mA.*BA(:,t))) )./( 1+dt*(mu+mA+eta) );
            
            % dynamics of free-living bacteria
            if ( T(1)-1 <= mod(time(t),52) )&&( mod(time(t),52) <= T(2)-1 )     % leaching period 
                Bo(:,t+1) = 0;
%             elseif mod(time(t),52)==0                   % the bacterial reservoir nourishes the river at the beginning of each rainy season
%                 Bo(:,t+1) = Bo(:,t) + b0;
            else
                sub_p = squeeze(p(t, :, :));     % Recovery of the submatrix for time t
                Bo(:,t+1) = ( Bo(:,t) + dt*(la(time(t))*Bo(:,t) + sigmaF*nu*BF(:,t) + sigmaA*eta*BA(:,t) + sub_p*delta(time(t))*Bo(:,t)) )./( 1+dt*(gamma*F(:,t)./(1+F(:,t)) + zeta*A(:,t)./(1+A(:,t)) + mu + delta(time(t))) );
            end     
    end
    
end
