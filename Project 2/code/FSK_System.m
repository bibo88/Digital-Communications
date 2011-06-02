% M the type of "M"-FSK system
% M = 2 => 2-FSK
% M = 4 => 4-FSK
function [BER] = FSK_System(M)

%normalized energy
E_s = 1;

% bits per symbol
if M  == 2
   N = 1;
else
   N = 2;
end

% for SNR = 0, 2, 4, 6, 8, 10, 12, 14, 16 dB.
for SNR = 0:2:16

% total bits between 10000-100000
total_bits = 75000;
total_symbols = total_bits / N;

% create random bits
input_bits = randsrc(1,total_bits,[0,1]);

% bits which transmited (counter)
input_bits_counter = 1;
% bits which received (counter)
output_bits_counter = 1;
for j = 1 : total_symbols
	%group for bits per symbol
    for i = 1 : N
        symbol_bits(1,i) = input_bits(1,input_bits_counter );
        input_bits_counter =  input_bits_counter  + 1;
    end

%------------PSK System-------------------------

    %-------Mapper-------------
    if M == 4
    symbol = Mapper(symbol_bits,1);
    else
        symbol = symbol_bits(1,1);
    end
    input_symbol(j) = symbol;
    %--------------------------
    
    
    %------Modulator-----------
    [transmitted_signal] = FSK_Modulator(symbol);
    %--------------------------

    %------AWGN channel--------
    [received_signal] = AWGN_channel(transmitted_signal, SNR, M);
    %--------------------------
    
    %-------Demodulator--------
    [vector_r] = FSK_Demodulator(received_signal, M);
    %--------------------------
    
    %-------Detector-----------
    [symbol_decision] = FSK_Detector(vector_r, M);
    output_symbol(j) = symbol_decision;
    %--------------------------
    
    %------Demapper------------
    if M == 4
       [bits_decision] = Demapper(symbol_decision, 1);
    else
       bits_decision = symbol_decision;
    end
    %--------------------------
    
    
%------------------------------------------------    
    
   % final output of bits
    for i = 1 : N
        output_bits(1,output_bits_counter) = bits_decision(1,i);
        output_bits_counter = output_bits_counter + 1;
    end
end

    % error bits counter
    error_bits = 0;
    for j = 1 : total_bits
        if input_bits(j) ~= output_bits(j)
            error_bits = error_bits + 1;
        end
    end

    % Bit Error Rate - BER
    BER(SNR/2 +1) = error_bits / total_bits;

end


end
