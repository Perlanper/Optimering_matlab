colNames = {'w','x1', 'x2', 's1', 's2', 's3', 's4', 's5', 'a1', 'a2', 'b'};
rowNames = {'w', 'a1', 'a2', 's3', 's4', 's5'};
M = [1 0 0 0 0 0 0 0 -1 -1 0;
     0 1 1 -1 0 0 0 0 1 0 3;
     0 5 2 0 -1 0 0 0 0 1 10;
     0 2 -1 0 0 1 0 0 0 0 10;
     0 1 1 0 0 0 1 0 0 0 7;
     0 -1 3 0 0 0 0 1 0 0 9];
 
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 %a1 and a2 row into w row
 M(1,:) = (M(1,:) + M(2,:) + M(3,:));
 
 disp('--------------------------');
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('In: x1')
 for i=2:6
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,11)/M(i,2)))
 end
 disp('Ut: a2 ');
 rowNames = {'w', 'a1', 'x1', 's3', 's4', 's5'};

 M(3,:) = (M(3,:) / 5);
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('x1*-6 -> w, x1*-1 -> a1, x1*-2 -> s3, x1*-1 -> s4, x1*1 -> s5')
 
 M(1,:) = (M(1,:) - 6*M(3,:));
 M(2,:) = (M(2,:) - M(3,:));
 M(4,:) = (M(4,:) - 2*M(3,:));
 M(5,:) = (M(5,:) - M(3,:));
 M(6,:) = (M(6,:) + M(3,:));
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))

 newline;
 
 disp('--------------------------');
 disp('next iteration')
 disp('--------------------------');
 
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('In: x2')
 for i=2:6
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,11)/M(i,3)))
 end
 disp('Ut: a1')
 rowNames = {'w', 'x2', 'x1', 's3', 's4', 's5'};

 M(2,:) = (M(2,:) / 0.6);
 disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
 disp('a1*-0.6 -> w, a1*-0.4 -> x1, a1*1.8 -> s3, a1*-0.6 -> s4, a1*-3.4 -> s5')

 M(1,:) = (M(1,:) - 0.6*M(2,:));
 M(3,:) = (M(3,:) - 0.4*M(2,:));
 M(4,:) = (M(4,:) + 1.8*M(2,:));
 M(5,:) = (M(5,:) - 0.6*M(2,:));
 M(6,:) = (M(6,:) - 3.4*M(2,:));
  for i=1:6
    for j=1:length(M)
        if abs(M(i,j)) < 0.000001
            M(i,j) = 0;
        end
    end
  end
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))



fprintf('******\nTillåten punkt funnen med s1 och s2 som nollvariabler.\n******\n')
fprintf('Stoppa in funktionen max z = 10x1 + 2x2 på w raden och ta bort a1 och a2\n******\n')

colNames = {'z','x1', 'x2', 's1', 's2', 's3', 's4', 's5', 'b'};
rowNames = {'z', 'x2', 'x1', 's3', 's4', 's5'};
M(:,9) = [];
M(:,9) = [];
z = [1 -10 -2 0 0 0 0 0 0];
for i=1:length(M)
    M(1,i) = z(i);
end
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('2*x2 -> z, 10*x1 -> z')

M(1,:) = M(1,:) + 2*M(2,:);
M(1,:) = M(1,:) + 10*M(3,:);
for i=1:6
    for j=1:length(M)
        if abs(M(i,j)) < 0.0001
            M(i,j) = 0;
        end
    end
end
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))

disp('In: s2')
for i=2:6
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,9)/M(i,5)))
end
disp('Ut: x2')
rowNames = {'z', 's2', 'x1', 's3', 's4', 's5'};

M(2,:) = (M(2,:) / M(2,5));
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('s2*2.6667 -> z, s2*0.33333 -> x1, s2*-1 -> s3, s2*1.3333 -> s5')

M(1,:) = M(1,:) - M(2,:) * M(1,5)/M(2,5);
M(3,:) = M(3,:) - M(2,:) * M(3,5)/M(2,5);
M(4,:) = M(4,:) - M(2,:) * M(4,5)/M(2,5);
M(6,:) = M(6,:) - M(2,:) * M(6,5)/M(2,5);

disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))

fprintf('\n-----------------\nNext iteration\n-----------------\n')
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('In: s1')
for i=2:6
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,9)/M(i,4)))
end
disp('Ut: s3')
rowNames = {'z', 's2', 'x1', 's1', 's4', 's5'};
M(4,:) = (M(4,:) / M(4,4));
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('s1*10 -> z, s1*5 -> s2, s1*1 -> x1, s1*-1 -> s4, s1*1 -> s5')

M(1,:) = M(1,:) - M(4,:) * M(1,4)/M(4,4);
M(2,:) = M(2,:) - M(4,:) * M(2,4)/M(4,4);
M(3,:) = M(3,:) - M(4,:) * M(3,4)/M(4,4);
M(5,:) = M(5,:) - M(4,:) * M(5,4)/M(4,4);
M(6,:) = M(6,:) - M(4,:) * M(6,4)/M(4,4);
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))

fprintf('\n-----------------\nNext iteration\n-----------------\n')
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('In: x2')
for i=2:6
     fprintf('row %s: %.2f.\n',rowNames{i},(M(i,9)/M(i,3)))
end
disp('Ut: s4')
rowNames = {'z', 's2', 'x1', 's3', 'x2', 's5'};
M(5,:) = (M(5,:) / M(5,3));
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))
disp('x2*7 -> z, x2*4.5 -> s2, x2*0.5 -> x1, x2*1.5 -> s3, x2*-2.5 -> s5')

M(1,:) = M(1,:) - M(5,:) * M(1,3)/M(5,3);
M(2,:) = M(2,:) - M(5,:) * M(2,3)/M(5,3);
M(3,:) = M(3,:) - M(5,:) * M(3,3)/M(5,3);
M(4,:) = M(4,:) - M(5,:) * M(4,3)/M(5,3);
M(6,:) = M(6,:) - M(5,:) * M(6,3)/M(5,3);
disp(array2table(M,'RowNames',rowNames,'VariableNames',colNames))

fprintf('a] Skuggpriset för s4 är 4.6667\nb] Ändringen blir 59.333 + 4.6667 = 64\n')

disp('c]')
Binversb = M(2:6,9);
Binvers = M(2:end,4:8);
for i=1:5
    for j=1:2
        Binvers(i,j) = Binvers(i,j) * -1 ;
    end
end
delta = [0 0 0 1 0]';
deltab = Binvers*delta








