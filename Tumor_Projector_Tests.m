
function Tumor_Projector_Tests()
% (1) run on a sphere placed in center, r = 3cm
    n = 40;
    m = 3;
    gt_x = [];
    gt_y = [];
    gt_z = [];
    ctr = [0 0 0];
    %r = 30mm = 3cm
    radius = 30;
    %code used to generate sphere was adapted from my own HW1, filename - 
    % Sphere_Reconstruction.m, changed to do construct entire sphere
    for i=1:n
        theta = (2*pi-0).*rand(1)+0;
        u = (-1)+rand(1)*(1-(-1));
        coord = [(cos(theta)*sqrt(1-u^2)) (sin(theta)*sqrt(1-u^2)) (u)];
        gt_x = [gt_x radius*coord(1)+ctr(1)];
        gt_y = [gt_y radius*coord(2)+ctr(2)];
        gt_z = [gt_z radius*coord(3)+ctr(3)];
    end 
    figure(1)
    hold on;
    title("Test1 - Tumor Projection - sphere at 0 degrees with radius 30mm");
    scatter3(gt_x',gt_y',gt_z');
    test1 = [gt_x;gt_y;gt_z];
    Q1 = Tumor_Projector(0, test1);
    hold off;

% (2) run on an ellipsoid placed in center of c-arm coord
    % in assignment a=1,b=20,c=30 cm -> changed to mm
     a = 10;
     b = 20;
     c = 30;
     test2 = Generate_Ellipsoid([0 0 0],a,b,c,n);
%     
%     % (a) alpha = 0
     figure(2)
     hold on;
     title("Test2 - Tumor Projection - ellipsoid at 0 degrees");
     scatter3(test2(1,:)', test2(2,:)', test2(3,:)')
     Q2a = Tumor_Projector(0, test2);
     hold off;
    
%     
%     % (b) alpha = 90
     figure(3)
     hold on;
     title("Test3 - Tumor Projection - ellipsoid at 90 degrees");
     scatter3(test2(1,:)', test2(2,:)', test2(3,:)')
     Q2b = Tumor_Projector(90, test2);
     hold off;
    
%     

end