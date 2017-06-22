function [ accuracy ] = load_results_cassava (leaf_type, model_name, nRuns)

nModels=length(model_name);
for i = 1:nModels
    model = model_name{i};
    d = load(['Resources/' leaf_type '/results/results_files/results_' model '.txt']);
    accuracy(:,i) = d(1:nRuns);
end

end