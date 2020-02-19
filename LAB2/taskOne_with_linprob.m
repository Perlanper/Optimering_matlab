clear
clc

X1 = optimvar('X1','LowerBound',0);
X2 = optimvar('X2','LowerBound',0);

linprob = optimproblem('ObjectiveSense','max');
linprob.Objective = 10*X1 + 2*X2;

linprob.Constraints.cons1 = X1 + X2     >= 3;
linprob.Constraints.cons2 = 5*X1 + 2*X2 >= 10;
linprob.Constraints.cons3 = 2*X1 - X2   <= 10;
linprob.Constraints.cons4 = X1 + X2     <= 7;
linprob.Constraints.cons5 = -X1 + 3*X2  <= 9;

linsol = solve(linprob);

evaluate(linprob.Objective,linsol)

tbl = struct2table(linsol);

vars = {'X1','X2'};
outputvars = stack(tbl,vars,'NewDataVariableName','Amt','IndexVariableName','Var')


