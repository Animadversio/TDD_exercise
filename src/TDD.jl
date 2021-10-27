module TDD
using DataStructures
# Write your package code here.
function get_neighbors(graph, idx)::Set{Int}
    # assume graph is represented in list format
    neighb = Set(graph[idx])
    return push!(neighb,idx)
end

function get_connected(graph, idx)::Set{Int}
    connected = Set([idx])
    to_visit = Stack{Int}()
    push!(to_visit,idx)
    while ~ isempty(to_visit)
        i = pop!(to_visit)
        push!(connected, i)
        neighb = get_neighbors(graph, i)
        for k in neighb
            if ! (k in connected)
            push!(to_visit, k)
            end
        end
    end
    return connected
end

end
