function processed = groupsum(input, group_length, ladder_height)

input_length = length(input(1,:)) - 1;
x_label = input(:,1);
processed_length = floor(input_length/group_length);


processed = zeros(length(x_label), processed_length + 1);
temp = zeros(length(x_label), 1);

processed(:,1) = x_label;

for i = 1:processed_length
    
    for j = 1:group_length
        temp = temp + input(:, (i-1) * group_length + j + 1);
    end
    
    %if ladder_height > 0
        temp = temp + (i-1)*ladder_height;
    %end
    
    processed(:, i+1) = temp;
    temp = zeros(length(x_label), 1);
    
end

figure;
mesh(((1:processed_length)-0)*(15*group_length),x_label,processed(:,2:processed_length+1));
view(90,90);
colormapeditor
