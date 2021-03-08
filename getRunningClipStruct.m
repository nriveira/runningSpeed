runningB = [];
counter = 1;

for m = 1:length(Mouse)
    for d = 1:length(Mouse(m).Day)
        for b = 1:length(Mouse(m).Day(d).Begin)
            if(~isempty(Mouse(m).Day(d).Begin(b)))
                fprintf('%s %s %s\n', string(Mouse(m).name), string(Mouse(m).Day(d).name), string(Mouse(m).Day(d).Begin(b).name))
                try
                    runningB(counter).mouse = str2double(extractAfter(Mouse(m).name,'Mouse'));
                    runningB(counter).day = d;
                    runningB(counter).begin = b;
                    runningB(counter).runningClips = Mouse(m).Day(d).Begin(b).walkBehaviors;
                    counter = counter+1;
                catch 
                    continue;
                end
            end
        end
    end
end

runningB(6) = [];
runningB(6) = [];
runningB(6) = [];
runningB(9) = [];
runningB(13) = [];
runningB(13) = [];

% runningB(2).runningClips = 0??
for i = 1:length(runningB(2).runningClips)
    runningB(2).runningClips(i).Clips(:,2) = [];
end
