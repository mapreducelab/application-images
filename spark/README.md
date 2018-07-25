# How to build and push Spark

```
make
```

# Spark shell

```
/opt/spark/bin/spark-shell --total-executor-cores 2 --executor-memory 512M
```

# Spark example

```
val NUM_SAMPLES = 100
val count = sc.parallelize(1 to NUM_SAMPLES).filter { _ =>
  val x = math.random
  val y = math.random
  x*x + y*y < 1
}.count()
println(s"Pi is roughly ${4.0 * count / NUM_SAMPLES}")
```

# Hive example

```
kubectl xec -it <hive-toolbox> hive
select count(*) from t1;
```
