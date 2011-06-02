function [h_effic] = huffman_efficiency
for y=1:3
    
    N=y*2;
    [prob] = peiramatikh_1C(N);
    levels = 2^N;
    entrop = 0;
    
    for w = 1: levels
        if prob(w)>0
            entrop = entrop - prob(w)*log2(prob(w));
        end
    end
    
    p = prob;
    
    % Huffman
    [code,len]=huffman(p); 
    
    % meso mhkos Huffman.
    L = 0; 
    
    for i = 1 : levels;
        L = L + len(i)*p(i);
    end
    
    % apodotikothta Huffman
    h_effic(y) = entrop/L;
end
end