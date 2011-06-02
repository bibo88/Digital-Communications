function [effec] = effeciency
for j=1:3
    
    N=j*2;
    % Edw mporoume na baloume kai thn sunarthsh theoritikh_1C
    [prob] = peiramatikh_1C(N);
    levels = 2^N;
    entrop = 0;
    
    for w = 1: levels
        if prob(w)>0
            entrop = entrop - prob(w)*log2(prob(w));
        end
    end
    
    effec(j) = entrop/N;
end
end