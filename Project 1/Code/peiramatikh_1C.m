function [prob] = peiramatikh_1C(N)
[x] = Source_A;   
min_value = 0;
max_value = 4;
levels = 2^N;
%uniform quantizer
[xq,centers] = my_quantizer(x,N,min_value,max_value);
prob=zeros(levels,1)
%pithanothta kathe level
for i=1:length(x);
    for k = 1: levels;
                if xq(i)==centers(k);
           prob(k) = prob(k) + 1;
           break;
        end
    end
end    
for t=1:levels
        prob(t) = prob(t)/length(x); 
end
end