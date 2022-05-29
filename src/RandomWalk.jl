export RandomWalk

# Len = Lenght of simulatting serie
# p = Probability of increment 1

function RandomWalk(;Len = 1000, p = 0.5)
    
    # Generatting increment of serie (1 or -1)
    dRW = (rand(Binomial(1, p), Len) .- 0.5) .* 2
    
    # Return Random Walk
    return cumsum(dRW)/std(cumsum(dRW))
end