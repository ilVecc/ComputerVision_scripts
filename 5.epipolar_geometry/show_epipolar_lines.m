function [] = show_epipolar_lines(stereo_struct)
%SHOW_EPIPOLAR_LINES Summary of this function goes here
%   Detailed explanation goes here

% show images
fig = figure();
set(fig, 'Visible', 'on');
axesL = subplot(1,2,1); imshow(stereo_struct.L_camera.image);
axesR = subplot(1,2,2); imshow(stereo_struct.R_camera.image);
% show epipoles
eL = stereo_struct.setup.L_epipole;
eR = stereo_struct.setup.R_epipole;
axes(axesL), hold on, scatter(eL(1), eL(2), '+r');
axes(axesR), hold on, scatter(eR(1), eR(2), '+r');


% compute epipolar lines
leftImageSize = size(stereo_struct.L_camera.image);
rightImageSize = size(stereo_struct.R_camera.image);
while true
    [u, v, button] = ginput(1);
    axesFocus = gca();
    if button == 3
        % stop on right click
        break;
    
    elseif axesFocus == axesL ...
            && (u > 0 && u <= leftImageSize(2) && v > 0 && v <= leftImageSize(1))
        % left image click, plot onto right
        axes(axesL), hold on, scatter(u, v, '+r');
        
        mL = [u; v; 1];
        mR = stereo_struct.setup.Fundamental*mL; % one of the many
        
        % trace a line passing throught two points (from left to right of the image)
        % using the equation of the line: ax+by+c=0 is equivalent to y = -(ax+c)/b
        epipLineR_x = [1 rightImageSize(2)];
        epipLineR_y = -(mR(1) * epipLineR_x + mR(3)) ./ mR(2);
        
        axes(axesR), hold on, plot(epipLineR_x, epipLineR_y, 'r');
        
    elseif axesFocus == axesR ...
            && (u > 0 && u <= rightImageSize(2) && v > 0 && v <= rightImageSize(1))
        % right image click, plot onto left
        axes(axesR), hold on, scatter(u, v, '+g');
        
        mR = [u; v; 1];
        mL = mR'*stereo_struct.setup.Fundamental; % one of the many
        
        % trace a line passing throught two points (from left to right of the image)
        % using the equation of the line: ax+by+c=0 is equivalent to y = -(ax+c)/b
        epipLineL_x = [1 leftImageSize(2)];
        epipLineL_y = -(mL(1) * epipLineL_x + mL(3)) ./ mL(2);
        
        axes(axesL), hold on, plot(epipLineL_x, epipLineL_y, 'g');
    else
        % clicked outside images, ignore that
    end
    
end

close(fig);
end

