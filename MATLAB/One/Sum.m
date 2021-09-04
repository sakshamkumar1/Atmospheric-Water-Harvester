S = 0;
A = 1:10;
for i = 1:10
    if mod(A(i),3) == 0
        S = S + A(i);
    end    
end
S
