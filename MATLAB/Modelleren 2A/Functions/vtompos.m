function [ h, w ] = vtompos( height, width, n )
%Find the position in a matrix as counted from left to right up-down.
h = floor((n - 1)/width)+1;
w = mod((n - 1),width)+1;
if h > height;
    h = NaN;
    w = NaN;
end
end