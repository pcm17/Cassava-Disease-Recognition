%% Load the bottleneck data
leaf_type = 'leaflet';
%[healthy, disease] = load_data_cassava(leaf_type);

model_name={'inception','svm','knn','discriminant','tree'};
%load_results_cassava (leaf_type, model_name);

svm = templateSVM('Standardize',1);
kn = templateKNN('Standardize',1);
nb = templateNaiveBayes('DistributionNames','kernel');
dt = templateTree();
disc = templateDiscriminant('DiscrimType','pseudoLinear');
log = templateLinear();
temp_name={svm,kn,disc,dt};
model_name={'svm','knn','discriminant','tree'};

nModels=length(model_name);
numFeats = size(disease,2)-1;

%nModels=1;
nRuns=5;
kFolds=3;
acc = zeros(kFolds,1);
accuracy = zeros(nRuns,nModels);
%% Run sessions nRuns times and Write results out to file
for n = 2:nModels % Start at 2 because first model is inception
    for run = 1:nRuns
        model = model_name{n};
        data = [healthy;disease];
        nSamples=size(data,1);
        Data = data(randperm(nSamples),:);
        test_perc = 0.2;
        % Split data into training/test sets
        [tr_x,tr_y,test_x,test_y] = split_data( Data, numFeats, test_perc );


        %% Ensemble Tree Learner
        %mdl = fitcensemble(tr_x,tr_y,'Method','AdaBoostM1','NumLearningCycles',150,'Learners',t,'CrossVal','on','KFold',kFolds);
        %% SVM Learner
        mdl = fitcecoc(tr_x,tr_y,'Learners',model,'CrossVal','on','KFold',kFolds);
        %CVMdl = crossval(mdl,'kfold',kFolds);
        %oosLoss = kfoldLoss(CVMdl,'folds',kFolds);
        %% Predictions
        
        for f = 1:kFolds
            y_pred = predict(mdl.Trained{f,1},test_x);  % Make predictions with each model
            acc(f,1) = sum(y_pred == test_y)/length(y_pred);
        end
        %}
        accuracy(run,n) = mean(acc) % Calculate mean classification accuracy from the 3 models
        %accuracy(run,n) = (1-oosLoss)
        save_results(accuracy(run,n));
    end
end

%%
% Plot the results
x1=linspace(1,nModels,nModels);
x1=repmat(x1,[nRuns,1]);
scatter(reshape(x1,[(nRuns*nModels),1]),reshape(accuracy,[(nRuns*nModels),1]),'ko');
xticks([1 2 3 4]);
xticklabels(model_name);
