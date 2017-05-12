%% Loads the image names that are stored in text files and saves all of the bottlnecks in one text files
folder={'cmv'};
for a = 1:length(folder)
folder_name = folder{a};
fid1 = fopen(['/users/sneakypt/googledrive/Cassava_originals/image_data/' folder_name '.txt'],'w');
fid = fopen(['/users/sneakypt/googledrive/Cassava_originals/image_lists/' folder_name '.txt']);

nLines=0;
str='%.6f';
for i=1:2047
str=strcat(str,' %.6f');
end
str=strcat(str,'\n');

while feof(fid) == 0
    line = fgetl(fid);
    nLines=nLines+1;
end
fclose(fid);
fid = fopen(['/users/sneakypt/googledrive/Cassava_originals/image_lists/' folder_name '.txt']);


tline = fgetl(fid);
for j = 1:nLines
    im = load(['/users/sneakypt//googledrive/Cassava_originals/bottleneck/' folder_name '/' tline]);
    fprintf(fid1, str, im);
    tline = fgetl(fid);
end
fclose(fid);
fclose(fid1);
a
end

