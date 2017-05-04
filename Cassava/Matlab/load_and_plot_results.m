leaf_type = 'leaflet';
model_name={'svm','knn','discriminant','tree','inception'};
nModels=length(model_name);
models = model_name(1:nModels);
nRuns = 3;
color_shape = 'ko';
%%%% Load and plot results
accuracy = load_results_cassava (leaf_type, models, nRuns);
accuracies = accuracy(:,1:nModels);
plot_results (nRuns,models,leaf_type,accuracies,color_shape);
