%% Load the bottleneck data
leaftype = 'leaflet';
[healthy, disease] = load_data_cassava(leaftype);

svm = templateSVM('Standardize',1);
kn = templateKNN('Standardize',1);
nb = templateNaiveBayes('DistributionNames','kernel');
dt = templateTree();
disc = templateDiscriminant('DiscrimType','pseudoLinear');
log = templateLinear();
temp_name={svm,disc,kn,dt};
model_name={'svm','discriminant','knn','tree'};

nModels=length(model_name);
numFeats = 2048;
%nModels=1;
nRuns=5;
kFolds=3;
acc = zeros(kFolds,1);
accuracy = zeros(nRuns,nModels);
%% Run sessions nRuns times and Write results out to file
for n = 1:nModels
    for run = 1:nRuns
        
        data = [healthy;disease_data];
        Data = data(randperm(size(data,1)),:);
        X = Data(:,1:numFeats);
        Y = Data(:,numFeats+1);
        %[coeff,score,latent,tsquared,explained,mu] = pca(data(:,1:2048));
        %Data = [score(:,1:n) data(:,2049)];

        test_perc = 0.2;
        test_num = round(size(Data,1)*test_perc);

        test_data = Data(1:test_num,:);
        tr_data = Data(test_num+1:size(Data,1),:);

        tr_x = tr_data(:,1:numFeats);
        tr_y = tr_data(:,numFeats+1);

        test_x = test_data(:,1:numFeats);
        test_y = test_data(:,numFeats+1);

        %% K-Nearest Neighbor Learner
        %mdl = fitcnb(tr_x,tr_y);
        %% Ensemble Tree Learner
        %mdl = fitcensemble(tr_x,tr_y,'Method','AdaBoostM1','NumLearningCycles',150,'Learners',t,'CrossVal','on','KFold',kFolds);
        %% SVM Learner
        mdl = fitcecoc(tr_x,tr_y,'Learners',model_name{n},'CrossVal','on','KFold',kFolds);
        %mdl = fitcecoc(X,Y,'Learners',temp_name{n});
        %CVMdl = crossval(mdl,'kfold',kFolds);
        %oosLoss = kfoldLoss(CVMdl,'folds',kFolds);
        %%
        
        for f = 1:kFolds
            y_pred = predict(mdl.Trained{f,1},test_x);
            acc(f,1) = sum(y_pred == test_y)/length(y_pred);
        end
        %}
        accuracy(run,n) = mean(acc)
        %accuracy(run,n) = (1-oosLoss)
        fname = 'GoogleDrive/Cassava_leaflet/matlab/results_';
        fname = strcat(fname,model_name{n});
        fname = strcat(fname,'.txt');
        fid = fopen(string(fname),'a');
        fprintf(fid, '%.2f\n', accuracy(run,n)*100);
        fclose('all');
    end
end

%%
% Plot the results
x1=linspace(1,nModels,nModels);
x1=repmat(x1,[nRuns,1]);
scatter(reshape(x1,[(nRuns*nModels),1]),reshape(accuracy,[(nRuns*nModels),1]),'ko');
xticks([1 2 3 4]);
xticklabels(model_name);
