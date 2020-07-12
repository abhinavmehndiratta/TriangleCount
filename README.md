**Benchmarks on 6 threads**
```
$ ./run_benchmarks.sh -n 6

amazon0302
|V| = 262111 |E| = 899792
dodg: number of triangles = 717719.0, time = TrialEstimate(173.823 ms)
threadeddodg: number of triangles = 717719.0, time = TrialEstimate(76.062 ms)
matrixtrace: number of triangles = 717719.0, time = TrialEstimate(668.818 ms)
=============================================
cit-HepTh
|V| = 27770 |E| = 352285
dodg: number of triangles = 1.478735e6, time = TrialEstimate(139.454 ms)
threadeddodg: number of triangles = 1.478735e6, time = TrialEstimate(39.392 ms)
matrixtrace: number of triangles = 1.478735e6, time = TrialEstimate(1.124 s)
=============================================
cit-Patents
|V| = 3774768 |E| = 16518947
dodg: number of triangles = 7.515023e6, time = TrialEstimate(7.638 s)
threadeddodg: number of triangles = 7.515023e6, time = TrialEstimate(2.439 s)
matrixtrace: number of triangles = 7.515023e6, time = TrialEstimate(41.315 s)
=============================================
email-Enron
|V| = 36692 |E| = 183831
dodg: number of triangles = 727044.0, time = TrialEstimate(58.969 ms)
threadeddodg: number of triangles = 727044.0, time = TrialEstimate(17.022 ms)
matrixtrace: number of triangles = 727044.0, time = TrialEstimate(1.185 s)
=============================================
flickrEdges
|V| = 105938 |E| = 2316948
dodg: number of triangles = 1.07987357e8, time = TrialEstimate(7.026 s)
threadeddodg: number of triangles = 1.07987357e8, time = TrialEstimate(1.909 s)
matrixtrace: number of triangles = 1.07987357e8, time = TrialEstimate(11.017 s)
=============================================
soc-Epinions1
|V| = 75879 |E| = 405740
dodg: number of triangles = 1.624481e6, time = TrialEstimate(237.455 ms)
threadeddodg: number of triangles = 1.624481e6, time = TrialEstimate(65.670 ms)
matrixtrace: number of triangles = 1.624481e6, time = TrialEstimate(3.132 s)
=============================================
```
