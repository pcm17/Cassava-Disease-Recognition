function [] = save_results( accuracy )
    fname = 'GoogleDrive/Cassava_leaflet/matlab/results_';
    fname = strcat(fname,model_name{n});
    fname = strcat(fname,'.txt');
    fid = fopen(string(fname),'a');
    fprintf(fid, '%.2f\n', accuracy*100);
    fclose('all');
end