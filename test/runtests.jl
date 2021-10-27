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
    @test TDD.get_neighbors(graph, 1) == [1,2,3]
    @test TDD.get_neighbors(graph, 2) == [1,2]
    @test TDD.get_neighbors(graph, 5) == [4,5]
end
