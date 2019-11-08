function [squared_distance] =  SquaredDistance(point1, point2)
    % Author: Caleb Baptista
    %
    % This function takes two points in 3D space (i.e. the RGB values for a
    % pixel and a k-mean) and calculates the square of the linear distance 
    % between the two points
    %
    % INPUTS:   point1: 3 element array holding the first point in 3D space 
    %               to calculate distance between
    %           point2: 3 element array holding the second point in 3D space 
    %               to calculate distance between
    % OUTPUTS:  squared_distance: the squared linear distance between the
    %               two points in 3D space
    
    % Depending on how points 1 and 2 are passed (i.e. as a 2D or 3D
    % array), extract coordinate info. accordingly
    if numel(size(point1)) == 3  
        p1 = point1(1, 1, 1) ;
        p2 = point1(1, 1, 2) ;
        p3 = point1(1, 1, 3) ;
    else 
        point1 = reshape(point1,[1, 3]) ;
        p1 = point1(1, 1) ;
        p2 = point1(1, 2) ;
        p3 = point1(1, 3) ;
    end
    
    if numel(size(point2)) == 3
        q1 = point2(1, 1, 1) ;
        q2 = point2(1, 1, 2) ;
        q3 = point2(1, 1, 3) ;
    else
        point2 = reshape(point2,[1, 3]) ;
        q1 = point2(1, 1) ;
        q2 = point2(1, 2) ;
        q3 = point2(1, 3) ;
    end
    
    % Use function to calculate squared distance
    squared_distance = ((p1 - q1) ^ 2) + ((p2 - q2) ^ 2) + ((p3 - q3) ^ 2) ;
end

