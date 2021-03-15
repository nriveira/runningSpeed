%[~,~,totalValues] = xlsread("C:\Users\nrive\Research\runSpeedDATA\Ank3_homoz_mouse10_day2_begin3_DV25DLC_resnet50_Ank3_test_ver1.0Jul21shuffle1_600000.csv");
[~,~,totalValues] = xlsread("C:\Users\nrive\Research\runSpeedDATA\Ank3_homoz_mouse10_day2_begin2_DV9DLC_resnet50_Ank3_test_ver1.0Jul21shuffle1_600000.csv");
videoFs = 30;
Ts = 1/30;
rollingAvg = 5;

midbody = totalValues(4:end,14:16);
filt = ones(1,rollingAvg)./ rollingAvg;

x = cell2mat(midbody(:,1));
x = conv(x,filt);
x = x(floor(rollingAvg/2)+1:end-floor(rollingAvg/2));

y = cell2mat(midbody(:,2));
y = conv(y,filt);
y = y(floor(rollingAvg/2)+1:end-floor(rollingAvg/2));

pos = [x y];
vel = zeros(1,length(pos));
for i = 2:length(pos)
    
    a = (pos(i,1)-pos(i-1,1))^2 + (pos(i,2)-pos(i-1,2))^2;
    if a < 35
       vel(i) = a;
    end
end

vel = conv(vel,filt);
vel = vel(floor(rollingAvg/2)+1:end-floor(rollingAvg/2));

t = 0:Ts:120-Ts;
plot(t,vel)