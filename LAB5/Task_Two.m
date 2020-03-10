%Sudoko
type drawSudoku

n = 17; % amount of leads in puzzle

A = zeros(n,3); % define A

A(1,:) = [2 6 3];
A(2,:) = [2 8 8];
A(3,:) = [2 9 5];
A(4,:) = [3 3 1];
A(5,:) = [3 5 2];
A(6,:) = [4 4 5];
A(7,:) = [4 6 7];
A(8,:) = [5 3 4];
A(9,:) = [5 7 1];
A(10,:) = [6 2 9];
A(11,:) = [7 1 5];
A(12,:) = [7 8 7];
A(13,:) = [7 9 3];
A(14,:) = [8 3 2];
A(15,:) = [8 5 1];
A(16,:) = [9 5 4];
A(17,:) = [9 9 9];
% A

drawSudoku(A)

x = optimvar('x', 9, 9, 9, 'Type', 'integer', 'LowerBound', 0 , 'UpperBound', 1);

sudpuzzle = optimproblem;

mulla = ones(1,1,9);
mulla = cumsum(mulla, 3);

sudpuzzle.Objective = sum(sum(sum(x,1),2).*mulla);

sudpuzzle.Constraints.consx = sum(x,1) == 1;
sudpuzzle.Constraints.consy = sum(x,2) == 1;
sudpuzzle.Constraints.consz = sum(x,3) == 1;

majorg = optimconstr(3,3,9);

for i=1:3
    for j=1:3
        arr = x(3 * (i-1)+ 1:3 * (i-1) + 3,3 * (j-1) + 1:3 * (j-1) + 3,:);
        majorg(i,j,:) = sum(sum(arr,1),2) == ones(1,1,9);
    end
end

sudpuzzle.Constraints.majorg = majorg;

for v=1:size(A,1)
    x.LowerBound(A(v,1),A(v,2),A(v,3)) = 1;
end 

sudosoln = solve(sudpuzzle);

sudosoln.x = round(sudosoln.x);
 
y = ones(size(sudosoln.x));

for k = 2:9
    y(:,:,k) = k;
end

S = sudosoln.x.*y;
S = sum(S,3); 
drawSudoku(S)