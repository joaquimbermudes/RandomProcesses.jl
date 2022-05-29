export Wiener

# Len = lenght of simulatting serie

function Wiener(Len = 1000)
    
    # Generatting normal random increments
    dW = Random.randn(Len)
    
    # Return Wiener process
    return cumsum(dW)/std(cumsum(dW))
end