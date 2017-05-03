%% Loads images names stored in file.txt and saves all of the bottlneck data into healthy.txt
fid1 = fopen('potato_exp/matlab/healthy.txt','w');
fid = fopen('potato_exp/matlab/file.txt');

health = zeros(7852,2048);
numHealth = size(health,1);
tline = fgetl(fid);
for j = 1:numHealth
    im = load([pwd '/Potato_exp/bottleneck/Healthy/' tline]);
    fprintf(fid1, str, im);
    tline = fgetl(fid);
end
