
% currently have all test cases except testcase 1 commented out
function Super_Sphere_Test()
    disp("Super_Sphere_Test()");
    %generate ellipsoid
    n = 20
    a = 10
    b = 20
    c = 30
    %super-sphere - will be scaled by r returned from super-sphere.m
    [x,y,z] = sphere;
    ellipsoid_original = Generate_Ellipsoid([0 0 0],a,b,c,n);
    % - revision to assignment - 
    %   ellipsoid always centered at [0 0 0] and not using vector of
    %   imaging angles
    %   future implementation - find center of tumor projection using
    %   intersection of n lines code created in HW1
    disp("Test 1 - projecting tumor at 0");
    %test1 - use ellipsoid @ 0 degrees projection angle
    %Super_Sphere expects a multi-dimensional array as arguments
    detector_image_zero = Tumor_Projector(0,ellipsoid_original);
    
    %T1 is radius of first supersphere
    T1 = Super_Sphere(detector_image_zero);
    figure(1);
    hold on;
    surf(x*T1,y*T1,z*T1);
    title("Test 1 - Tumor Shape and Super Sphere");
    scatter3(ellipsoid_original(1,:)',ellipsoid_original(2,:)',ellipsoid_original(3,:)','black','filled');
    alpha 0.2;
    hold off;
    %test2 - use ellipsoid @ 90 degrees projection angle
    detector_image_ninety = Tumor_Projector(90,ellipsoid_original);

    %T2 is radius of second super sphere
    disp("Test 2 - projecting tumor at 90");
    T2 = Super_Sphere(detector_image_ninety);
    figure(2);
    hold on;
    surf(x*T2,y*T2,z*T2);
    scatter3(ellipsoid_original(1,:)',ellipsoid_original(2,:)',ellipsoid_original(3,:)','black','filled');
    alpha 0.2;
    title("Test 2 - Tumor Shape and Super Sphere"); 
    hold off;

    %T3 
    disp("Test 3 - projecting tumor at multiple angles");

    d1 = Tumor_Projector(-30,ellipsoid_original);
    M = d1;
    d2 = Tumor_Projector(-15,ellipsoid_original);
    M(:,:,2) = d2;
    d3 = Tumor_Projector(0,ellipsoid_original);
    M(:,:,3) = d3;
    d4 = Tumor_Projector(15,ellipsoid_original);
    M(:,:,4) = d4;
    d5 = Tumor_Projector(30,ellipsoid_original);
    M(:,:,5) = d5;
    %     
    T3 = Super_Sphere(M);
    figure(3);
    hold on;

    surf(x*T3,y*T3,z*T3);
    alpha 0.2;
    scatter3(ellipsoid_original(1,:)',ellipsoid_original(2,:)',ellipsoid_original(3,:)','black','filled');
    title(" Test 3 - Tumor Shape and Super Sphere"); 
    hold off;
    %    

end