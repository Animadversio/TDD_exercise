iv = Interval(0,1)
@test minimum(iv) == 0
@test maximum(iv) == 1
@test 0.5 in iv
@test !(-0.5 in iv)
@test (1.0 ∈ iv)

iv = Interval(-0.2,1)
@test minimum(iv) == -0.2
@test maximum(iv) == 1
@test -0.2 in iv
@test !(1.5 in iv)
@test (1.0 ∈ iv)

@test issubset(Interval(0,1),Interval(0,2))
@test !issubset(Interval(0,1),Interval(0.5,2))
@test !issubset(Interval(0,2),Interval(0.5,1))
@test !issubset(Interval(0,1),Interval(-0.5,0.5))
@test Interval(0,1) ⊆ Interval(0,2)
@test !(Interval(0,1) ⊆ Interval(0.5,2))
@test Interval(0,1) ⊈ Interval(0.5,2)
@test !(Interval(0.5,1) ⊈ Interval(0,2))


@test isempty(Interval(1,-1))
@test isempty(Interval(1,-0.5))
@test ~isempty(Interval(1,1))

@test intersect(Interval(1,-0.5), Interval(1,2)) == Interval(1,-1)
@test intersect(Interval(0,1), Interval(1,2)) == Interval(1,1)
@test intersect(Interval(0,1), Interval(0.5,2)) == Interval(0.5,1)
@test (Interval(0,1) ∩ Interval(-0.5,2)) == Interval(0,1)
@test (Interval(1,1) ∩ Interval(-0.5,2)) == Interval(1,1)
@test (Interval(1.1,1) ∩ Interval(1.05,2)) == Interval(1,-1)
@test (Interval(1.1,1) ∩ Interval(1.05,2)) == TDD.∅
@test (Interval(1,2) ∩ Interval(1.05,1.5)∩ Interval(0.7,1.3)) == ∩ Interval(1.05,1.3)