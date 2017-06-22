function [] = save_confusion_matrix(test_predictions, test_labels, test_perc, leaf_type, model_name, classes, angle, label_font_size, cell_font_size, color)
n_classes = length(classes);
yy_predictions = convert_labels(test_predictions, n_classes);
yy_labels = convert_labels(test_labels, n_classes);
%C = plotconfusion(yy_labels,yy_predictions,model_name);set(C,'Visible','off');
[~,cm] = confusion(yy_labels, yy_predictions);
sums = sum(cm,2)';
sums = repmat(sums,[6,1]);
cm = cm./sums;

C = imagesc(cm);            % Create a colored plot of the matrix values
colormap(flipud(color));    % Change the colormap to whatever color is passed in
colorbar;
textStrings = num2str(cm(:),'%0.2f');           % Create strings from the matrix values
textStrings = strtrim(cellstr(textStrings));    % Remove any space padding
[x,y] = meshgrid(1:6);                          % Create x and y coordinates for the strings
hStrings = text(x(:),y(:),textStrings(:),...    % Plot the strings
                'HorizontalAlignment','center');
midValue = mean(get(gca,'CLim'));               % Get the middle value of the color range
textColors = repmat(cm(:) > midValue,1,3);      % Choose white or black for the
                                                %   text color of the strings so
                                                %   they can be easily seen over
                                                %   the background color
set(hStrings,{'Color'},num2cell(textColors,2)); % Change the text colors

yticklabels(classes);   xticklabels(classes);   % tick labels and title
title([model_name ' ' num2str(test_perc*100) '% Test']);
set(gca,'FontSize',label_font_size)             % fontsize
set(findobj(gca,'type','text'),'fontsize',cell_font_size) 
xtickangle(angle);  ytickangle(angle)           % tick label angle
xlabel('Predicted Label'); ylabel('True Label');    % x and y labels
saveas(C,['Resources/' leaf_type '/confusion_matrices/' model_name '/' model_name ' | ' num2str(test_perc*100) ' % Test'],'png')
end