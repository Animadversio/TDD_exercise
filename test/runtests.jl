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
    # @test TDD.get_neighbors(graph, 1) == [1,2,3] # note the order.
    # @test TDD.get_neighbors(graph, 2) == [1,2]
    # @test TDD.get_neighbors(graph, 5) == [4,5]
    # @test TDD.get_neighbors(graph, 5) == [4,5] # test if graph will change after one evaluation of function.
    # @test TDD.get_neighbors(dir_graph, 2) == [2,3,5]
    # @test TDD.get_neighbors(dir_graph, 5) == [4,5]
    # Test for the 1st problem, neighbors
    @test all(i in TDD.get_neighbors(graph, 1) for i in graph[1])
    @test all(i in TDD.get_neighbors(graph, 5) for i in graph[5])
    @test all(i in TDD.get_neighbors(dir_graph, 3) for i in dir_graph[3])
    @test all(i in TDD.get_neighbors(dir_graph, 4) for i in dir_graph[4])
    for i in 1:length(dir_graph)
        @test i in TDD.get_neighbors(dir_graph, i) # include the starting index as neighbor
    end
    # Test for the 2nd problem
    @test all(i in TDD.get_connected(graph, 1) for i in [1,2,3])
    @test all(i in TDD.get_connected(graph, 4) for i in [4,5])
    @test all(i in TDD.get_connected(dir_graph, 1) for i in 1:5)
    # Test for the 3rd problem 
    @test all(comp in TDD.connected_components(graph) for comp in [Set([1,2,3]),Set([4,5])])
    @test Set([1:5...]) in TDD.connected_components(dir_graph)
end
