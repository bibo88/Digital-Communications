function [prob] = theoritikh_1C(N)
min_value = 0;
max_value = 4;
levels = 2^N;
delta = (max_value - min_value) / levels;
prob = zeros(levels,1);
syms z
for i=1:levels-1
    prob(i)=int(exp(-z),z,(i-1)*delta,i*delta);
end
    prob(levels)=int(exp(-z),z,(levels-1)*delta,inf);
end