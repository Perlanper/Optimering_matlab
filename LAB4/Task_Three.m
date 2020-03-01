% solve the shortest path with Dijkstras algorithm

%define graph
graph = zeros(8);
%   0 means that there is no edge from the first node to the other.
%   1 = a, 2 = c , 3 = e, 4 = f , 5 = d, 6 = b, 7 = g, 8 = h
%   row major order

graph(1,2) = 47; %edge from node a to node c
graph(1,3) = 70; %edge from node a to node e
graph(1,4) = 24; %edge from node a to node f
graph(2,3) = 23; %edge from node c to node e
graph(2,5) = 88; %edge from node c to node d
graph(2,6) = 55; %edge from node c to node b
graph(2,7) = 66; %edge from node c to node g
graph(3,6) = 31; %edge from node e to node b
graph(3,7) = 42; %edge from node e to node g
graph(4,5) = 120; %edge from node f to node d
graph(4,2) = 25; %edge from node f to node c
graph(5,8) = 29; %edge from node d to node h
graph(6,5) = 31; %edge from node b to node d
graph(6,7) = 74; %edge from node b to node g
graph(6,8) = 79; %edge from node b to node h
graph(7,8) = 66; %edge from node g to node h

A = min(find(graph(1,:)));

b = find(graph(1,:));

min((graph(1,min(b):max(b))));

graph(1,2:4);
% run Dijkstarts on graph 
[shortest_path shortest_distance] = Dijkstras(graph, 1, 8, 8)
fprintf("The shortest path is: ")
fprintf("(%d)-", shortest_path);
fprintf("> in letters (a)-(e)-(b)-(d)-(g)\n")
fprintf("The minimal distance is: %d\n", shortest_distance)