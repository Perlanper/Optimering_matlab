%   Xi = Antal hektoliter av cidertyp i 
%    i = 1, 2, 3, 4
%   Vi = {196 210 280 442}
%   Pi = {1.6 1.8 3.2 5.4}
%   Qi = {1.2 1.2 1.2 1.8}
%
%   max z = sum(Xi*Vi)
%   då      sum(Xi*Pi)      <= 80
%           sum(Xi*Qi)      <= 40
%           X1              >= 0.2*sum(Xi)
%           X2              >= 0.3*sum(Xi)
%                       Xi  >= 0

clear
clc

X1 = optimvar('X1','LowerBound',0);
X2 = optimvar('X2','LowerBound',0);
X3 = optimvar('X3','LowerBound',0);
X4 = optimvar('X4','LowerBound',0);

linprob = optimproblem('ObjectiveSense','max');
linprob.Objective = X1*196 + X2*210 + 280*X3 + X4*442;

linprob.Constraints.cons1 = X1*1.6 + X2*1.8 + X3*3.2 + X4*5.4 <=  80;
linprob.Constraints.cons2 = X1*1.2 + X2*1.2 + X3*1.2 + X4*1.8 <=  40;
linprob.Constraints.cons3 = X1                                >= 0.2*(X1 + X2 + X3 + X4);
linprob.Constraints.cons4 = X2                                >= 0.3*(X1 + X2 + X3 + X4);
% showproblem(linprob)
linsol = solve(linprob);


linsol = solve(linprob);

evaluate(linprob.Objective,linsol)

tbl = struct2table(linsol);

vars = {'X1','X2','X3','X4'};
outputvars = stack(tbl,vars,'NewDataVariableName','Amt','IndexVariableName','Var')


