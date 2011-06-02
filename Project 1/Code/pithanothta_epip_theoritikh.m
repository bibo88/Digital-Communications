function [prob] = theoritikh_1C(N)
min_value = 0;
max_value = 4;
epipeda = 2^N;
 delta = (max_value - min_value) / epipeda;
prob = zeros(epipeda,1);
syms z
for i=1:epipeda-1
    prob(i)=int(exp(-z),z,(i-1)*delta,i*delta);
end
    prob(epipeda)=int(exp(-z),z,(epipeda-1)*delta,inf);
end