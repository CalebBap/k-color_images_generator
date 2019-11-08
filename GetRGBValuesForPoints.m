function [rgb_k_points] = GetRGBValuesForPoints(image_array, k_points)
    % Author: Caleb Baptista
    %
    % This function determines the RGB values for pixels randomly selected 
    % from an image, and with locations passed in the k_points array, and 
    % then returns this information in a 3D array
    %
    % INPUTS:   image_array: 3D matrix containing the RGB values for each  
    %               pixel in an image. RGB values for each pixel   
    %               corresponding to a k point will be determined from this 
    %               image/matrixRGB
    %           k_points: stores the locations of the randomly selected
    %                pixels for which RGB values will be found
    % OUTPUTS:  rgb_k_points: a 3D array containing RGB values for each of 
    %               the randomly selected pixels/k points in image, each
    %               row of array will contain info. for one of the pixels
    
    % Preallocate memory for rgb_k_points array to speed up program
    rgb_k_points = zeros(size(k_points,1), 1, 3) ;
    
    % Get RGB values for pixel that each k point corresponds to and store
    % them in rgb_k_points array to be returned
    for i = 1:size(k_points,1)
        rgb_k_points(i, 1, 1) = image_array(k_points(i, 1), k_points(i, 2), 1);
        rgb_k_points(i, 1, 2) = image_array(k_points(i, 1), k_points(i, 2), 2);
        rgb_k_points(i, 1, 3) = image_array(k_points(i, 1), k_points(i, 2), 3);
    end
end