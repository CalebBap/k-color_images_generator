function [k_image] =  ConvertImage(image, k, max_iterations)
    % Author: Caleb Baptista
    %
    % This function uses the k-means algorithm to convert an image of many
    % colours to one of just k colours.
    %
    % INPUTS:   image: the image to be converted
    %           k: k value specified by the user
    %           max_iterations: maximum number of iterations specified
    %               by the user
    % OUTPUTS:  k_image: the resulting image
    
    % display a progress bar, that will update throughout program, for user
    progress_bar = waitbar(0, 'Selecting Random Pixels...');
    pause(1);
    
    % convert image array data to double type to use in calculations
    image = double(image);

    % get k random points from the image
    [points] = SelectKRandomPoints(image,k);
    
    waitbar(0.25, progress_bar, 'Obtaining RGB Values...');
    pause(1);

    % get the RGB values for the k random points
    seedMeans = GetRGBValuesForPoints(image,points);

    waitbar(0.5, progress_bar, 'Computing k-means algorithm...');

    % apply k-means algorithm to assign all pixels in image to a cluster
    [clusters, means] = KMeansRGB(image, seedMeans, max_iterations);

    waitbar(0.75, progress_bar, 'Creating image...');

    % use clusters to generate the converted image
    k_image = CreateKColourImage(clusters,means);

    waitbar(1, progress_bar, 'Done');
    pause(1);
    delete(progress_bar);
end