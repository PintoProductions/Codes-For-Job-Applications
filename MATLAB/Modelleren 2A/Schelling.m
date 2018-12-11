%Constants
height_board = 8;
width_board = 8;
amount_type = [20, 20];
happiness = 1/3;
change = 0;
deathspots = [];
distance = 'norminf';
search = 'closest';
animation = 'on';
animation_speed = 1000;
%(integer, integer, array of integers, fraction between 0 and 1 (array/number),
% fraction between 0 and 1, (array of coordinates)/circle, norm1/norm2/norminf,
% closest/random, on/off/end, positive number)






%Program
addpath('Functions')
t1 = datetime('now','Format','dd HH:mm:ss.SSS');
A = initialize_board(height_board, width_board, amount_type, deathspots);
type = assign_types(amount_type);

if strcmp(distance,'norm1');
    distance = @norm1;
elseif strcmp(distance,'norm2');
    distance = @norm2;
elseif strcmp(distance,'norminf')
    distance = @norminf;
end

if strcmp(search,'closest');
    search = @find_better_loc;
elseif strcmp(search,'random');
    search = @find_better_loc_rand;
end

if strcmp(animation,'on') || strcmp(animation,'end');
    c = [1,1,1];
    if size(deathspots,2) ~= 0;
        c = [0,0,0;c];
    end
    if size(amount_type,2) > 0;
        c = [c;1,0,0];
    end
    if size(amount_type,2) > 1;
        c = [c;0,0,1];
    end
    if size(amount_type,2) > 2;
        c = [c;0,1,0];
    end
    if size(amount_type,2) > 3;
        c = [c;1,1,0];
    end
    if size(amount_type,2) > 4;
        c = [c;1,0,1];
    end
    if size(amount_type,2) > 5;
        c = [c;0,1,1];
    end
   if (size(amount_type,2)-5) > 0;
        d = lines((size(amount_type,2)-3));
        d((size(amount_type,2)-3),:) = [];
        d(1,:) = [];
        c = [c; d];
    end
    colormap(c);
    hold on;
    axis equal;
    axis off;
    title 'Project Segregation';
    grid on;
    colorbar('Ticks',{});
    if strcmp(animation,'on')
        B = typematrix(type, A);
        imagesc(B);
        pause(2)
    end
end

siz = size(happiness,2);
if siz > 1;
    ky = cell(1,siz);
    vl = cell(1,siz);
    for i = 1:siz;
        ky{i} = i;
    end
    for i = 1:siz;
        vl{i} = happiness(i);
    end
    happiness = containers.Map(ky,vl);
end
index = 1;
steps = 0;
pronto = 0;
dist = 0;
amount = sum(amount_type);

if strcmp(animation,'on');
    while true;
        if ~is_happy(A, type, index, happiness);
            happiness_now = current_happiness(A, type, index);
            [l1,l2] = search(A, type, index, happiness_now, distance);
            if l1 ~=0 && l2~=0;
                [A, d] = move_to(A, index, l1, l2, distance);
                B = typematrix(type, A);
                imagesc(B);
                pause(1/animation_speed)
                dist = dist + d;
                steps = steps + 1;
                pronto = 0;
            else
                if rand < change;
                    type(index) = randi(size(amount_type,2));
                else
                    pronto = pronto + 1;
                end
            end
        else
            pronto = pronto + 1;
        end
        index = mod(index ,amount) + 1;
        if pronto == amount;
            break
        end
    end
    B = typematrix(type, A);
    imagesc(B);
elseif strcmp(animation,'off') || strcmp(animation,'end');
     while true;
        if ~is_happy(A, type, index, happiness);
            happiness_now = current_happiness(A, type, index);
            [l1,l2] = search(A, type, index, happiness_now, distance);
            if l1 ~=0 && l2~=0;
                [A, d] = move_to(A, index, l1, l2, distance);
                dist = dist + d;
                steps = steps + 1;
                pronto = 0;
            else
                if rand < change;
                    type(index) = randi(size(amount_type,2));
                else
                    pronto = pronto + 1;
                end
            end
        else
            pronto = pronto + 1;
        end
        index = mod(index ,amount) + 1;
        if pronto == amount;
            break
        end
     end
end

if strcmp(animation,'end');
    B = typematrix(type, A);
    imagesc(B);
end

t2 = datetime('now','Format','dd:HH:mm:ss.SSS');
s1 = second(t1)+60*minute(t1)+3600*hour(t1)+86400*day(t1);
s2 = second(t2)+60*minute(t2)+3600*hour(t2)+86400*day(t2);
t = s2 - s1;
h = floor(t / 3600);
m = floor((t - h * 3600) / 60);
s = t - h * 3600 - m * 60;
d = ['Scenario completed after ',num2str(h),' hours, ', ...
    num2str(m),' minutes and ',num2str(s),' seconds in ', ...
    num2str(steps),' steps.'];
e = ['Distance travelled: ',num2str(dist),'.'];
disp(d);
disp(e);

%#ok<*RHSFN>
%#ok<*NBRAK>