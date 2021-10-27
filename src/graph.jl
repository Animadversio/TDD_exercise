AdjMat = Matrix{Bool}
NeighborList = Vector{Vector{Int}}

function n_nodes(graph::NeighborList)
    return length(graph)
end

function n_nodes(graph::AdjMat)
    return size(graph,1)
end

function get_neighbors(graph::NeighborList, idx::Int)::Set{Int}
    # assume graph is represented in list format
    neighb = Set(graph[idx])
    return push!(neighb,idx)
end

function get_neighbors(graph::AdjMat, idx::Int)::Set{Int}
    # assume graph is represented in Adjacent matrix format
    neighb = Set([i for (i, islink) in enumerate(graph[idx,:]) if islink])
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


function connected_components(graph)
    components = []
    visited = Set{Int}([])
    for i in 1:n_nodes(graph)
        if (i in visited)
            continue
        end
        comp = get_connected(graph, i)
        push!(components, comp)
        union!(visited, comp) 
    end
    return components
end
