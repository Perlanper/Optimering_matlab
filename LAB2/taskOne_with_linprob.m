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

options = optimoptions('linprog','Algorithm','interior-point','Display','final');

linsol = solve(linprob, 'Options', options);
evaluate(linprob.Objective,linsol)

tbl = struct2table(linsol);

vars = {'X1','X2'};
outputvars = stack(tbl,vars,'NewDataVariableName','Amt','IndexVariableName','Var')

fprintf('a] Optimall�sningen �r z*=59.3333 x*= (5.6667, 1.3333)\n')
fprintf('b] Slacken blir [21, 4 ,0 , 0, 10.6667] vi tog det fr�n uppgiften d�r vi l�ste allt\n   sj�lva f�r att vi vet inte hur man f�r fram v�rdena p� slacken med linprog\n')
fprintf('c] De reducerade kostnaderna hittas i kolumnerna under nollvarialberna som inte �r slackvariabler,\n   allts� xTn och i detta fall har vi inga s�dana nollvariabler dvs rc = 0.\n')


