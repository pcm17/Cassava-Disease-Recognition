day = [15,18,19,20,23,24,25,26,28,31,1,2,3,4];
daysPostInnoc = [1,4,5,6,9,10,11,12,14,17,18,19,20,21];
month =[7,8];
n=1;
nDays = 14;
nRuns = 10;
nInceptRuns=4;
data_inception = zeros(nInceptRuns,nDays);
data_svm = zeros(nRuns+1,nDays);
data_logistic = zeros(nRuns,nDays);
data_knn = zeros(nRuns,nDays);
data_dt = zeros(nRuns,nDays);
xlabels = cell(nDays,1);
for i = 1:nDays
    if i >= 11
        mon = month(2);
    else
        mon = month(1);
    end
    date = [num2str(mon) '_' num2str(day(i)) '_16'];
    data = load(['potato_exp/matlab/svm_results/' date '.txt']);
    data_inception(:,i) = data(1:nInceptRuns);
    data_svm(:,i) = load(['potato_exp/matlab/svm_results/' date '.txt']);
    data_logistic(:,i) = load(['potato_exp/matlab/logistic_results/' date '.txt']);
    data_knn(:,i) = load(['potato_exp/matlab/knn_results/' date '.txt']);
    data_dt(:,i) = load(['potato_exp/matlab/dt_results/' date '.txt']);
    xlabels(i) = cellstr(date);
end
%%
% Display Results in Plot
plot(daysPostInnoc, mean(data_inception), daysPostInnoc, mean(data_svm), daysPostInnoc, mean(data_logistic), daysPostInnoc, ...
    mean(data_knn), daysPostInnoc, mean(data_dt));
xlim([0,22]);
xlabel('Days Post Innoculation');
ylabel('Mean Classification Accuracy');
title('Disease Recognition');
legend('Inception', 'SVM','Logistic', 'KNN', 'Decision Tree', 'Location','northwest');

