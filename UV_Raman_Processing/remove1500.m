function processed = remove1500( input_data )

input_data_size = size(input_data);
line_count = input_data_size(1);
column_count = input_data_size(2);

processed = zeros(line_count, column_count);
X = input_data(:,1);

processed(:,1) = X;

for i = 2:column_count
    Y = input_data(:,i);
    
    X_min_cand_1 = find (X>1482 & X<1498);
    [Y_min_1, X_min_index_1_rel] = min(Y(X_min_cand_1));
    X_min_1_index = X_min_cand_1( X_min_index_1_rel );
    X_min_1 = X(X_min_1_index);
    
    X_min_cand_2 = find (X>1520 & X<1532);
    [Y_min_2, X_min_index_2_rel] = min(Y(X_min_cand_2));
    X_min_2_index = X_min_cand_2( X_min_index_2_rel );
    X_min_2 = X(X_min_2_index);
    
    baseline = polyfit([X_min_1, X_min_2], [Y_min_1, Y_min_2], 1);
    X_list =  X(X_min_1_index:X_min_2_index);
    Y_new = polyval( baseline, X_list);
    
    Y(X_min_1_index:X_min_2_index) = Y_new;
    
    processed(:,i) = Y;
    
end
