# RandomProcesses.jl

## Introduction

RandomProcesses.jl is a package for simulling stochastics processes in Julia in a easy way.

At the moment the package has 8 functions that simulling the following stochastic processes:

- SARMA
- Ramdom Walk
- Weiner
- Martingale
- Galton Watson
- Markov Chain
- Poisson
- Neural (simuling the results of neural network)

## Exemples

Importing RandomProcesses and PyPlot

```Julia
using RandomProcesses, PyPlot, Distributions
```

### Random Walk

```Julia

for _ in 1:5
  plot(RandomWalk())
end

```

![RW.png](https://github.com/joaquimbermudes/RandomProcesses.jl/blob/main/Imgs/RW.png)

### Poisson Process

```Julia

for _ in 1:5
  plot(PoissonProcess())
end

```
![Poisson.png](https://github.com/joaquimbermudes/RandomProcesses.jl/blob/main/Imgs/Poisson.png)

### Neural Process

```Julia

function f(x)
    return exp.(x)./(1 .+ exp.(x))
end

function g(x)
    return sum(x)
end

for _ in 1:5
    plot(NeuralProcess(Activate = [f, g], Len = 30))
end

```

![Neural.png](https://github.com/joaquimbermudes/RandomProcesses.jl/blob/main/Imgs/Neural.png)

## Coments

1. Almost functions need the package "Distribution" for execute.
2. You has that declare a vector of functions in each leyaer for neural process execute.
3. This is my first package, please have pacience. Send criticisms and suggestions to joaquimacbermudes@gmail.com. I would also like to know out of curiosity in which projects the patent is being used.
