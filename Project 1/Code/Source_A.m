function [x] = Source_A
% Source's A output signal
t = (randn(10000,1)+j*randn(10000,1))/sqrt(2);
x = abs(t).^2;
end