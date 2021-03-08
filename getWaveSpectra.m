for i = 1:length(runningB)
    fprintf('%d', i); 
    for clip = 1:length(runningB(i).runningClips)        
        runningB(i).runningClips(clip).clip_WP = [];
        clipNorm = [];
        
        for n = 1:length(fieldnames(runningB(i).runningClips(clip).Clips))-3
            if(i ~= 2 || n ~= 3)
                a = runningB(i).runningClips(clip).Clips{:,n};
                clipNorm(:,n) = normalizeEEG(a);
                runningB(i).runningClips(clip).clip_WP(:,n) = get_wavelet_power(clipNorm(:,n), 200, 50, 0.2, 5);
            end
        end
    end
end