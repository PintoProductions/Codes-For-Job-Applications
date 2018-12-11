function b = norminf( x, y )
%Distance/metric is maximum norm.
b = max(abs(y(1)-x(1)),abs(y(2)-x(2)));
end

