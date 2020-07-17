**Benchmarks on 6 threads**
```
$ ./run_benchmarks.sh -n 6

REAL GRAPHS
amazon0302
|V| = 262111 |E| = 899792
dodg: number of triangles = 717719.0, time = 0.138254727
threaded dodg: number of triangles = 717719.0, time = 0.083671797
matrix-method: number of triangles = 717719.0, time = 0.648318206
=============================================
cit-HepTh
|V| = 27770 |E| = 352285
dodg: number of triangles = 1.478735e6, time = 0.106530991
threaded dodg: number of triangles = 1.478735e6, time = 0.029877392
matrix-method: number of triangles = 1.478735e6, time = 1.185722867
=============================================
cit-Patents
|V| = 3774768 |E| = 16518947
dodg: number of triangles = 7.515023e6, time = 6.612407249
threaded dodg: number of triangles = 7.515023e6, time = 2.518657675
matrix-method: number of triangles = 7.515023e6, time = 41.77120625
=============================================
email-Enron
|V| = 36692 |E| = 183831
dodg: number of triangles = 727044.0, time = 0.047403965
threaded dodg: number of triangles = 727044.0, time = 0.027203939
matrix-method: number of triangles = 727044.0, time = 1.165265401
=============================================
flickrEdges
|V| = 105938 |E| = 2316948
dodg: number of triangles = 1.07987357e8, time = 5.32159865
threaded dodg: number of triangles = 1.07987357e8, time = 1.49304838
matrix-method: number of triangles = 1.07987357e8, time = 11.483784934
=============================================
soc-Epinions1
|V| = 75879 |E| = 405740
dodg: number of triangles = 1.624481e6, time = 0.199759623
threaded dodg: number of triangles = 1.624481e6, time = 0.071175491
matrix-method: number of triangles = 1.624481e6, time = 3.393101132
=============================================

```
