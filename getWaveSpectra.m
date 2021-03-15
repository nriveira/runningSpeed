for i = 1:length(runningB)
    fprintf('%d\n', i); 
    for clip = 1:length(runningB(i).runningClips)        
        runningB(i).runningClips(clip).clip_WP = [];
        clipNorm = [];
        
        for n = 1:length(fieldnames(runningB(i).runningClips(clip).Clips))-3
            if(i ~= 2 || n ~= 3)
                runningB(i).runningClips(clip).clip_WP = {get_wavelet_power(normalizeEEG(runningB(i).runningClips(clip).Clips{:,n}), 200, [1 50], 5)};
            end
        end
    end
end