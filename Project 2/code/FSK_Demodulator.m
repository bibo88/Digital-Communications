% received_signal coming from AWGN channel
% M the type of "M"-FSK system
% M = 2 => 2-FSK
% M = 4 => 4-FSK
function [vector_r] = FSK_Demodulator(received_signal, M )


%--------Initialization------------------------

%time-period-frequency
T_sample = 1;
T_c = 4;
T_s = 40;
f_c = 1/T_c;
t = [0 : T_sample : T_s*T_sample-1];
Df = 1 / T_s; %diafora metaksi geitwniko f
%normalized energy
E_s = 1;
%basic pulse
g_T = sqrt(2*E_s/T_s);

%-----------------------------------------------


pulse = g_T .* received_signal;

%--------------Demodulator-----------------------
temp = 0;
for m = 0 : M -1
    f = f_c + Df*m;
    tmp = (cos(2*pi*f.*t')).*pulse;
    tmp = tmp';
    r2(m+1,:) = tmp(1,:);
end

for i=1:M 
    for j = 1:40
        temp = temp + r2(i,j);
    end
    vector_r(i,1) = temp;
    temp = 0;
end
%-------------------------------------------------
end
