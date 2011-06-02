%sunarthseis apo tis opoies tha kanoume thn grafiki parastash
[sqnr_1] = not_uniform_SQNR_B
[sqnr_2] = uniform_SQNR_B

%grafiki parastash gia not_uniform_SQNR_B
plot([2,4,6],sqnr_1,'rs');
hold on

%grafiki parastash gia uniform_SQNR_B
plot([2,4,6],sqnr_2,'gs');
%legends
legend('Not uniform quantizer','Uniform quantizer');
%aksones
xlabel('N level');
ylabel('SQNR(dB)');
%titlos
title('Graphs SQNR Source B');
hold off