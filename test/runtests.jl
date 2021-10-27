using TDD
using Test

@testset "TDD.jl" begin
    # Write your tests here.
    graph = [
            [2, 3],
            [1], # list of nodes that can be reached from node 2
            [1], # ", node 3
            [5], # ", node 4
            [4]] # ", node 5
    dir_graph = [
        [2],
        [3,5], # list of nodes that can be reached from node 2
        [4], # ", node 3
        [1,2], # ", node 4
        [4]] # ", node 5
    @test TDD.get_neighbors(graph, 1) == [1,2,3]
    @test TDD.get_neighbors(graph, 2) == [1,2]
    @test TDD.get_neighbors(graph, 5) == [4,5]
    @test TDD.get_neighbors(graph, 5) == [4,5]
    @test TDD.get_neighbors(dir_graph, 2) == [2,3,5]
    @test TDD.get_neighbors(dir_graph, 5) == [4,5]
    for i in 1:length(dir_graph)
        @test i in TDD.get_neighbors(dir_graph, i)
    end
end
