#!/bin/bash
graphs=( "amazon0302" "cit-HepTh" "cit-Patents" "email-Enron" "flickrEdges" "soc-Epinions1" )
dir="$(pwd)/datasets/"

nt=1
while getopts n: option
do
	case "${option}"
	in
	n) nt=${OPTARG};;
	esac
done

export JULIA_NUM_THREADS=${nt}

for g in "${graphs[@]}"
do
	echo $g
	fn="${g}_adj.tsv"
	url="https://graphchallenge.s3.amazonaws.com/snap/${g}/${fn}"
	fpath="${dir}/${fn}"
	if [ ! -f "$fpath" ]; then
    	curl -s ${url} -o ${fpath}
	fi
	julia bench.jl ${fpath}
done
