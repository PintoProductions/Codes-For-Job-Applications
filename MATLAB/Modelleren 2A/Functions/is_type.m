function i = is_type( type, n )
%Checks of with type a number is.
if n == 0 || n == -1;
    i = n;
    return;
end
i = type(n);
end