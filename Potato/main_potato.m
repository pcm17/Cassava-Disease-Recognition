%% Load the bottleneck data
%load_data_potato;

nDays=14;
nRuns=10;
kFolds=5;
acc = zeros(kFolds,1);
accuracy = zeros(nDays,nRuns);
%% Run sessions nRuns times and Write results out to file
for day = 1:nDays
    for run = 1:nRuns
        
        disease = disease_data{day};
        data = [healthy;disease];
        Data = data(randperm(size(data,1)),:);
        %[coeff,score,latent,tsquared,explained,mu] = pca(data(:,1:2048));
        %Data = [score(:,1:n) data(:,2049)];

        test_perc = 0.2;
        test_num = round(size(Data,1)*test_perc);

        test_data = Data(1:test_num,:);
        tr_data = Data(test_num+1:size(Data,1),:);

        tr_x = tr_data(:,1:size(tr_data,2)-1);
        tr_y = tr_data(:,size(tr_data,2));

        test_x = test_data(:,1:size(test_data,2)-1);
        test_y = test_data(:,size(test_data,2));

        %% K-Nearest Neighbor Learner
        %mdl = fitcnb(tr_x,tr_y);
        %% Ensemble Tree Learner
        %mdl = fitcensemble(tr_x,tr_y,'Method','AdaBoostM1','NumLearningCycles',150,'Learners',t,'CrossVal','on','KFold',3);
        %% SVM Learner
        mdl = fitclinear(tr_x,tr_y,'Learner','logistic','CrossVal','on','KFold',kFolds);
        %%
        for b = 1:kFolds
            y_pred = predict(mdl.Trained{b,1},test_x);
            acc(b,1) = sum(y_pred == test_y)/length(y_pred);
        end
        accuracy(day,run) = mean(acc)
        fid = fopen(['potato_exp/matlab/logistic_results/' disease_date{day} '.txt'],'a');
        fprintf(fid, '%.2f\n', accuracy(day,run)*100);
        fclose('all');
    end
end
