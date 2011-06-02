function [xq,centers,p,D] = Lloyd_Max(x,N,min_value, max_value)

j_max = 100;
e = 10^-5;
levels = 2^N; % levels of quantization .
D = zeros(j_max,1);
T = zeros(levels+1,1);



% centres of uniform's quantization area
delta = (max_value - min_value) / levels; 

centers(1) = min_value + delta/2; 

for i=1:levels-1,
    centers(i+1) = centers(i)+delta; 
end

j = 1;
D_old = 0;
D_new = 1;

while abs(D_new-D_old) > e

   T(1) = min_value;
    for h = 2 : levels
        T(h) = (centers(h-1)+centers(h)) / 2; 
    end
    T(levels+1) = max_value;

shows = zeros(levels,1);
sum = zeros(levels,1);
p = zeros(levels,1);
    for i=1:length(x)
        for l = 2: levels+1
            if x(i) <= T(l)
                xq(i)=centers(l-1); 
                sum(l-1) = sum(l-1) + x(i);
                shows(l-1) = shows(l-1) + 1;
                p(l-1) = p(l-1) + 1;
                break;
            end
        end
        D(j) = D(j) + (x(i) - xq(i))^2; % deformation computation
    end

D(j) = D(j)/length(x); % final deformation
    
  for g=1:levels
      p(g) = p(g)/length(x); % final probabilities
   end

   for w = 1 : levels
      if shows(w) > 0
         centers(w) = sum(w)/shows(w); %new centres
      end
   end
        
D_old = D_new;
D_new = D(j);
j = j + 1;
end 

D = D(1:j-1);
end
