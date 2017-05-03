%% Load Healthy Data
healthy = importdata('potato_exp/matlab/healthy.txt');
numIms = size(healthy,1);
if size(healthy,2) == 2048
    healthy = [healthy zeros(numIms,1)];
end
%% Load all diseased data
a7_15_16 = importdata('potato_exp/matlab/bottleneck_data/7_15_16.txt');
fclose('all');
a7_18_16 = importdata('potato_exp/matlab/bottleneck_data/7_18_16.txt');
fclose('all');
a7_19_16 = importdata('potato_exp/matlab/bottleneck_data/7_19_16.txt');
fclose('all');
a7_20_16 = importdata('potato_exp/matlab/bottleneck_data/7_20_16.txt');
fclose('all');
a7_23_16 = importdata('potato_exp/matlab/bottleneck_data/7_23_16.txt');
fclose('all');
a7_24_16 = importdata('potato_exp/matlab/bottleneck_data/7_24_16.txt');
fclose('all');
a7_25_16 = importdata('potato_exp/matlab/bottleneck_data/7_25_16.txt');
fclose('all');
a7_26_16 = importdata('potato_exp/matlab/bottleneck_data/7_26_16.txt');
fclose('all');
a7_28_16 = importdata('potato_exp/matlab/bottleneck_data/7_28_16.txt');
fclose('all');
a7_31_16 = importdata('potato_exp/matlab/bottleneck_data/7_31_16.txt');
fclose('all');
a8_1_16 = importdata('potato_exp/matlab/bottleneck_data/8_1_16.txt');
fclose('all');
a8_2_16 = importdata('potato_exp/matlab/bottleneck_data/8_2_16.txt');
fclose('all');
a8_3_16 = importdata('potato_exp/matlab/bottleneck_data/8_3_16.txt');
fclose('all');
a8_4_16 = importdata('potato_exp/matlab/bottleneck_data/8_4_16.txt');
%%
% Store data in cell array
disease_data = cell(14,1);
disease_data{1,1} =  a7_15_16;
disease_data{2,1} =  a7_18_16;
disease_data{3,1} =  a7_19_16;
disease_data{4,1} =  a7_20_16;
disease_data{5,1} =  a7_23_16;
disease_data{6,1} =  a7_24_16;
disease_data{7,1} =  a7_25_16;
disease_data{8,1} =  a7_26_16;
disease_data{9,1} =  a7_28_16;
disease_data{10,1} =  a7_31_16;
disease_data{11,1} =  a8_1_16;
disease_data{12,1} =  a8_2_16;
disease_data{13,1} =  a8_3_16;
disease_data{14,1} =  a8_4_16;

% Store dates
disease_date = cell(14,1);
disease_date{1,1} =  '7_15_16';
disease_date{2,1} =  '7_18_16';
disease_date{3,1} =  '7_19_16';
disease_date{4,1} =  '7_20_16';
disease_date{5,1} =  '7_23_16';
disease_date{6,1} =  '7_24_16';
disease_date{7,1} =  '7_25_16';
disease_date{8,1} =  '7_26_16';
disease_date{9,1} =  '7_28_16';
disease_date{10,1} =  '7_31_16';
disease_date{11,1} =  '8_1_16';
disease_date{12,1} =  '8_2_16';
disease_date{13,1} =  '8_3_16';
disease_date{14,1} =  '8_4_16';