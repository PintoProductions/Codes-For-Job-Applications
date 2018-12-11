function A = initialize_board( height, width, type, deathspots )
%Initialize a board of a certain heigth and width and place a certain
%amount of numbers randomly on the board.
A = zeros(height, width);
n = sum(type);
dim = height*width;
rnd = randperm(dim);
if strcmp(deathspots,'circle');
    deathspots = [];
    b = (height+1)/2;
    a = (width+1)/2;
    r = min(b,a);
    for i = 1:height;
        for j = 1:width;
            if sqrt((i-b)^2+(j-a)^2) >= r;
                A(i,j) = -1;
                deathspots = [deathspots, [i,j]];
            end
        end
    end
end
if sum(size(deathspots)) == 0;
    for i = 1:n;
        [y, x] = vtompos(height, width, rnd(i));
        A(y,x) = i;
    end
elseif sum(size(deathspots)) > 0;
    for i = 1:(size(deathspots,2)/2);
        A(deathspots(2*i-1),deathspots(2*i)) = -1;
    end
    for i = 1:n;
        [y, x] = vtompos(height, width, rnd(i));
        while A(y,x) == -1;
            rnd(i) = [];
            [y, x] = vtompos(height, width, rnd(i));
        end
        A(y,x) = i;
    end
end