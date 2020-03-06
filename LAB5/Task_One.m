%task 1 

% (a)

% max z = 30x1 + 18x2
% då 8x1 + 5x2 <= 31
%   - x1 + 2x2 <= 6
%   x1,x2 >= 0, heltal 

f = [30;18]; %objective function
intcon = [1,2]; % integers
A = [8 5; -1 2]; %Constraints
b = [31 6]; % values 

x = intlinprog(-f, intcon, A, b, [],[], zeros(1:2)); % solver
disp(x) % display


% (b)

% max w = 3x1 + 2x2
% då 4x1 + 5x2 <= 7
%    2x1 + 3x2 <= 4
%   x1,x2 "belongs to" {0,1,2}


f = [3;2]; %objective function
intcon = [1,2]; % integers
A = [4 5; 2 3]; %Constraints
b = [7 4]; % values 

x = intlinprog(-f, intcon, A, b, [],[], zeros(1:2), ones(1:2)*2); % solver
disp(x) % display