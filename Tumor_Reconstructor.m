
%
% reconstructs tumor's outer shell as a closed convex surface tumor from 
% its silhouettes and compute the tumor volume. 
%
% Input: vector of imaging angles, array of tumor silhouettes.
% Output: array of triangles defining the tumor surface; tumor volume.
function [triangles,v] = Tumor_Reconstructor(angles,tumor_silhouettes)
    % use projections/tumor silhouettes to find radius of supersphere
    r = Super_Sphere(tumor_silhouettes);
    d = 2*r;
    step_size = 1; %1mm
    num_views = size(angles);
    
    recon_tumor = [];
    dimension_of_cube = round(d/step_size); %d = 30, step_size = 5, cube is 6x6x6
    % cube that fits overtop of the super sphere, broken into voxels
    voxels = ones(dimension_of_cube,dimension_of_cube,dimension_of_cube);
    
    %depending on how you iterate through cube you can change voxel size
    for i = 1:step_size:d %1,5,10,15,20,25,30
        for j = 1:step_size:d
            for k = 1:step_size:d
                voxel_pt = [i j k] + [-r -r -r]; %[1 1 1] + [-15 -15 -15] = [-14 -14 -14]
                %looping through angles
                for image = 1:num_views(2)
                    pt_Q = Point_Projector(angles(image),voxel_pt)';
                    %https://www.mathworks.com/help/matlab/ref/inpolygon.html
                    %[in,on] = inpolygon(xq,yq,xv,yv), on=true if on edge
                    % project point [i j k] into uvw coordinate system
                    in = inpolygon(pt_Q(1), pt_Q(2), tumor_silhouettes(1,:,image)', tumor_silhouettes(2,:,image)');
                    if ~in
                        voxels(i,j,k) = 0; % row 1 col 1 page 1 = 0
                        break
                    end % row 1 col 1 page 1 = 1
                end
                
                % could get actual point of tumor if == 1 here insead of
                % below nested for loops
            end
        end
    end
   
    for i=1:dimension_of_cube
        for j=1:dimension_of_cube
            for k=1:dimension_of_cube
            	if voxels(i,j,k) == 1
                    voxel_pt = [i;j;k] + [-r;-r;-r];
                    %values which are part of tumor
                    recon_tumor = [recon_tumor voxel_pt];
                end
            end
        end
    end
    

    %scatter3(recon_tumor(1,:)', recon_tumor(2,:)', recon_tumor(3,:)')
    [triangles, v] = convhull(recon_tumor(1,:)',recon_tumor(2,:)',recon_tumor(3,:)');
    s2 = trisurf(triangles,recon_tumor(1,:)',recon_tumor(2,:)',recon_tumor(3,:)');
    %[x,y,z] = sphere;
    %s2 = surf(x*r,y*r,z*r);
    alpha(s2,0.1)
    %alpha(s1,0.1)
    

    return
end
   

