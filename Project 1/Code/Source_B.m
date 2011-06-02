function [x] = Source_B
%  Source's B output signal
load lenna.mat;
x = x_le(:);
x=(x-128)/128;
end