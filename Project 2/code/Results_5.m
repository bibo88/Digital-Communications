%Erwthma 5o
function Results_5()

SNR= [0:2:16];


%4-PSK Gray.
figure(2);
[BER1] = PSK_System(1,4)
semilogy(SNR, BER1,'rx-','LineWidth',2,'MarkerSize',8)
%diagramm's title
title(' BER-dB 4-PSK with Gray, without Gray, Theoritical');

%4-PSK without Gray.
[BER2] = PSK_System(2,4)
hold on;
semilogy(SNR, BER2,'gs-','LineWidth',2,'MarkerSize',8)

%4-PSK theoritical
BER3 = BER_theoritical
hold on;
semilogy(SNR, BER3,'bd-','LineWidth',2,'MarkerSize',8)
 
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend('4-PSK with Gray', '4-PSK without Gray', '4-PSK theoritical');


end
