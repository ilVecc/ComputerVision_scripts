addpath('../0.utils');

cal = load('../0.calib_results/calib-cube-img_1.mat');

figure();
imshow(cal.image), hold on;

for i = 0:0.001:0.056
    M = [i 0 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [0.056 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0:0.001:0.056
    M = [0.056 i 0 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0:0.001:0.056
    M = [0.056 0.056 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [i 0.056 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [0 i 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [0 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0:0.001:0.056
    M = [i 0 0 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.g');
    drawnow;
end

for i = 0:0.001:0.056
    M = [0.056 i 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.r');
    drawnow;
end

for i = 0.056:-0.0005:0
    M = [0.056-i 0 i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0:0.0005:0.056
    M = [0.056 i i 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [i i 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

for i = 0.056:-0.001:0
    M = [i 0.056-i 0.056 1]';
    m = project(cal.P, M);
    scatter(m(1), m(2), '.y');
    drawnow;
end

clear i;
