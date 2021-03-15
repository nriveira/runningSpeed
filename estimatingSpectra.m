statset('UseParallel', true);
ci = [];

for p = 1:length(population) 
    tic
    a = bootci(2000, {@avgMatrices, population(p).clipAVG_WP},'Type','student');
    ci(p).lower = a(1,:);
    ci(p).upper = a(2,:);   
    toc
    
    a = [];
end