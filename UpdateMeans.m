function [cluster_means] = UpdateMeans(image_array, num_of_clusters, cluster_numbers)
    % Author: Caleb Baptista
    %
    % This function calculates the mean R, G and B values for each cluster
    % depending on the R, G and B values of the pixels assigned to them
    %
    % INPUTS:   image_array: 3D matrix containing the RGB values for each  
    %               pixel in an image. These values are used in calculating 
    %               the mean of the cluster each has been assigned to    
    %           num_of_clusters: stores the number clusters that there are
    %           cluster_numbers: 2D array storing which cluster each pixel 
    %               in the image has been assigned to. The location of the
    %               cluster numbers in this array correspond to the 
    %               location of the pixel, to which the cluster number is 
    %               assigned to, in the image array
    % OUTPUTS:  cluster_means: a 3D array which stores the mean R, G and B
    %               values for each cluster in a row corresponding to
    %               the clusters number
    
    % Preallocate memory for cluster_means array to speed up program
    cluster_means = zeros(num_of_clusters, 1, 3) ;

    % Reshape 3D image array to a 2D array
    img_array = reshape(image_array, size(image_array, 1) * size(image_array, 2), 3) ; 

    % For every cluster, in the row corresponding to the clusters number,
    % store the clusters mean value using the corresponding RGB values of
    % the pixels in that cluster stored in the 2D image array 
    
    for cluster_num = 1:num_of_clusters
    % Since each cluster number in cluster_numbers array corresponds to
    % the locations of pixels, in img_array, that are in the cluster, the 
    % find function and logical indexing can be used to get these values
        cluster_means(cluster_num, 1, :) = mean(img_array(find(cluster_numbers == cluster_num), :)) ;
    end 
end

