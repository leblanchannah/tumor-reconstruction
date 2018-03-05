
% Point_Projector_Tests runs 5 tests on point_projector.m
function Point_Projector_Tests()
%test1 - angle 0, P = [0 0 0], Q = [0 0 0]
    figure(1);
    hold on;
    title("0 degrees, [0 0 0]");
    Q1 = Point_Projector(0, [0 0 0])
    

%test2 - angle 90, P = [0 0 0], Q = [0 0 0]
    figure(2);
    hold on;
    title("90 degrees, [0 0 0]");
    Q2 = Point_Projector(90, [0 0 0])

%test3 - angle 0, P = [10 10 10], Q = [20 20 0]
    figure(3);
    hold on;
    title("0 degrees, [10 10 10]");
    Q3 = Point_Projector(0, [10 10 10])

%test4 - angle 0, P = [0 10 0], Q = [0 0 0]
    figure(4);
    hold on;
    title("0 degrees, [0 10 0]");
    Q4 = Point_Projector(0, [0 10 0])

%test5- angle 45, P = [0 10 0], Q = []
    figure(5);
    hold on;
    title("90 degrees, [0 10 0]")
    Q5 = Point_Projector(90, [0 10 0]);
    return;
end