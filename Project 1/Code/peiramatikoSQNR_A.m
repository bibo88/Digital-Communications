function [sqnr] = peiramatikoSQNR_A
[x] = Source_A; 
min_value = 0;
max_value = 4;
for i=1:3
    N=2*i;
    
    % uniform quantizer
    [xq,centers] = my_quantizer(x,N,min_value,max_value); 
    
    % Signal and noise power
    Pnoise(i) = mean((x-xq').^2);
    Psignal(i) = mean (x.^2);
    
    %SQNR
    sqnr(i) = 10*log10(Psignal(i) / Pnoise(i));   
end
end