function [pith] = overload_probability
[x] = Source_A;
k = 0;
for i = 1 : length(x)
    % times ektos tis dunamikhs perioxhs
    if (x(i)>4) | (x(i)<0)
        k = k +1;
    end
end
% diairoume me to synoliko plithos
k = k/length(x);

pith=k;
end