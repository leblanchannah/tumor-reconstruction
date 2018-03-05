
% projects a point given in C-arm coordinates P(x,y,z) to the detector
% at imaging angle alpha
% input: angle alpha, P - projector point
% output: Q - projected point in detector coordinates
function Q = Point_Projector(alpha, P)
    %target is at origin [0 0 0]
    %projector point in xyz coordinates
    projector_pt = [0 750 0];
    %detector point in xyz coodinate
    detector_center = [0 -750 0];
    detector_point = [1 -750 0];
    
    %rotating the person by alpha about z axis
    rotation_alpha_z = [cosd(-alpha) -sind(-alpha) 0;sind(-alpha) cosd(-alpha) 0;0 0 1];
    detector_normalB = [0 -740 0];
    detector_normalA = [0 -750 0];

    AB = detector_normalB - detector_normalA;
    d_norm = AB/norm(AB);
 
    P = rotation_alpha_z*P';
    
    % created line through projector and P
    % line_and_plane finds intersection of line and detector plane
    intersection = Line_And_Plane(projector_pt, P', detector_point, d_norm);
    % translate by 750mm to detector axis
    temp = (intersection + [0 750 0])';
    % simulating two rotations by swapping u for z and v for x
    Q = [round(temp(3)); round(temp(1)); 0];
    
    %creating plane for surf to show what point location looks like 
    % using matlab code https://www.mathworks.com/matlabcentral/answers/291485-how-can-i-plot-a-3d-plane-knowing-its-center-point-coordinates-and-its-normal
    w = null(d_norm); %  two orthonormal vectors orthogonal to plane normal
    %chose size of plane for test purposes 

    
%un-comment below code to see point projection visualizations
%commented out so that tumor reconstruction can run quickly

%     [A,B] = meshgrid(-40:40); 
%     X = detector_point(1)+w(1,1)*A+w(1,2)*B; 
%     Y = detector_point(2)+w(2,1)*A+w(2,2)*B;
%     Z = detector_point(3)+w(3,1)*A+w(3,2)*B;
    
   
%   
%     surf(X,Y,Z,'FaceColor','red','FaceAlpha',0.2)
%     scatter3(projector_pt(1),projector_pt(2),projector_pt(3),'filled')
%     scatter3(0, 0, 0,10,'filled')
%     scatter3(detector_center(1),detector_center(2),detector_center(3),50,'filled')
%     scatter3(intersection(1),intersection(2),intersection(3),50,'filled')
 
    return;
end