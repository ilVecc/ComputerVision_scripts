addpath('../0.utils');

cal = load('../0.calib_results/calib-harddisk-img_1.mat');

figure();
imshow(cal.image), hold on;

for i = 0:0.001:0.139
    M = [i 0 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0.048:-0.001:0
    M = [0.139 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0:0.001:0.168
    M = [0.139 i 0 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0:0.001:0.048
    M = [0.139 0.168 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.139:-0.001:0
    M = [i 0.168 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.168:-0.001:0
    M = [0 i 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.048:-0.001:0
    M = [0 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0:0.001:0.139
    M = [i 0 0 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0:0.001:0.168
    M = [0.139 i 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0.048:-0.0005:0
    M = [0.139-(0.139/0.048)*i 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0:0.0005:0.048
    M = [0.139 (0.168/0.048)*i i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0.139:-0.001:0
    M = [i (0.168/0.139)*i 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0.139:-0.001:0
    M = [i 0.168-(0.168/0.139)*i 0.048 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

clear i;
