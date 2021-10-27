iv = Interval(0,1)
@test minimum(iv) == 0
@test maximum(iv) == 1
@test 0.5 in iv
@test !(-0.5 in iv)

iv = Interval(-0.2,1)
@test minimum(iv) == -0.2
@test maximum(iv) == 1
@test -0.2 in iv
@test !(1.5 in iv)
