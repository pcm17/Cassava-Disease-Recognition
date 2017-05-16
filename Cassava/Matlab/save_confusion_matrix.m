function [] = save_confusion_matrix(test_predictions, test_labels, test_perc, leaf_type, model_name, classes, angle)
n_classes = length(classes);
yy_pred = convert_labels(test_predictions, n_classes);
yy_true = convert_labels(test_labels, n_classes);
C = plotconfusion(yy_true,yy_pred,model_name);set(C,'Visible','on');
yticklabels(classes);
xticklabels(classes);
set(gca,'FontSize',18)
set(findobj(gca,'type','text'),'fontsize',15) 
xtickangle(angle);
ytickangle(angle)
saveas(C,['Resources/' leaf_type '/confusion_matrices/' model_name '/' model_name ' | ' num2str(test_perc*100) ' % Test'],'png')

end