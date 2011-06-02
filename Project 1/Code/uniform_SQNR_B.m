function [sqnr] = uniform_SQNR_B
min_value = -1;
max_value = 1;

[x] = Source_B; 

for d=1:3
    N=2*d;
    % uniform quantizer
    [xq,centers] = my_quantizer(x,N,min_value,max_value);
    
    %Signal and noise power
    Psignal(d) = mean (x.^2);
    Pnoise(d) = mean((x-xq').^2);
    
    %SWNR
    sqnr(d) = 10*log10(Psignal(d) / Pnoise(d));   
end

end