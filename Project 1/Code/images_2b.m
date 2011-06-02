%stoixeia shmatos eisodou
x = Source_B; 
max_value = 1;
min_value = -1;

for f=1:3
    N=2*f;
    %uniform quantizer
    [xq,centers] = my_quantizer(x,N,min_value,max_value);
    %image
    xq2 = reshape(128*xq +128,256,256);
    figure(f);
    imshow(uint8(xq2));
    
    %not uniform quantizer    
    [xq,centers,p,D] = Lloyd_Max(x,N,min_value, max_value);
    %image
    xq3 = reshape(128*xq +128,256,256);
    figure(f+3); %f+3 gia na vgoun me swsth seira
    imshow(uint8(xq3));
end
