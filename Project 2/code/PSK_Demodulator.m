% received_signal coming from AWGN channel
function [vector_r] = PSK_Demodulator(received_signal)

%--------Initialization------------------------

%time-period-frequency
T_sample = 1;
T_c = 4;
T_s = 40;
f_c = 1/T_c;
t = [0 : T_sample : T_s*T_sample-1];
%normalized energy
E_s = 1;
%basic pulse
g_T = sqrt(2*E_s/T_s);

%-----------------------------------------------


% received singal * basic pulse
r_t = g_T .* received_signal;
% multiply with basic fuctions
r(:,1) = r_t(:,1) .* cos(2*pi*f_c.*t');
r(:,2) = r_t(:,1) .* sin(2*pi*f_c.*t');

% final vector
vector_r(1) = 0;
vector_r(2) = 0;
for k = 1 : T_s
    vector_r(1) = vector_r(1) + r(k,1);
    vector_r(2) = vector_r(2) + r(k,2);
end

end
