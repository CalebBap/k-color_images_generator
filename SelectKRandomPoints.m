function [k_points] = SelectKRandomPoints(image_array, number_points)
    % Author: Caleb Baptista
    %
    % This function selects, and then returns the location of, randomly   
    % selected pixels from an image. The number of random pixels returned  
    % depends on the k value entered by the user
    %
    % INPUTS:   image_array: 3D matrix containing the RGB values for each  
    %               pixel in an image. Random pixels will be selected from 
    %                this image/matrix
    %           number_points: stores the number of random pixels that need 
    %               to be picked depending on the k value entered by the 
    %               user
    % OUTPUTS:  k_points: stores the locations of the randomly selected 
    %               pixels from the 3D image array 

    % Preallocate memory for k_points array to speed up program
    k_points = zeros(number_points, 2) ;
    
    % Select as many random, unique, linear indices from image array as 
    % specified by number_points variable
    linear_indices = randperm((numel(image_array) / 3), number_points) ;
    
    % Convert these linear indices to subscript indices and store them in
    % output variable, k_points
    [I,J] = ind2sub(size(image_array), linear_indices) ;
    k_points(:,1) = I ;
    k_points(:,2) = J ;
end