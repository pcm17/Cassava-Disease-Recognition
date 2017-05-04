function [] = plot_results (nRuns,model_name,leaf_type,accuracy,color_shape)
if size(accuracy,2) == length(model_name)
    nModels = length(model_name);
    x1=linspace(1,nModels,nModels);
    x1=repmat(x1,[nRuns,1]);
    x1=reshape(x1,[nRuns*nModels,1]);
    % Actually plot some stuff
    scatter(x1,reshape(accuracy,[(nRuns*nModels),1]),color_shape);

    % Define some plotting parameters
    x_lims = linspace(1,nModels,nModels);
    xticks(x_lims);
    xticklabels(model_name);
    xlim([0,nModels+1]);
    ylim([65,95]);
    xlabel('Model');
    ylabel('Classification Accuracy');
    title(['Cassava Disease Recognition with ' leaf_type]);
else
    fprintf('Error: Number of models is not equal to number of accuracies\n');
end
end