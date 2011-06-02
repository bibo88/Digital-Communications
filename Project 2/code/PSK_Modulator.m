%symbol coming from fuction Mapper.m
% M the type of "M"-PSK system
% M = 2 => 2-PSK
% M = 4 => 4-PSK
function [mod] = PSK_Modulator(symbol, M)

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

% -------Modulator------------------------------

if M == 2
   % 2-PSK base-fuction
   base(1) = sqrt(E_s)*cos(2*pi*symbol/2);
   base(2) = sqrt(E_s)*sin(2*pi*symbol/2);
else
   % 4-PSK base fuction
   base(1) = sqrt(E_s)*cos(2*pi*symbol/4);
   base(2) = sqrt(E_s)*sin(2*pi*symbol/4);
end




% base-fuction * base-pulse
baseband_signal = zeros(T_s,2);
for i = 1 : T_s
    baseband_signal(i,1) = g_T * base(1);
    baseband_signal(i,2) = g_T * base(2);    
end




% 1st signal.
carrier(:,1) = cos(2*pi*f_c.*t);
% 2nd signal
carrier(:,2) = sin(2*pi*f_c.*t);
% final singal
car = carrier.*baseband_signal;
mod(:,1)=car(:,1) + car(:,2);

%---------------------------------------------------

end
