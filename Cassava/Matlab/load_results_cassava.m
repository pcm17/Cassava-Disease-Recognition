model_name={'discriminant','inception','svm','knn','tree'};
leaf_size={'Originals','Leaflets'};
leaf_sz=leaf_size{2};
nModels=length(model_name);

nRuns=5;
data = zeros(nRuns,nModels);

for i = 1:nModels
    model = model_name{i};
    d = load(['/users/sneakypt/googledrive/cassava_' leaf_sz '/results/results_' model '.txt']);
    data(:,i) = d;
end
%%
% Display Results in Plot
x1=linspace(1,nModels,nModels);
x1=repmat(x1,[nRuns,1]);

% Actually plot some stuff
scatter(reshape(x1,[(nRuns*nModels),1]),reshape(data,[(nRuns*nModels),1]),'ko');

% Define some plotting parameters
xticks([1 2 3 4 5]);
xticklabels(model_name);
xlim([0,6]);
ylim([65,95]);
xlabel('Model');
ylabel('Classification Accuracy');
title(['Cassava Disease Recognition with ' leaf_sz]);

