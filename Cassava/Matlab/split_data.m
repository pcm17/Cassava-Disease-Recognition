function [tr_x,tr_y,test_x,test_y] = split_data( Data, numFeats, test_perc )
    test_num = round(size(Data,1)*test_perc);
    test_data = Data(1:test_num,:);
    tr_data = Data(test_num+1:size(Data,1),:);

    tr_x = tr_data(:,1:numFeats);
    tr_y = tr_data(:,numFeats+1);

    test_x = test_data(:,1:numFeats);
    test_y = test_data(:,numFeats+1);
end