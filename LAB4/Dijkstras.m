function [shortest_path, shortest_distance] = Dijkstras(graph,start_node, end_node, numOfnodes)
%DIJKSTRAS Summary of this function goes here
%   Detailed explanation goes here
distance = ones(1,numOfnodes)*Inf; % Initialize distance with Infinity 
distance(1) = 0; % distance to start node is 0 
cameFrom = ones(1,numOfnodes)*NaN; % Initialize cameFrom with NaN
NodeQueue = [1:numOfnodes];  % Initialize NodeQueue with all unexplored nodes
current_node = start_node; % sets the current node to the start node

while (length(NodeQueue) ~= 0)
if (current_node == start_node)
    [distance,cameFrom] = UpdateDistance(current_node, distance,cameFrom, graph); % update function for the nodes 
    NodeQueue(current_node) = [];  %removes node from the Queue -> node is explored
end
current_node = find(distance == min(distance(NodeQueue))); % finds the index of the min distance of the unexplored nodes 
if (distance(current_node) == Inf)
    break % checks if the node is reachable otherwise break
end
if (current_node == end_node)
    break % checks if the we are at the last node and breaks
end
[distance,cameFrom] = UpdateDistance(current_node, distance,cameFrom, graph);
NodeQueue(find(NodeQueue == current_node)) = []; %removes node from the Queue -> node is explored

end
shortest_path = FindShortestPath(end_node, cameFrom, start_node);
shortest_distance = distance(end_node);
end

