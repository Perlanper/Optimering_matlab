function [distance, cameFrom] = UpdateDistance(current_node,distance,cameFrom, graph)
%UPDATE_DISTANCE Summary of this function goes here
%   Detailed explanation goes here
target_nodes = find(graph(current_node,:)); % to find the successors of the current node
for i=1:length(target_nodes)
    if (distance(target_nodes(i)) > distance(current_node) + graph(current_node, target_nodes(i))) % if new way is better update else do nothing 
distance(target_nodes(i)) = distance(current_node)+ graph(current_node, target_nodes(i)); % updates the distance with the distance allready walked 
cameFrom(target_nodes(i)) = current_node; % updates cameFrom vector with the the current node
    end 
end

end

