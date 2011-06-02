%symbol coming from fuction Mapper.m
function [mod] = FSK_Modulator(symbol)

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


% symbol frequency
 f = f_c + symbol * Df;
  
% --------Modulator------------------------------
carrier = cos(2*pi*f.*t');
mod = g_T .* carrier;
%-------------------------------------------------
end
