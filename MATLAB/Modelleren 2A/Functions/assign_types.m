function dic = assign_types( type )
%Assigns the same type an amount of numbers in each element.
s = sum(type);
key = cell(1,s);
value = cell(1,s);
r = randperm(s);
for i = 1:s;
    key{i} = i;
end
index = 1;
for i = 1:size(type,2);
    for j = 1:type(i);
        value{r(index)} = i;
        index = index + 1;
    end
end
dic = containers.Map(key,value);
end

