
struct Interval
    min::Float64
    max::Float64
end

Base.minimum(iv::Interval) = iv.min
Base.maximum(iv::Interval) = iv.max

Base.in(x::Real, iv::Interval) = (x <= iv.max) & (x >= iv.min)

Base.issubset(iv1::Interval, iv2::Interval) = (iv1.max <= iv2.max) & (iv1.min >= iv2.min)

Base.isempty(iv::Interval) = iv.max < iv.min 

const ∅ = Interval(1, -1)

Base.:(==)(iv1::Interval, iv2::Interval) = ((iv1.max == iv2.max) & (iv1.min == iv2.min)) | ( isempty(iv1) & isempty(iv2) )

Base.intersect(iv1::Interval, iv2::Interval) = Interval(max(iv1.min,iv2.min), min(iv1.max,iv2.max))

function Base.show(io::IO, mime::MIME"text/plain", iv::Interval)
    if isempty(iv)
        print(io,"∅")
    else
        print(io,"\u301a$(iv.min), $(iv.max)\u301b")
    end
end