%    Xi = antal ton av stålstänger i
%    Yi = konstanden per ton av legeratstål i
%    Xi => [6500 5030 4100 2800]


f = [5*6500 3*5030 4*4100 6*2800 5340 4290 4020 1001]
intcon = [1,2,3,4]
A = [5 3 4 6 1 1 1 1; 0.05 0.04 0.05 0.03 0.08 0.07 0.06 0.03; 0.03 0.03 0.04 0.04 0.06 0.07 0.08 0.09]
b = [25, 0.05*25, 0.05*25]

x = intlinprog(f, intcon, A, b, [],[], zeros(size(b)))





%
%
%
%
%
%
%
%
%
%
%
%
%
%