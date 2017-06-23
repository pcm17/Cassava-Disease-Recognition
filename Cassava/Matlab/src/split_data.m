function [tr_x,tr_y,test_x,test_y] = split_data( Data, test_perc )
    numImages = size(Data,1);
    numFeats = size(Data,2) - 1;
    validation_perc = 0.1;
    
    validation_num = round(numImages*validation_perc);
    test_num = round(numImages*test_perc);
    
    validation_data = Data(1:validation_num,:); %%% Never used. But need to have it to make datasets the same size as is used in TF
    test_data = Data(validation_num+1:(test_num+validation_num),:);
    tr_data = Data((test_num+validation_num+1):numImages,:);

    tr_x = tr_data(:,1:numFeats);
    tr_y = tr_data(:,numFeats+1);

    test_x = test_data(:,1:numFeats);
    test_y = test_data(:,numFeats+1);
end