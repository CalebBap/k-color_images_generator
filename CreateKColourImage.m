function [new_image] = CreateKColourImage(pixel_clusters, cluster_means)
    % Author: Caleb Baptista
    %
    % This function creates a k-colour image from the mean cluster values
    % calculated from the original image by recolouring the pixels in each
    % cluster by its mean value R, G and B values
    %
    % INPUTS:   pixel_clusters: 2D array which stores which cluster each 
    %               pixel in the original image has been assigned to
    %           cluster_means: 3D array which stores the mean R, G and B
    %               values for each cluster
    % OUTPUTS:  new_image = 3D array storing unsigned 8 bit integer R, G 
    %               and B values for each pixel (according to the mean 
    %               colour value of the cluster the pixel has been assigned 
    %               to) which make up a new RGB image 
    
    [rows, coloumns] = size(pixel_clusters) ;
    
    % Preallocate memory for new_image array to speed up program
    new_image = zeros(rows, coloumns, 3, 'uint8') ;
    
    % Round all mean colour values stored in cluster_means
    cluster_means = round(cluster_means) ;
    
    % Assign RGB values for each pixel in new image using a for loop which
    % runs through every element and assigns the RGB value according
    % to what cluster the pixel in the original image, with the same
    % location, was assigned to
    for i = 1:rows
        for j = 1:coloumns
            cluster_number = pixel_clusters(i, j) ;
            new_image(i, j, :) = cluster_means(cluster_number, 1, :) ;
        end
    end
end

