
% A is projector point
% B is P, the point that the projection passes through
% plane_point is a point on the plane
% plane_norm is a vector normal to the plane
function  [point] = Line_And_Plane (A,B, plane_point, plane_norm) 
    AB = B-A;
    line = AB/norm(AB);
    d = dot(line,plane_norm);
    n = dot((plane_point-A),plane_norm);
    point = (n/d)*line + A;
    return;
end