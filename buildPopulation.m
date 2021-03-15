currentMouse = 0;
counter = 0;
population = [];

for b = 1:length(runningB)    
    %% Postictal confidence intervals
    
    if(runningB(b).mouse ~= currentMouse || b == 1)
        counter  = counter+1;
        population(counter).mouse = runningB(b).mouse;
        population(counter).videoname = [runningB(b).runningClips.Videoname];
        population(counter).startStamp = {runningB(b).runningClips.startStamps};
        population(counter).stopStamp = {runningB(b).runningClips.stopStamps};
        population(counter).clip_WP = [runningB(b).runningClips.clip_WP];
        currentMouse = runningB(b).mouse;
    else
        population(counter).videoname = [population(counter).videoname runningB(b).runningClips.Videoname];
        population(counter).startStamp = [population(counter).startStamp runningB(b).runningClips.startStamps];
        population(counter).stopStamp = [population(counter).stopStamp runningB(b).runningClips.stopStamps];
        population(counter).clip_WP = [population(counter).clip_WP runningB(b).runningClips.clip_WP];
    end

    fprintf('Mouse %d, %d instances found\n', runningB(b).mouse, length(population(counter).clip_WP));
end

for p = 1:length(population)
    for q = 1:length(population(p).clip_WP)
        a = cell2mat(population(p).clip_WP(q));
        population(p).clipAVG_WP(q) = {mean(a,2)};
    end
end