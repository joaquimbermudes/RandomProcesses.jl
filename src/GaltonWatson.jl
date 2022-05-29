export GaltonWatson

# Dist = Distribution of generation
# Len = Number of generations

function GaltonWatson(; Dist = Poisson(1.1), Len = 30)
    
    # Declaring serie
    Population = ones(Len + 1)
    
    # Generatting serie
    for i in 1:Len
        Population[i+1] = sum(rand(Dist, trunc(Int, Population[i])))
    end
    
    # Return serie 
    return Population
end