%vector_r is coming from demodulator_PSK fuction
% M the type of "M"-PSK system
% M = 2 => 2-PSK
% M = 4 => 4-PSK
function [symbol_decision] = PSK_Detector(vector_r,M)

%--------Initialization------------------------

%time-period-frequency
T_sample = 1;
T_c = 4;
T_s = 40;
f_c = 1/T_c;
%normalized energy
E_s = 1;


%-----------------------------------------------

%where is the symbol
for k = 0 : M -1
    symbols(k+1,1) = sqrt(E_s) * cos(2*pi*k/M );
    symbols(k+1,2) = sqrt(E_s) * sin(2*pi*k/M );
end

% symbol distance
for k = 1 : M 
    Dist(k,1) = sqrt( (vector_r(1,1) - symbols(k,1))^2 + (vector_r(1,2) - symbols(k,2))^2);
end

% smallest symbol distance
temp = Dist(1,1);
symbol_decision = 1;
for k = 2 : M 
    if temp > Dist(k,1)
        temp = Dist(k,1);
        symbol_decision = k;
    end
end

%final symbol
symbol_decision = symbol_decision - 1;

end
