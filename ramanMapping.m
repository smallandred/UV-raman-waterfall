function returned_matrix = raman_mapping( input_file )

input_data = dlmread( input_file );
line_count = length(input_data(:,1));

x_list = unique( input_data(:,1) );
y_list = unique( input_data(:,2) );
returned_matrix = zeros(length(x_list), length(y_list));

i = 1;
while i < line_count
   
    current_x_index = find(x_list == input_data(i,1));
    current_y_index = find(y_list == input_data(i,2));
    
    current_data = input_data(i:i+1010, 3:4);
    
    current_data(:,2) = current_data(:,2) - current_data(1011,2);
    
    height_1 = getPeakHeight(current_data, 124, 1);
    height_2 = getPeakHeight(current_data, 217, 1);
    height_ratio = height_1 / height_2;
    
    returned_matrix( current_x_index, current_y_index ) = height_ratio;
    
    i = i + 1011;
    
end

mesh( x_list, y_list, returned_matrix, 'LineStyle','none','EdgeLighting','flat',...
    'FaceLighting','none',...
    'LineStyle','none',...
    'FaceColor','interp',...
    'EdgeColor','interp');
shading interp;
view(90,90);