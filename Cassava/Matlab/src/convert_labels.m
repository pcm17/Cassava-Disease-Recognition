function yy = convert_labels(predictions, n_classes)
%%% Converts an 1 x num_samples array of labels to an n_classes x
%%% num_samples array

num_samples = size(predictions,1);
yy = zeros(n_classes,num_samples);

for i = 1:num_samples
    yy(predictions(i),i) = 1;
end

end