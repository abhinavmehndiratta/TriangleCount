#!/bin/bash
graphs=( "amazon0302" "cit-HepTh" "cit-Patents" "email-Enron" "flickrEdges" "soc-Epinions1" )
dir="$(pwd)/datasets/"

for g in "${graphs[@]}"
do
	echo $g
	fn="${g}_adj.tsv"
	url="https://graphchallenge.s3.amazonaws.com/snap/${g}/${fn}"
	fpath="${dir}/${fn}"
	curl -s ${url} -o ${fpath}
	julia bench.jl ${fpath}
done
