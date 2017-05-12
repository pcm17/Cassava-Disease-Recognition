function [] = plot_results (model_name,leaf_type,nSplits,accuracy,sz,color_shape,lgd,lgd_title)

    nModels = length(model_name);
    x_axis=linspace(1,nModels,nModels);

    % Actually plot some stuff
    for i = 1:nSplits
        scatter(x_axis,accuracy(i,:),sz,color_shape{i},'filled');
        plot_lgd = lgd;
        title(plot_lgd,lgd_title)
        hold on
    end
    grid on
    

    % Define some plotting parameters
    x_lims = linspace(1,nModels,nModels);
    xticks(x_lims);
    xticklabels(model_name);
    xlim([0,nModels+1]);
    ylim([70,95]);
    xlabel('Model');
    ylabel('Classification Accuracy');
    title(['Cassava Disease Recognition']);

end