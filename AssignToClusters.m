function [cluster_numbers] = AssignToClusters(image_array, means_array)
    % Author: Caleb Baptista
    %
    % This function assigns each pixel in a RGB image to a cluster
    % depending on which k mean the pixels RBG value is closest to
    % (i.e. according to the shortest squared distance between the pixels
    % RGB value and the k mean)
    %
    % INPUTS:   image_array: 3D matrix containing the RGB values for each  
    %               pixel in an image. Used to assign each pixel to a
    %               cluster depending on which clusters mean is closest
    %           means_array: stores the RGB information for each of the
    %               k means to which the RBG values of the image's pixels
    %               will be compared to
    % OUTPUTS:  cluster_numbers: a 2D array which stores the cluster number
    %               each pixel in the image has been assigned to in a
    %               location corresponding to the pixels location
    %               within the image array

    % Preallocate memory for img_squared_distance array to speed up program
    img_squared_distance = zeros(size(image_array, 1), size(image_array, 2), size(means_array, 1)) ;

    % For each mean calculate the squared distance between itself and each 
    % pixel in the image array and store this distance in a location which
    % corresponds to the pixels location and the position of the mean in
    % means_array
    for x = 1:size(means_array, 1)
        img_squared_distance(:,:,x) = sum(((image_array - means_array(x, 1, :)) .^ 2), 3) ;
    end
    
    % Use the 3rd dimension index location of the minimum squared distance 
    % between each pixel and the closest mean to assign the appropriate
    % cluster number
    [~, cluster_numbers] = min(img_squared_distance,[], 3) ;
end
