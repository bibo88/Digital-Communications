function [xq,centers] = my_quantizer(x,N,min_value,max_value)

% Limit to dymanic area

for p = 1 : length(x)
    if x(p)>max_value
       x(p)=max_value;
    end
    if x(p)<min_value
       x(p)=min_value;
    end
end

% levels of quantization .
levels = 2^N;
% length of quantization's area
delta = (max_value - min_value) / levels;
% centres of quantization's area
centers(1) = min_value + delta/2;

for i=1:levels-1,
    centers(i+1) = delta + centers(i);
end
for i=1:length(x)
    for p = 1: levels
        if x(i) <= min_value + delta*p
           xq(i)=centers(p); % Final output signal
           break;
        end
    end
end

end
