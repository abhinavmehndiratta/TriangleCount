#!/bin/bash
realgraphs=( "amazon0302" "cit-HepTh" "cit-Patents" "email-Enron" "flickrEdges" "soc-Epinions1" )
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

printf "\nREAL GRAPHS\n"
for g in "${realgraphs[@]}"
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

syngraphs1=( "Theory-4-5-9-16-25-B1k" "Theory-25-81-256-B1k"  "Theory-5-9-16-25-81-B1k" )

printf "\nSYNTHETIC KRONECKER GRAPHS WITH MANY TRIANGLES\n"
for g in "${syngraphs1[@]}"
do
    echo $g
    fn="${g}.tsv"
    url="https://graphchallenge.s3.amazonaws.com/synthetic/gc3/${fn}"
    fpath="${dir}/${fn}"
    if [ ! -f "$fpath" ]; then
        curl -s ${url} -o ${fpath}
    fi
    julia bench.jl ${fpath}
done

syngraphs2=( "Theory-4-5-9-16-25-B2k" "Theory-25-81-256-B2k" "Theory-5-9-16-25-81-B2k" )

printf "\nSYNTHETIC KRONECKER GRAPHS WITH SOME TRIANGLES\n"
for g in "${syngraphs2[@]}"
do
    echo $g
    fn="${g}.tsv"
    url="https://graphchallenge.s3.amazonaws.com/synthetic/gc3/${fn}"
    fpath="${dir}/${fn}"
    if [ ! -f "$fpath" ]; then
        curl -s ${url} -o ${fpath}
    fi
    julia bench.jl ${fpath}
done
