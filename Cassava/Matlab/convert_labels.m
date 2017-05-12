function yy = convert_labels(predictions, n_classes)
num_samples = size(predictions,1);
yy = zeros(n_classes,num_samples);
for i = 1:num_samples
    yy(predictions(i),i) = 1;
end
end