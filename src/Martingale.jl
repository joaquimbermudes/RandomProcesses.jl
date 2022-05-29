export Martingale

# Dist = Ditribution of increments
# Mean = Mean of distribution
# Len = Lenght of simulating serie

function Martingale(;Dist = Chisq(1), Mean = 1, Len = 1000)
    
    # Declaring the increments 
    dM = rand(Dist, len) .- Mean
    
    # Return Martingale
    return cumsum(dM)/std(cumsum(dM))
end