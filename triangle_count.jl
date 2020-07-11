function triangle_count end

abstract type TriangleCountAlgorithm end

struct DODG <: TriangleCountAlgorithm end

function triangle_count(g::SimpleGraph{T}, ::DODG) where T
    ntri = UInt64(0)
    deg = degree(g)
    adjlist = [Vector{T}() for _ in vertices(g)]
    @inbounds for u in vertices(g)
        for v in neighbors(g, u)
            if deg[v] > deg[u] || (deg[v] == deg[u] && v > u)
                push!(adjlist[u], v)
            end
        end
    end
    @inbounds for u in vertices(g)
        adju = adjlist[u]
        lenu = length(adju)
        for i = 1:lenu
            v = adju[i]
            for j = i+1:lenu
                w = adju[j]
                wTov = (deg[v] > deg[w] || (deg[v] == deg[w] && v > w))
                if (wTov && insorted(v, adjlist[w])) ||
                        (!wTov && insorted(w, adjlist[v]))
                    ntri += 1
                end
            end
        end
    end
    return Float64(ntri)
end

struct MatrixTrace <: TriangleCountAlgorithm end

triangle_count(A::SparseMatrixCSC, ::MatrixTrace) = sum(A^2 .* A)/6
