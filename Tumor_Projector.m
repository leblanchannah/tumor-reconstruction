
% alpha is projection angle
% P is matrix of tumor points
% returns Q - contour of points projected onto detector
function Q = Tumor_Projector(alpha, P)
     %for val in P,
     %project and get intersection
     %make tumor contour
     %return points of contour
     [m,n] = size(P);
     Q = [];
     for col = 1:n
         Q = [Q (Point_Projector(alpha,P(1:m, col)'))];
     end 
end