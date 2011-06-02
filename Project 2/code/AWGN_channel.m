%input signal coming from Modulator
%SNR= [0:2:16]
% M the type of "M"-PSK system
% M = 2 => 2-xSK
% M = 4 => 4-xSK
function [output_signal] = AWGN_channel(input_signal, SNR, M )

%symbol energy normalized
E_s = 1;

if M  == 2
	%2-xSK
    E_b = E_s;
else
	%4-xSK
    E_b = E_s/2;
end

%Gaussian noise
N_0 = E_b / (10^(SNR*0.1));
Noise = normrnd(0,sqrt(N_0/2),40,1) ;

% output singal with Gaussian noise
output_signal(:,1) = input_signal(:,1) + Noise(:,1);
end
