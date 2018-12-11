function B = typematrix( type, A )
%Returns a matrix with the types of the corresponding numbers.
B = A;
[h, w] = size(A);
for i = 1:h;
    for j = 1:w;
        B(i,j) = is_type(type, A(i,j));
    end
end
end