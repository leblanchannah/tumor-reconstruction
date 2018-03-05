
function Tumor_Reconstructor_Tests()

    % generate a tumor to test - ellipsoid
    % centered at 0 0 0, a=1,b=2,c=3, n = 20
    n = 20;
    a = 10;
    b = 20;
    c = 30;
    ctr = [0 0 0];
    t1_shape = Generate_Ellipsoid(ctr,a,b,c,n);
%     hold on;
%     s3 = scatter3(t1_shape(1,:)',t1_shape(2,:)',t1_shape(3,:)','black','filled');
% 
%     hold off;
%     alpha(s3,1)
    %angles = [ -30 -15 0 15 30];
    angles = [-180 -90 -75 -60 -45 -30 -15 0 15 30 45 60 75 90 120];
    [throw, len] = size(angles);
    % multidimensional array will be lenx3xn size
    detector_images = repmat(5, [3 n len]);
    
    for i=1:len
        detector_images(:,:,i) = Tumor_Projector(angles(i),t1_shape);
 
    end 
    % project tumor onto detector at different angles
  
    [shape, volume] = Tumor_Reconstructor(angles, detector_images);

end