%max z = 6x1 + 4x2 + 7x3
%d�      x1  + 2x2 + 3x3 <= 10
%        2x1 + x2  + 3x3 <= 6
%        3x1 + 3x2 + 4x3 <= 13
%           x1,x2,x3 >= 0

colNames = {'z','x1', 'x2', 'x3', 's1', 's2', 's3', 'b'};
rowNames = {'z', 's1', 's2', 's3'};
M = [1 -6 -4 -7 0 0 0 0;
     0 1 2 3 1 0 0 10;
     0 2 1 3 0 1 0 6;
     0 3 3 4 0 0 1 13;];
 
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('In: x2')
 for i=2:4
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,8)/M(i,3)))
 end
 disp('Ut: x2 ');
 rowNames = {'z', 's1', 'x3', 's3'};
 M(3,:) = (M(3,:) / 3);
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('x3*7 -> z, x3*-3 -> s1, x3*-4 -> s3')
 
 M(1,:) = M(1,:) - M(3,:) * M(1,4)/M(3,4);
 M(2,:) = M(2,:) - M(3,:) * M(2,4)/M(3,4);
 M(4,:) = M(4,:) - M(3,:) * M(4,4)/M(3,4);
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 
 fprintf('------------\nNext Iteration\n------------\n')
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('In: x2')
 for i=2:4
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,8)/M(i,3)))
 end
 disp('Ut: s3 ');
 rowNames = {'z', 's1', 'x3', 'x2'};
 M(4,:) = (M(4,:) / M(4,3));
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('x2*1.6667 -> z, x2*-1 -> s1, x2*-0.33333 -> x3')
 
 M(1,:) = M(1,:) - M(4,:) * M(1,3)/M(4,3);
 M(2,:) = M(2,:) - M(4,:) * M(2,3)/M(4,3);
 M(3,:) = M(3,:) - M(4,:) * M(3,3)/M(4,3);
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 
 fprintf('------------\nNext Iteration\n------------\n')
 
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('In: x1')
 for i=2:4
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,8)/M(i,2)))
 end
 disp('Ut: x3 ');
 rowNames = {'z', 's1', 'x1', 'x2'};
 M(3,:) = (M(3,:) / M(3,2));
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('x1*1 -> z, x1*1.2 -> s1, x1*-0.2 -> x2')
 
 M(1,:) = M(1,:) - M(3,:) * M(1,2)/M(3,2);
 M(2,:) = M(2,:) - M(3,:) * M(2,2)/M(3,2);
 M(4,:) = M(4,:) - M(3,:) * M(4,2)/M(3,2);
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 fprintf('maximum i x1,x2,x3 = (1.6667,2.6667,0)\n\t\t\t\t z = 20.667\n')
 disp('a] Optimalbasen = {x1,x2,s1}')
 disp('b] Optimall�sningen z* = 20.667, x* = (1.6667, 2.6667, 0)')
 fprintf('c] Vi f�r en relaxation, fler variabler betyder fler till�tna l�sningar, s� det kan\n om�jligt bli en restriktion')
 fprintf('   rc = c_ny - Cbt*Binvers*a, d�r c_ny �r m�lfunktionskoefficient till den\n nya variabeln och a �r bivillkorskolumn samt rc �r den reducerade kostnaden f�r den nya variabeln\n')
 disp('d] nedan')
 c_ny = 2;
 a = [3 0 1];
 
 rc = c_ny - M(1,5:7)*a';
 
 x7 = [-rc 0 3 0]';

 
 M = [M(:, 1:7) x7 M(:, 8)];

colNames = {'z','x1', 'x2', 'x3', 's1', 's2', 's3', 'x7', 'b'};
rowNames = {'z', 's1', 'x1', 'x2'};
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('In: x7')
disp('Ut: x1')
rowNames = {'z', 's1', 'x7', 'x2'};

M(3,:) = (M(3,:) / 3);
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('x7*-1.3333 -> z')
M(1,:) = M(1,:) - M(3,:) * M(1,8)/M(3,8);
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('Nya optimum blir 21.407 - BIG BRIAN')
 
 
 
 