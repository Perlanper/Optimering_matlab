clear;
%min z = t15 - t1

M = [-1 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0;
    -1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 20;
    0 -1 1 0 0 0 0 0 0 0 0 0 0 0 0 10;
    0 0 -1 1 0 0 0 0 0 0 0 0 0 0 0 6;
    0 0 0 -1 1 0 0 0 0 0 0 0 0 0 0 4;
    0 0 0 -1 0 1 0 0 0 0 0 0 0 0 0 6;
    0 0 0 -1 0 0 1 0 0 0 0 0 0 0 0 6;
    0 0 0 -1 0 0 0 1 0 0 0 0 0 0 0 4;
    0 0 0 0 0 0 -1 1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 0 -1 1 0 0 0 0 0 0 6;
    0 0 0 0 0 0 0 0 -1 1 0 0 0 0 0 8;
    0 0 0 0 0 0 0 0 0 -1 0 0 0 1 0 4;
    0 -1 0 0 0 0 0 0 0 0 1 0 0 0 0 8;
    0 0 0 0 0 0 0 0 0 0 -1 1 0 0 0 5;
    0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0 3;
    0 0 0 0 0 0 0 0 0 0 0 0 -1 1 0 0;
    0 0 0 0 0 0 0 0 0 0 0 0 0 -1 1 3];

b = M(2:17,16)
c = M(1,1:15)'
A = M(2:17,1:15)

options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x,fval,exitflag,output] = linprog(c,-A,-b ,[],[],zeros(size(c)),[],[],options);
% -A,-b because of max-problem
disp(x)

disp("=================== dualen =======================");
-b;
A'; %Transpose to get dual
c';
Agr = -eye(16);
Bgr = zeros(16,1);


options = optimoptions('linprog', 'Algorithm', 'dual-simplex');
[x,fval,exitflag,output,lambda] = linprog(-b,Agr,Bgr ,A',c',zeros(size(c)),[],[],options);
disp(x)
 
sum(x'.*b)
%%

% 
% t1 = optimvar('t1');
% t2 = optimvar('t2');
% t3 = optimvar('t3');
% t4 = optimvar('t4');
% t5 = optimvar('t5');
% t6 = optimvar('t6');
% t7 = optimvar('t7');
% t8 = optimvar('t8');
% t9 = optimvar('t9');
% t10 = optimvar('t10');
% t11 = optimvar('t11');
% t12 = optimvar('t12');
% t13 = optimvar('t13');
% t14 = optimvar('t14');
% t15 = optimvar('t15');
% 
% linprob = optimproblem('ObjectiveSense','min')
% linprob.Objective=t14-t1;
% 
% linprob.Constraints.cons1 = t2 - t1 >= 20;
% linprob.Constraints.cons2 = t3 - t2 >= 10;
% linprob.Constraints.cons3 = t4 - t2 >= 8;
% linprob.Constraints.cons4 = t5 - t3 >= 6;
% linprob.Constraints.cons5 = t7 - t5 >= 4;
% linprob.Constraints.cons6 = t8 - t5 >= 6;
% linprob.Constraints.cons7 = t9 - t5 >= 6;
% linprob.Constraints.cons8 = t10 - t5 >= 4;
% linprob.Constraints.cons9 = t10 - t8 >= 0;
% linprob.Constraints.cons10 = t11 - t10 >= 6;
% linprob.Constraints.cons11 = t12 - t11 >= 8;
% linprob.Constraints.cons12 = t13 - t12 >= 4;
% linprob.Constraints.cons13 = t14 - t13 >= 3;
% linprob.Constraints.cons14 = t6 - t4 >= 5;
% linprob.Constraints.cons15 = t15 - t6 >= 3;
% linprob.Constraints.cons16 = t13 - t15 >= 0;
% 
% 
% linsol = solve(linprob);
% 
% evaluate(linprob.Objective,linsol)
% 
% tbl = struct2table(linsol)
% 
% 
% M'
% 
% n1 = optimvar('n1');
% n2 = optimvar('n2');
% n3 = optimvar('n3');
% n4 = optimvar('n4');
% n5 = optimvar('n5');
% n6 = optimvar('n6');
% n7 = optimvar('n7');
% n8 = optimvar('n8');
% n9 = optimvar('n9');
% n10 = optimvar('n10');
% n11 = optimvar('n11');
% n12 = optimvar('n12');
% n13 = optimvar('n13');
% n14 = optimvar('n14');
% n15 = optimvar('n15');
% n16 = optimvar('n16');
% 
% 
% linprob2 = optimproblem('ObjectiveSense','max')
% linprob2.Objective=20*n1+10*n2+6*n3+4*n4+6*n5+6*n6+4*n7+0*n8+6*n9+8*n10+4*n11+8*n12+5*n13+3*n14+0*n15+3*n16;
% 
% linprob2.Constraints.cons1 = -n1 == -1;
% linprob2.Constraints.cons2 = n1 - n2 - n12 == 0;
% linprob2.Constraints.cons3 = n2-n3 == 0;
% linprob2.Constraints.cons4 = n3-n4-n5-n6-n7 == 0;
% linprob2.Constraints.cons5 = n4 == 0;
% linprob2.Constraints.cons6 = n5 == 0;
% linprob2.Constraints.cons7 = n6 - n8 == 0;
% linprob2.Constraints.cons8 = n7 + n8 - n9 == 0;
% linprob2.Constraints.cons9 = n9 -n10 == 0;
% linprob2.Constraints.cons10 = n10 - n11 == 0;
% linprob2.Constraints.cons11 = n12 - n11 == 0;
% linprob2.Constraints.cons12 = n13 - n14 == 0;
% linprob2.Constraints.cons13 = n14 - n15 == 0;
% linprob2.Constraints.cons14 = n15 - n16 == 0;
% linprob2.Constraints.cons15 = n16 == 1;
% 
% 
% linsol2 = solve(linprob2);
% 
% evaluate(linprob2.Objective,linsol2)
% 
% tb2 = struct2table(linsol2)

