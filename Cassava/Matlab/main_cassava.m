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
        
%% Run nRuns loops and write results out to file each time
numFeats = size(disease,2)-1;
data = [healthy;disease];
nSamples=size(data,1);

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
plot_results (nRuns,model_name,leaf_type,accuracy,color_shape);

%% Extra stuff
%%% Ensemble Tree Learner
% Want to try this to see how it compares to non-ensemble learning methods
%mdl = fitcensemble(tr_x,tr_y,'Method','AdaBoostM1','NumLearningCycles',150,'Learners',t,'CrossVal','on','KFold',kFolds);

