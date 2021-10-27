
struct Interval
    min::Float64
    max::Float64
end

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max

Base.in(x::Real, iv::Interval) = (x <= iv.max) & (x >= iv.min)

Base.issubset(iv1::Interval, iv2::Interval) = (iv1.max <= iv2.max) & (iv1.min >= iv2.min)