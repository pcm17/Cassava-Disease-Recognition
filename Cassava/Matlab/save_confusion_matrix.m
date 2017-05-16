function [] = save_confusion_matrix(test_predictions, test_labels, test_perc, leaf_type, model_name, classes, angle, label_font_size, cell_font_size)
n_classes = length(classes);
yy_pred = convert_labels(test_predictions, n_classes);
yy_true = convert_labels(test_labels, n_classes);
C = plotconfusion(yy_true,yy_pred,model_name);set(C,'Visible','off');
yticklabels(classes);   xticklabels(classes);
set(gca,'FontSize',label_font_size)
set(findobj(gca,'type','text'),'fontsize',cell_font_size) 
xtickangle(angle);  ytickangle(angle)
%defining colors
%{
f1=[0 0 1];
f4=[50 205 50]/255;
f9=[236 0 0]/255;
f14=[85 26 139]/255;
%colors          
set(findobj(gca,'color',[0,102,0]./255),'color',f4)
set(findobj(gca,'color',[102,0,0]./255),'color',f9)
set(findobj(gcf,'facecolor',[120,230,180]./255),'facecolor',f4)
set(findobj(gcf,'facecolor',[230,140,140]./255),'facecolor',f9)
set(findobj(gcf,'facecolor',[0.5,0.5,0.5]),'facecolor',f1)
set(findobj(gcf,'facecolor',[120,150,230]./255),'facecolor',f14)
%}
saveas(C,['Resources/' leaf_type '/confusion_matrices/' model_name '/' model_name ' | ' num2str(test_perc*100) ' % Test'],'png')
end