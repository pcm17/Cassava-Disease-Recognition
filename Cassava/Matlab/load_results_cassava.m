function [] = load_results_cassava (leaf_type, model_name)

nModels=length(model_name);

nRuns=5;
data = zeros(nRuns,nModels);

for i = 1:nModels
    model = model_name{i};
    d = load(['Resources/' leaf_type '/results/results_files/results_' model '.txt']);
    data(:,i) = d;
end
%%
% Display Results in Plot
x1=linspace(1,nModels,nModels);
x1=repmat(x1,[nRuns,1]);

% Actually plot some stuff
scatter(reshape(x1,[(nRuns*nModels),1]),reshape(data,[(nRuns*nModels),1]),'ko');

% Define some plotting parameters
x_lims = linspace(1,nModels,nModels);
xticks(x_lims);
xticklabels(model_name);
xlim([0,nModels+1]);
ylim([65,95]);
xlabel('Model');
ylabel('Classification Accuracy');
title(['Cassava Disease Recognition with ' leaf_type]);

end