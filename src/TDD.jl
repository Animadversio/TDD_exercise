module TDD

# Write your package code here.
function get_neighbors(graph, idx)::Set{Int}
    # assume graph is represented in list format
    neighb = Set(graph[idx])
    return push!(neighb,idx)
end

end
