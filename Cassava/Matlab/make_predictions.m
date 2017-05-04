function [ accuracy ] = make_predictions (test_x, test_y, mdl, kFolds)
    acc = zeros(kFolds,1);
    for i = 1:kFolds
        y_pred = predict(mdl.Trained{i,1},test_x);  % Make predictions with each model
        acc(i,1) = sum(y_pred == test_y)/length(y_pred);
    end
    accuracy =  mean(acc); % Calculate mean classification accuracy from all of the models
end