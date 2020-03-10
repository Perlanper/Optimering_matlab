%task 1 

% (a)
disp("--------b---------manual");

% max z = 30x1 + 18x2
% when 8x1 + 5x2 <= 31
%   - x1 + 2x2 <= 6
%   x1,x2 >= 0, heltal 

f = [30;18]; %objective function
intcon = [1,2]; % integers
A = [8 5; -1 2]; %Constraints
b = [31 6]; % values 
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz* = %f\nAdding constraint x1 <= 3, x1 >= 4 is outside of target area\n",x(1),x(2),-fval(1));

%Adding new constraint x1 <= 3
f = [30;18]; %objective function
A = [8 5; -1 2;1 0]; %Constraints
b = [31 6 3]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nAdding constraint x2 <= 1\n",x(1),x(2),-fval(1));

%Adding new constraint x2 <= 1

f = [30;18]; %objective function
A = [8 5; -1 2;1 0;0 1]; %Constraints
b = [31 6 3 1]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nPossible solution with integers found, no point to continue here, testing x2 >= 2\n",x(1),x(2),-fval(1));

%Adding new constraint x2 >= 2 instead of x2 <= 1

f = [30;18]; %objective function
A = [8 5; -1 2;1 0;0 -1]; %Constraints
b = [31 6 3 -2]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nSolution with a better value than 108 as in previous integer solution, testing x1 <= 2\n x1 >= 3 is outside of the solution if x2 >= 2\n",x(1),x(2),-fval(1));


%Adding new constraint x1 <= 2 instead of x1 <= 3

f = [30;18]; %objective function
A = [8 5; -1 2;1 0;0 -1]; %Constraints
b = [31 6 2 -1]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nBest integer solution found in x = (2,3)\n",x(1),x(2),-fval(1));


disp("--------a---------linprog");
[x, fval, exitflag, output] = intlinprog(-f, intcon, A, b, [],[], zeros(1:2)); % solver
fval %Obective function value
disp(x); % display


% (b)
disp("--------b---------manual");
% max w = 3x1 + 2x2
% when 4x1 + 5x2 <= 7
%    2x1 + 3x2 <= 4
%   x1,x2 "belongs to" {0,1,2}
% 
f = [3;2]; %objective function
A = [4 5; 2 3]; %Constraints
b = [7 4]; % values 
options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz* = %f\nTesting with x1 <= 1\n",x(1),x(2),-fval(1));

%Adding constraint x1 <= 1
f = [3;2]; %objective function
A = [4 5; 2 3;1 0]; %Constraints
b = [7 4 1]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nAdding constraint x2 <= 0\n",x(1),x(2),-fval(1));



%Adding constraint x2 <= 0
f = [3;2]; %objective function
A = [4 5; 2 3;1 0;0 1]; %Constraints
b = [7 4 1 0]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nInteger solution found, switching x2 constraint to x2 >= 1\n",x(1),x(2),-fval(1));

%Adding constraint x2 >= 1
f = [3;2]; %objective function
A = [4 5; 2 3;1 0;0 -1]; %Constraints
b = [7 4 1 -1]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\nAdding constraint x1 <= 0\n",x(1),x(2),-fval(1));

%Adding constraint x1 <= 0
f = [3;2]; %objective function
A = [4 5; 2 3;1 0;0 -1]; %Constraints
b = [7 4 0 -1]; % values 
[x, fval, exitflag, output] = linprog(-f, A, b, [],[],zeros(size(1:2)),[], options);
fprintf("x1 = %f x2 = %f\nz = %f\n2.666667 < 3, no need to continue, x1 >= 1 is not allowed, best solution in x=(1,0) with z = 3\n",x(1),x(2),-fval(1));


f = [3;2]; %objective function
intcon = [1,2]; % integers
A = [4 5; 2 3]; %Constraints
b = [7 4]; % values 

disp("--------b---------linprog");
[x,fval, exitflag, output] = intlinprog(-f, intcon, A, b, [],[], zeros(1:2), ones(1:2)*2); % solver
fval %Obective function value 
disp(x) % display