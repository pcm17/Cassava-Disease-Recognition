leaf_type = 'original';
model_name={'SVM','KNN'};
nModels=length(model_name);
models = model_name(1:nModels);
nSplits = 5;
color_shape = 'ko';
%%%% Load and plot results
accuracy = load_results_cassava (leaf_type, models, nSplits);
accuracies = accuracy(:,1:nModels);
figure;
plot_results (nSplits,models,leaf_type,accuracies,color_shape);
leaf_type = 'leaflet';
accuracy = load_results_cassava (leaf_type, models, nSplits);
accuracies = accuracy(:,1:nModels);
hold on
color_shape = 'ro';
plot_results (nSplits,models,leaf_type,accuracies,color_shape);
