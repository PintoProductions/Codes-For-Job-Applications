function v = find_area( A, y, x )
%Returns all neighbours, including empty etc. Input location.
v = [];
for i = [y-1,y,y+1];
    for j = [x-1,x,x+1];
        if i>=1 && i<=size(A,1) && j>=1 && j<=size(A,2) && ((i~=y)||(j~=x));
            if A(i,j) ~= -1;
                v = [v, A(i,j)];
            end
        end
    end
end
end