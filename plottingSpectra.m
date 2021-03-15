colors = {'m','m','g','g','k','k'};

for i = 1:length(ci)
    freq = 1:0.2:50;
    hold on
    plot(freq, ci(i).lower, colors{i})
    plot(freq, ci(i).upper, colors{i})
end