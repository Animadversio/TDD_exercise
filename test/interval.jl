iv = Interval(0,1)
@test minimum(iv) == 0
@test maximum(iv) == 1

iv = Interval(-0.2,1)
@test minimum(iv) == -0.2
@test maximum(iv) == 1
