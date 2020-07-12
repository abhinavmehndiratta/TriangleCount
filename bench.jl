using SparseArrays, LightGraphs, BenchmarkTools
using LightGraphs: insorted
using LightGraphs.SimpleGraphsCore: SimpleGraph
BenchmarkTools.DEFAULT_PARAMETERS.samples = 100

include("loadtsv.jl")
include("triangle_count.jl")

gpath = ARGS[1]

SG = loadtsv(gpath, SimpleGraph)
A = loadtsv(gpath, SparseMatrixCSC)

println("|V| = ", nv(SG), " |E| = ", ne(SG))

t = @benchmark triangle_count($SG, DODG())
println("dodg: ", "number of triangles = ", triangle_count(SG, DODG()), ", time = ", t)

t = @benchmark triangle_count($A, MatrixTrace())
println("matrixtrace: ", "number of triangles = ", triangle_count(A, MatrixTrace()), ", time = ", t)

println("=============================================")
