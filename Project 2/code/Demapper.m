% Gray choose=1
% other tyoe of coding choose=0
function [bits] = Demapper(symbol, choose)

if choose == 1
    if symbol == 0
        bits = [0 0];
    elseif symbol == 1
        bits = [0 1];
    elseif symbol == 2
        bits = [1 1];
    elseif symbol == 3
        bits = [1 0];
    end

elseif choose == 2
    if symbol == 0
        bits = [0 0];
    elseif symbol == 1
        bits = [0 1];
    elseif symbol == 2
        bits = [1 0];
    elseif symbol == 3
        bits = [1 1];
    end

end
   
end
