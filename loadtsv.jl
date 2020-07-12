# read TSV file and return a SimpleGraph{Int64}
function loadtsv(io::IO, ::Type{SimpleGraph})
    elist = Vector{Tuple{Int64, Int64}}()
    nvg = 0
    while !eof(io)
        r = r"(\w+)[\t](\w+)[\t](\w+)"
        s, d, _ = match(r, readline(io)).captures
        sint = parse(Int64, s)
        dint = parse(Int64, d)
        push!(elist, (sint, dint))
        nvg = max(nvg, max(sint, dint))
    end
    sort!(elist)
    neg = length(elist)÷2
    adjlist = [Vector{Int64}() for _ in 1:nvg]
    for (s, d) in elist
        push!(adjlist[s], d)
    end
    return SimpleGraph(neg, adjlist)
end

# read TSV file and return a SparseMatrixCSC{Int64, Int64}
function loadtsv(io::IO, ::Type{SparseMatrixCSC})
    I = Vector{Int64}()
    J = Vector{Int64}()
    while !eof(io)
        r = r"(\w+)[\t](\w+)[\t](\w+)"
        s, d, _ = match(r, readline(io)).captures
        push!(I, parse(Int64, s))
        push!(J, parse(Int64, d))
    end
    return sparse(I, J, 1)
end

function loadtsv(fn::String, T::Type)
    open(fn, "r") do io
        loadtsv(io, T)
    end
end
