function [  ] = plot_nw_data( data, label_, title_ )
%plot all the darn plots required in a single figure and save it
    data = double(data);
    figure();
    subplot(311);
    stem(data);
    xlabel('node');
    ylabel(label_);
    title(title_);
    subplot(312);
    histogram(data);
    xlabel(label_);
    ylabel('number of nodes');
    subplot(313);
    boxplot(data);
    ylabel(label_);
    saveas(gcf, ['figures/', title_,'.png']);
    close(gcf);
end

