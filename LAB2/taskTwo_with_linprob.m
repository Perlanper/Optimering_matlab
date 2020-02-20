clear
clc

X1 = optimvar('X1','LowerBound',0);
X2 = optimvar('X2','LowerBound',0);
X3 = optimvar('X3','LowerBound',0);
%X7 = optimvar('X7','LowerBound',0); % adding variable 


linprob = optimproblem('ObjectiveSense','max');
linprob.Objective = 6*X1 + 4*X2 + 7*X3;

linprob.Constraints.cons1 = X1 + 2*X2 + 3*X3                <= 10;
linprob.Constraints.cons2 = 2*X1 + X2 + 3*X3                <= 6;
linprob.Constraints.cons3 = 3*X1 + 3*X2 + 4*X3              <= 13;
%linprob.Constraints.cons4 =                     X7          <= 2 - [0 2.4444 0.5185]*[3 0 1]';

linsol = solve(linprob);

evaluate(linprob.Objective,linsol)

tbl = struct2table(linsol);

vars = {'X1','X2', 'X3'};
outputvars = stack(tbl,vars,'NewDataVariableName','Amt','IndexVariableName','Var')

fprintf('a] z* = 20.6667, x* = (1.6667, 2.6667, 0)\n')
fprintf('b] Slacken blir [3, 0, 0] vi tog det från uppgiften där vi löste allt\n   själva för att vi vet inte hur man får fram värdena på slacken med linprog\n')
fprintf('c] De reducerade kostnaderna hittas på målfunktionsraden i kolumnerna under nollvarialberna som inte är slackvariabler,\n   alltså xTn och i detta fall har vi: rc = [0.4444, 0, 2.4074].\n')
