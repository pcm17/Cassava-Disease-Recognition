test_percentages = [0.2,0.4,0.5,0.6,0.8];
test_folder = [10,30,40,50,70];
leaf_type = 'original';
model_name='Inception';
classes = {'Healthy','BLS','CBSD','CMD','RMD','GMD'};
angle = 0;
label_font_size = 16;
cell_font_size = 14;

for i=1:length(test_percentages)
predictions = csvread(['resources/' leaf_type '/labels_predictions/' num2str(test_folder(i)), '/predictions.csv']);
predictions=predictions+1;
labels = csvread(['resources/' leaf_type '/labels_predictions/' num2str(test_folder(i)) '/labels.csv']);
labels=labels+1;
save_confusion_matrix(predictions, labels, test_percentages(i), leaf_type, model_name, classes, angle, label_font_size, cell_font_size)
end