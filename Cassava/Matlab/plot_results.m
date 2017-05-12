function [] = plot_results (nSplits,model_name,leaf_type,accuracy,color_shape)

    nModels = length(model_name);
    x1=linspace(1,nModels,nModels);
    x1=repmat(x1,[nSplits,1]);
    x1=reshape(x1,[nSplits*nModels,1]);
    % Actually plot some stuff
    scatter(x1,reshape(accuracy,[(nSplits*nModels),1]),color_shape);

    % Define some plotting parameters
    x_lims = linspace(1,nModels,nModels);
    xticks(x_lims);
    xticklabels(model_name);
    xlim([0,nModels+1]);
    ylim([70,95]);
    xlabel('Model');
    ylabel('Classification Accuracy');
    title(['Cassava Disease Recognition with ' leaf_type]);

end