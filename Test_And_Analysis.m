
function Test_And_Analysis()

%s1 = trisurf(triangles,recon_tumor(1,:)',recon_tumor(2,:)',recon_tumor(3,:)');
    % using ellipsoidal tumor at [0 0 0] - 
    % see Super Sphere Input - vector of imaging angles email from prof 
    ctr = [0 0 0];
    a = 10;
    b = 20;
    c = 30;
    n = 20;
    shots = [];
    volumes = [];
    format short g
    % Generate tumor
    tumor = Generate_Ellipsoid([0 0 0], a, b, c, n);
    
    % make array of tumor projections every 15 degrees for full 360
    angles = zeros(1,24);
    for i = 1:24
        angles(i) = (i-1)*15;
    end


    %Test 1, 0 degrees, 1 image
    images = 1;
    detector_images_1 = repmat(5, [3 n images]);
    views_1 = [0]
    shots = [shots images];

    for i=1:images
        detector_images_1(:,:,i) = Tumor_Projector(views_1(i),tumor);
    end 
    
    figure(1);
    hold on;
    title('Test 1, 0 degrees, 1 image');
    [shape_1, volume_1] = Tumor_Reconstructor(views_1, detector_images_1);
    s1 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_1);
    volumes = [volumes volume_1];
    
    %Test 2, 180 degrees, 2 images
    images = 2;
    shots = [shots images];
    detector_images_2 = repmat(5, [3 n images]);
    views_2 = angles(1:12:end)

    for i=1:images
        detector_images_2(:,:,i) = Tumor_Projector(views_2(i),tumor);
    end
    
    figure(2);
    hold on;
    title('Test 2, 180 degrees, 2 images');
    [shape_2, volume_2] = Tumor_Reconstructor(views_2, detector_images_2);

    s2 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_2);
    volumes = [volumes volume_2];

    %Test 3, 90 degrees, 4 images
    images = 4;
    shots = [shots images];
    detector_images_3 = repmat(5, [3 n images]);
    views_3 = angles(1:6:end)

    for i=1:images
        detector_images_3(:,:,i) = Tumor_Projector(views_3(i),tumor);
    end 
    
    figure(3);
    hold on;
    
    title('Test 3, 90 degrees, 4 images');
    [shape_3, volume_3] = Tumor_Reconstructor(views_3, detector_images_3);

    s3 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_3);
    volumes = [volumes volume_3];
    
    
    %Test4, 60 degrees, 6 images
    images = 6;
    shots = [shots images];
    detector_images_4 = repmat(5, [3 n images]);
    views_4 = angles(1:4:end)

    for i=1:images
        detector_images_4(:,:,i) = Tumor_Projector(views_4(i),tumor);
    end
    
    figure(4);
    hold on;
    title('Test4, 60 degrees, 6 images');
    [shape_4, volume_4] = Tumor_Reconstructor(views_4, detector_images_4);
    s4 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_4);
    volumes = [volumes volume_4];
    

    %Test4, 30 degrees, 12 images
    images = 12;
    shots = [shots images];
    detector_images_5 = repmat(5, [3 n images]);
    views_5 = angles(1:2:end)

    for i=1:images
        detector_images_5(:,:,i) = Tumor_Projector(views_5(i),tumor);
    end
   
    figure(5);
    hold on;
    title('Test5, 30 degrees, 12 images');
    [shape_5, volume_5] = Tumor_Reconstructor(views_5, detector_images_5);
    s5 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_5);
    volumes = [volumes volume_5];

    
    %Test5, 15 degrees, 24 images
    images = 24;
    shots = [shots images];
    detector_images_6 = repmat(5, [3 n images]);
    views_6 = angles(1:1:end)

    for i=1:images
        detector_images_6(:,:,i) = Tumor_Projector(views_6(i),tumor);
    end 
    
    figure(6);
    hold on;
    title('Test6, 15 degrees, 24 images');
    [shape_6, volume_6] = Tumor_Reconstructor(views_6, detector_images_6);
    s6 = scatter3(tumor(1,:)',tumor(2,:)',tumor(3,:)','red','filled');
    hold off;
    disp(volume_6);
    volumes = [volumes volume_6];
    
    figure(7);
    hold on;
    plot(shots',volumes');
    title('Number of Imaging Angles vs Volume of Reconstructed Tumor');
    ylabel('Number of Images');
    xlabel('Volume (mm^3)');
    hold off;
    
    return;
end