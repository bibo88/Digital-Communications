%vector_r is coming from demodulator_FSK fuction
% M the type of "M"-FSK system
% M = 2 => 2-FSK
% M = 4 => 4-FSK
function [symbol_decision] = FSK_Detector(vector_r, M)

% smallest symbol distance
temp = vector_r(1,1);
count = 0;
for i = 2 : M
    if temp < vector_r(i,1)
        temp = vector_r(i,1);
        count = i - 1;
    end
end
%final symbol
symbol_decision = count;

end
