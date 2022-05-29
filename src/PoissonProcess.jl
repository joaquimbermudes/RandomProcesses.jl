export PoissonProcess

# Len = Lenght of sumullating serie
# lambda = Lambda parameter of Poisson distribution

function PoissonProcess(;Len = 1000, lambda = 0.01)
    
    # Generatting Poisson increments
    dP = rand(Poisson(lambda), Len)
    
    # Return Poisson process
    return cumsum(dP)
end