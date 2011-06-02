function [sqnr] = not_uniform_SQNR_B
 
min_value = -1;
max_value = 1;

[x] = Source_B; 

for d=1:3
    N=2*d;
    
    % not uniform quantizer.
    [xq,centers,p,D] = Lloyd_Max(x,N,min_value, max_value);
    
    %signal and noise power
    Psignal(d) = mean (x.^2);
    Pnoise(d) = mean((x-xq').^2);
    
    %SQNR
    sqnr(d) = 10*log10(Psignal(d) / Pnoise(d));   
end

end