using SparseArrays, LightGraphs, BenchmarkTools
using LightGraphs: insorted
using LightGraphs.SimpleGraphsCore: SimpleGraph
BenchmarkTools.DEFAULT_PARAMETERS.samples = 20

include("loadtsv.jl")
include("triangle_count.jl")

gdir = pwd()
gfiles = ["/sample_data/ca-HepTh_inc.tsv"]

for fn in gfiles
	gpath = gdir * fn

	SG = loadtsv(gpath, SimpleGraph)
	A = loadtsv(gpath, SparseMatrixCSC)

	println(fn, " |V| = ", nv(SG), " |E| = ", ne(SG))

	t = @benchmark triangle_count($SG, DODG())
	println("dodg: ", "number of triangles = ", triangle_count(SG, DODG()), ", time = ", t)

	t = @benchmark triangle_count($A, MatrixTrace())
	println("matrixtrace: ", "number of triangles = ", triangle_count(SG, MatrixTrace()), ", time = ", t)

	println("================================")
end
