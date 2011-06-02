%Erwthma 3o
function Results_3()

SNR= [0:2:16];

% 2-PSK kampili
[BER1] = PSK_System(1,2)
figure(1);
semilogy(SNR, BER1,'gs-','LineWidth',2,'MarkerSize',8)
%diagramm's title
title('BER-dB : 2-PSK, 4-PSK, 2-FSK, 4-FSK');

% 4-PSK kampili
[BER2] = PSK_System(1,4)
hold on;
semilogy(SNR, BER2,'cd-','LineWidth',2,'MarkerSize',8)

% 2-FSK kampili
[BER3] = FSK_System(2)
hold on;
semilogy(SNR, BER3,'ko-','LineWidth',2,'MarkerSize',8)

% 4-FSK kampili
[BER4] = FSK_System(4)
hold on;
semilogy(SNR, BER4,'bx-','LineWidth',2,'MarkerSize',8)

 
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend('2-PSK', '4-PSK','2-FSK', '4-FSK');

end
