%% Loads the image names that are stored in text files and saves all of the bottlnecks in one text files
folder={'cmv','cbsv','rmd','gmd','bls','healthy'};
for a = 1:length(folder)
folder_name = folder{a};
fid1 = fopen(['googledrive/Cassava_leaflet/image_data/' folder_name '.txt'],'w');
fid = fopen(['googledrive/Cassava_leaflet/image_lists/' folder_name '.txt']);

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
fid = fopen(['googledrive/Cassava_leaflet/image_lists/' folder_name '.txt']);


tline = fgetl(fid);
for j = 1:nLines
    im = load([pwd '/googledrive/Cassava_leaflet/bottleneck/' folder_name '/' tline]);
    fprintf(fid1, str, im);
    tline = fgetl(fid);
end
fclose(fid);
fclose(fid1);
a
end

