function [sqnr] = theoritikoSQNR_A
[x] = Source_A; 
min_value = 0;
max_value = 4;
for k=1:3
    
    N=2*k;
    
    % uniform quantizer
    [xq,centers] = my_quantizer(x,N,min_value,max_value); 
    levels = 2^N;
    delta = (max_value - min_value) / levels;
    
    % Compute signal's power
    syms z;
    Psignal(k) = int(z^2*exp(-z),z,0,inf);
    Psignal(k)=double(Psignal(k));
    
    % Compute noise's power
    Pnoise(k) = 0;
    
    for i=1:levels-1
        Pnoise(k) = Pnoise(k) + int((z-centers(i))^2*exp(-z),z,(i-1)*delta,i*delta);
    end
    Pnoise(k) = Pnoise(k) + int((z-centers(levels))^2*exp(-z),z,(levels-1)*delta,inf);
    Pnoise(k) = double(Pnoise(k));
    
    % SQNR
    sqnr(k)= 10*log10(double(Psignal(k)) / double(Pnoise(k))); 
end
end