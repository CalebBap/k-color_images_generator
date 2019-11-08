function [pixel_clusters, cluster_means] = KMeansRGB(image_array, current_means, num_iterations)
    % Author: Caleb Baptista
    %
    % This function implements the k-means algorithm to assign pixels in
    % an image to a cluster according to its R, G and B values. It
    % repeatedly calls the AssignToClusters and UpdateMeans functions until 
    % the k-means algorithm converges or until the max. number of 
    % iterations, specified by the user, is reached 
    %
    % INPUTS:   image_array: 3D matrix containing the RGB values for each  
    %               pixel in an image. These values are used in the k-means 
    %               algorithm 
    %           current_means: initial k_mean/seed mean values used to  
    %               initialise the k-means algorithm
    %           num_iterations: stores the max. number of iterations, that
    %               the user specifies, in case the algroithm can't
    %               converge before this point
    % OUTPUTS:  pixel_clusters: 2D array storing which cluster each pixel
    %               in the image belongs to
    %           cluster_means: 3D array storing the mean R, G and B values
    %               for each cluster, the row location where each clusters
    %               mean RGB values is stored at corresponds to its number
        
    [rows, coloumns, ~] = size(image_array) ;
    
    % Preallocate memory for pixel_clusters and cluster_means arrays 
    % to speed up program
    pixel_clusters = zeros(rows, coloumns) ;
    cluster_means = zeros(size(current_means, 1), 1, 3) ;
    
    % While the number of max. iterations is yet to be reached...
    while num_iterations > 0 
        % Call AssignToClusters and UpdateMeans functions to get new
        % cluster groups and cluster means
        new_clusters = AssignToClusters(image_array, current_means) ;
        new_means = UpdateMeans(image_array, size(current_means, 1), new_clusters) ; 
       
        num_iterations = num_iterations - 1 ;
        
        % Return output variables if k-means algorithm converges
        if new_means == current_means
            cluster_means = new_means ;
            pixel_clusters = new_clusters ;
            break ;
        else
            % Otherwise, if max. number of iterations is reached before
            % algorith converges inform user of this and return output
            % variables
            if num_iterations == 0
                warndlg('Maximum number of iterations reached before convergence was achieved') ;
                cluster_means = new_means ;
                pixel_clusters = new_clusters ;
            else
                % if the algroithm doesn't converge and if max. iterations
                % isn't reached yet, update current_means value with the
                % new_means value and continue on with algorithm
                current_means = new_means ;
            end
        end
    end  
end

