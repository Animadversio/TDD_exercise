
struct Interval
    min::Float64
    max::Float64
end

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max