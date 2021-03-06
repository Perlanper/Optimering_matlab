clear;
%min z = t15 - t1

M = [-1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 20;
    0 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 10;
    0 -1 0 1 0 0 0 0 0 0 0 0 0 0 0 8;
    0 0 -1 0 1 0 0 0 0 0 0 0 0 0 0 6;
    0 0 0 -1 0 0 0 0 1 0 0 0 0 0 0 8;
    0 0 0 0 -1 1 0 0 0 0 0 0 0 0 0 4;
    0 0 0 0 -1 0 1 0 0 0 0 0 0 0 0 6;
    0 0 0 0 -1 0 0 1 0 0 0 0 0 0 0 6;
    0 0 0 0 -1 0 0 0 0 1 0 0 0 0 0 4;
    0 0 0 0 0 0 -1 0 0 0 1 0 0 0 0 6;
    0 0 0 0 0 0 1 0 0 -1 0 0 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 -1 1 0 0 0 8;
    0 0 0 0 0 0 0 0 0 0 0 -1 0 1 0 4;
    0 0 0 0 0 0 0 0 -1 0 0 0 1 0 0 3;
    0 0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 -1 1 3];

b = M(2:17,16)
c = M(1,1:15)'
A = M(2:17,1:15)

options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x,fval,exitflag,output,lambda1] = linprog(c,-A,-b ,[],[],[],[],[],options);
% -A,-b because of max-problem
disp(x)
disp(fval)
disp(lambda1)
%fprintf(""

disp("=================== dualen =======================");
-b;
A'; %Transpose to get dual
c';
Agr = -eye(16);
Bgr = zeros(16,1);

options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x,fval,exitflag,output,lambda] = linprog(-b,Agr,Bgr ,A',c',zeros(size(b)),[],[],options);
disp(x)
disp(fval)
disp(lambda)