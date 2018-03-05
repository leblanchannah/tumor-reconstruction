
function E = Generate_Ellipsoid(ctr,a,b,c,n)
    counter = 1;
    E = zeros(3,n);
    while counter < n
        % where 10 mm = 1cm
        pt_x = (-1)+rand(1)*(1-(-1));
        pt_y = (-1)+rand(1)*(1-(-1));
        
        %scale x and y by the principle axis, move by ctr point - always
        % testing on ctr = [0 0 0]    
        pt_x = (pt_x + ctr(1))*a;
        pt_y = (pt_y + ctr(2))*b;
        
        %plug into ellipsoid equation, solve for z
        z_squared = c^2 * (1 - (pt_x^2/a^2) - (pt_y^2/b^2));
        if z_squared >= 0
            %if result is < 0, sqrt will produce imag numbers, keep generating
            %points until counter == n
            pt_z = sqrt(z_squared);
            neg_pt_z = -1*pt_z;
            E(:,counter) = [pt_x; pt_y; pt_z];
            temp = counter +1;
            E(:,temp) = [pt_x; pt_y; neg_pt_z];
            counter = counter + 2;
            % need to add +z and -z
        end
    end
    return;
end