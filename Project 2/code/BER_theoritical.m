%theoritical BER
function ber_theor = BER_theoritical
for k=0:8
    snr_db = 2*k;
    snr = 10^(snr_db*0.1);
    ber_theor(k+1) = 0.5*erfc(sqrt(snr));
end

end
