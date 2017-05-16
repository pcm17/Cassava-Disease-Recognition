function [tr_x,tr_y,test_x,test_y] = split_data( Data, test_perc )
    numImages = size(Data,1);
    numFeats = size(Data,2) - 1;
    test_num = round(numImages*test_perc);
    
    test_data = Data(1:test_num,:);
    tr_data = Data(test_num+1:numImages,:);

    tr_x = tr_data(:,1:numFeats);
    tr_y = tr_data(:,numFeats+1);

    test_x = test_data(:,1:numFeats);
    test_y = test_data(:,numFeats+1);
end