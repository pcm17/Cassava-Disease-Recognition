function [] = save_results( accuracy, model, leaf_type )
    fname = ['../Resources/' leaf_type '/results/results_files/results_' model '.txt'];
    fid = fopen(string(fname),'a');
    fprintf(fid, '%.2f\n', accuracy*100);
    fclose('all');
end