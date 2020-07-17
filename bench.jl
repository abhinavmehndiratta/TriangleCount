using SparseArrays, LightGraphs
using LightGraphs: greedy_contiguous_partition
using LightGraphs.SimpleGraphsCore: SimpleGraph
using Base.Threads

include("loadtsv.jl")
include("triangle_count.jl")

gpath = ARGS[1]
SG = loadtsv(gpath, SimpleGraph)
A = loadtsv(gpath, SparseMatrixCSC)

println("|V| = ", nv(SG), " |E| = ", ne(SG))

println("dodg: ", "number of triangles = ", triangle_count(SG, DODG()), ", time = ", @elapsed triangle_count(SG, DODG()))

println("threadeddodg: ", "number of triangles = ", triangle_count(SG, ThreadedDODG()), ", time = ", @elapsed triangle_count(SG, ThreadedDODG()))

println("matrixtrace: ", "number of triangles = ", triangle_count(A, MatrixTrace()), ", time = ", @elapsed triangle_count(A, MatrixTrace()))

println("=============================================")
