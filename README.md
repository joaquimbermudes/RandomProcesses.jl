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
using RandomProcesses, PyPlot
```

### Random Walk

```Julia

for _ in 1:5
  plot(RandomWalk())
end

```

FIG

### Poisson Process

```Julia

for _ in 1:5
  plot(PoissonProcess())
end

```
FIG

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

FIG

## Coments

1. Almost functions need the package "Distribution" for execute.
2. You has that declare a vector of functions in each leyaer for neural process execute.
