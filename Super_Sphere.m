
% module that computes super-sphere which is the smallest sphere that
% centered in the in the center of the C-arm coordinate system and completely 
% encompasses tumor object to be reconstructed. 

%Input: vector of imaging angles, array of tumor silhouettes in detector coordinate system (u,v,w=0)
%Output: radius of the super-sphere (Rs)

% bonus marks - implement function R = Super_Sphere(angles,tumor_shapes)
function r = Super_Sphere(tumor_shapes) 
% passing in tumor shapes as multidimensional arrays
% https://www.mathworks.com/help/matlab/math/multidimensional-arrays.html
% each tumor_shape is a page in the array
% each page contains a nxm matrix
    [m,n,p] = size(tumor_shapes);
    % need to find max distance from 0 0 0 to point
    % for each page, compare max distance of all pages
    max_distances = zeros(1,p);
    for page = 1:p
        page_max = 0;
        for point = 1:n
            % distance -> length (origin to tumor point)
            distance = norm([0; 0; 0] - tumor_shapes(:,point,page));
            if distance > page_max
                page_max = distance;
            end
        end
        max_distances(page) = page_max;
    end 
    % the max distance amongst all tumor shapes
    r = round(max(max_distances)/2);
end