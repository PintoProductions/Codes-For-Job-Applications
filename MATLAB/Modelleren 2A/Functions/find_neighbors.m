function v = find_neighbors( A, x )
%Returns a list of neighbors (numbers). Input number of location.
if sum(size(x)) == 2;
    [h, w] = find_loc(A, x);
else
    h = x(1);
    w = x(2);
end
v = [];
for i = [h-1,h,h+1];
    for j = [w-1,w,w+1];
        if i>=1 && i<=size(A,1) && j>=1 && j<=size(A,2) && ((i~=h)||(j~=w));
            if A(i,j)>0;
                v = [v, A(i,j)];
            end
        end
    end
end
end