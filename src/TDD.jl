module TDD

# Write your package code here.
function get_neighbors(graph, idx)
    # assume graph is represented in list format
    return push!(graph[idx],idx)
end

end
