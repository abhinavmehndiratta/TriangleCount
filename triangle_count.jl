function triangle_count end

abstract type TriangleCountAlgorithm end

struct DODG <: TriangleCountAlgorithm end

@inline function insorted(item, collection; rev=false)
    n = length(collection)
    lo = 0
    hi = n+1
    lt = rev ? Base.isgreater : Base.isless
    @inbounds while hi-lo > 1
        m = lo + ((hi - lo) >>> 0x01)
        if lt(collection[m], item)
            lo = m
        else
            hi = m
        end
    end
    hi > n && return false
    return collection[hi] == item
end

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

struct ThreadedDODG <: TriangleCountAlgorithm end

function triangle_count(g::SimpleGraph{T}, ::ThreadedDODG) where T
    ntri = zeros(UInt64, nthreads())
    deg = degree(g)
    adjlist = [Vector{T}() for _ in vertices(g)]
    partitions = greedy_contiguous_partition(deg, nthreads())
    @threads for u_set in partitions
        @inbounds for u in u_set
            for v in neighbors(g, u)
                if deg[v] > deg[u] || (deg[v] == deg[u] && v > u)
                    push!(adjlist[u], v)
                end
            end
        end
    end
    partitions = greedy_contiguous_partition(map(v -> length(adjlist[v])^2, vertices(g)), nthreads())
    @threads for u_set in partitions
        tid = threadid()
        @inbounds for u in u_set
            adju = adjlist[u]
            lenu = length(adju)
            for i = 1:lenu
                v = adju[i]
                for j = i+1:lenu
                    w = adju[j]
                    wTov = (deg[v] > deg[w] || (deg[v] == deg[w] && v > w))
                    if (wTov && insorted(v, adjlist[w])) ||
                            (!wTov && insorted(w, adjlist[v]))
                        ntri[tid] += 1
                    end
                end
            end
        end
    end
    return Float64(sum(ntri))
end

struct MatrixTrace <: TriangleCountAlgorithm end

triangle_count(A::SparseMatrixCSC, ::MatrixTrace) = sum(A^2 .* A)/6
