
% solve the shortest path with Dijkstras algorithm
clear;
%define graph
graph1 = zeros(8);
%   0 means that there is no edge from the first node to the other.
%   1 = a, 2 = c , 3 = e, 4 = f , 5 = d, 6 = b, 7 = g, 8 = h
%   row major order

graph1(1,2) = 47; %edge from node a to node c
graph1(1,3) = 70; %edge from node a to node e
graph1(1,4) = 24; %edge from node a to node f
graph1(2,3) = 23; %edge from node c to node e
graph1(2,5) = 88; %edge from node c to node d
graph1(2,6) = 55; %edge from node c to node b
graph1(2,7) = 66; %edge from node c to node g
graph1(3,6) = 31; %edge from node e to node b
graph1(3,7) = 42; %edge from node e to node g
graph1(4,5) = 120; %edge from node f to node d
graph1(4,2) = 25; %edge from node f to node c
graph1(5,8) = 29; %edge from node d to node h
graph1(6,5) = 31; %edge from node b to node d
graph1(6,7) = 74; %edge from node b to node g
graph1(6,8) = 79; %edge from node b to node h
graph1(7,8) = 66; %edge from node g to node h


% run Dijkstarts on graph 
[shortest_path, shortest_distance] = Dijkstras(graph1, 1, 8, 8);
s = [1 1 1 2 2 2 2 3 3 4 4 5 6 6 6 7];
t = [2 3 4 3 5 6 7 6 7 5 2 8 5 7 8 8];
w = [47 70 24 23 88 55 66 31 42 120 25 29 31 74 79 66]; 
d = digraph(s,t,w);
plot(d,'EdgeLabel',d.Edges.Weight)
fprintf("The shortest path is: ")
fprintf("(%d)-", shortest_path);
fprintf("> in letters (a)-(e)-(b)-(d)-(g)\n")
fprintf("The minimal distance is: %d\n", shortest_distance)