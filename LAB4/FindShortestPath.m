function [shortest_path] = FindShortestPath(end_node, cameFrom, start_node)
%FINDSHORTESTPATH Summary of this function goes here
%   Detailed explanation goes here
current_node = end_node;
shortest_path = [end_node]; % put end node in array
i = 2;
while current_node ~= start_node % do this until we are at start node
    shortest_path(i) = cameFrom(current_node); % checks where node came from and store
    current_node = cameFrom(current_node); % sets next node 
    i = i + 1;
end
shortest_path = flip(shortest_path); % flips the array 
end 

