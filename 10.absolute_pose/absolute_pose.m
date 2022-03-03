addpath('../0.utils');

load('Corr3D.mat')


%% Plot model (reference) and data (to be aligned)
figure(), hold on; 
plot3(model_i(:,1), model_i(:,2), model_i(:,3), 'b.');
plot3(data_i(:,1), data_i(:,2), data_i(:,3), 'r.');
grid on
axis equal


%% Find rigid transformation and plot result
[~, R, t] = absolute_orientation(model_i, data_i);
G = [R t; zeros(1,3) 1];
data_out = (R*data_i'+t)';

figure(), hold on;
plot3(model_i(:,1), model_i(:,2), model_i(:,3), 'b.');
plot3(data_out(:,1), data_out(:,2), data_out(:,3), 'r.');
grid on
axis equal
