**Benchmarks on 6 threads**
```
$ ./run_benchmarks.sh -n 6

REAL GRAPHS
amazon0302
|V| = 262111 |E| = 899792
dodg: number of triangles = 717719.0, time = 0.163436361
threadeddodg: number of triangles = 717719.0, time = 0.087667309
matrixtrace: number of triangles = 717719.0, time = 0.6900315
=============================================
cit-HepTh
|V| = 27770 |E| = 352285
dodg: number of triangles = 1.478735e6, time = 0.13740246
threadeddodg: number of triangles = 1.478735e6, time = 0.036433272
matrixtrace: number of triangles = 1.478735e6, time = 1.109959399
=============================================
cit-Patents
|V| = 3774768 |E| = 16518947
dodg: number of triangles = 7.515023e6, time = 7.545992121
threadeddodg: number of triangles = 7.515023e6, time = 2.612689804
matrixtrace: number of triangles = 7.515023e6, time = 42.605308486
=============================================
email-Enron
|V| = 36692 |E| = 183831
dodg: number of triangles = 727044.0, time = 0.060822791
threadeddodg: number of triangles = 727044.0, time = 0.017188683
matrixtrace: number of triangles = 727044.0, time = 1.22445969
=============================================
flickrEdges
|V| = 105938 |E| = 2316948
dodg: number of triangles = 1.07987357e8, time = 6.874530211
threadeddodg: number of triangles = 1.07987357e8, time = 1.793643311
matrixtrace: number of triangles = 1.07987357e8, time = 11.341725559
=============================================
soc-Epinions1
|V| = 75879 |E| = 405740
dodg: number of triangles = 1.624481e6, time = 0.243593741
threadeddodg: number of triangles = 1.624481e6, time = 0.077700288
matrixtrace: number of triangles = 1.624481e6, time = 3.270618486
=============================================
```
