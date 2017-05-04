%% Initialize variables
leaf_type = 'leaflet';
model_name={'svm','knn','discriminant','tree','inception'};
nModels=length(model_name) - 1; % n-1 because last model is inception
nModels=1;
nRuns=3;
kFolds=3;
accuracy = zeros(nRuns,nModels);
test_perc = 0.2;
%% Load bottleneck data
[healthy, disease] = load_data_cassava(leaf_type);
numFeats = size(disease,2)-1;
data = [healthy;disease];
nSamples=size(data,1);
        
%% Run sessions nRuns times and Write results out to file
for n = 1:nModels
    for run = 1:nRuns
        model = model_name{n};
        % Split data into training/test sets
        Data = data(randperm(nSamples),:);
        [tr_x,tr_y,test_x,test_y] = split_data( Data, numFeats, test_perc );
        %% Train Learner
        mdl = fitcecoc(tr_x,tr_y,'Learners',model,'CrossVal','on','KFold',kFolds);
        %% Make Predictions
        accuracy(run,n) = make_predictions (test_x, test_y, mdl, kFolds)
        save_results( accuracy, model, leaf_type );
    end
end

%% Plot results
color_shape = 'ko';
plot_results (nModels,nRuns,model_name,leaf_type,accuracy,color_shape);

%% Ensemble Tree Learner
%mdl = fitcensemble(tr_x,tr_y,'Method','AdaBoostM1','NumLearningCycles',150,'Learners',t,'CrossVal','on','KFold',kFolds);
%% Load results
accuracy = load_results_cassava (leaf_type, model_name, nRuns);
plot_results (nModels,nRuns,model_name(1:nModels),leaf_type,accuracy(1:nModels),color_shape);
