function [symbol] = Mapper(bits, choose)
% Gray choose=1
% other tyoe of coding choose=0
if choose == 1    
    if ( bits(1)==0 && bits(2)==0 )
        symbol = 0;
    elseif ( bits(1)==0 && bits(2)==1 )
        symbol = 1;
    elseif ( bits(1)==1 && bits(2)==1 )
        symbol = 2;
    elseif ( bits(1)==1 && bits(2)==0 )
        symbol = 3;
    end
elseif choose == 2
    if ( bits(1)==0 && bits(2)==0)
        symbol = 0;
    elseif ( bits(1)==0 && bits(2)==1 )
        symbol = 1;
    elseif ( bits(1)==1 && bits(2)==0 )
        symbol = 2;
    elseif ( bits(1)==1 && bits(2)==1 )
        symbol = 3;
    end
    
end
    
end
