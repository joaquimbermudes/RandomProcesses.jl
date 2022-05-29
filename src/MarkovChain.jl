export MarkovChain

# Alphabet = Values oc chain
# Init = Initial Value
# MProb = Probability Matix
# Len = lenght of serie


function MarkovChain(; Alphabet = ["A", "B", "C"], Init = "A" , MProb = [0.5 0.3 0.2; 0.1 0.7 0.2; 0.6 0.35 0.05], Len = 100)
    
    # Declaring the output array
    vecAlph = [Init]
    
    # Declaring a index that I will use in loop 
    indice = 0
    
    # Getting the lenght of alphabet
    l = length(Alphabet)
    
    # Generatting the Markov Chain
    for i in 1:Len
        for state in Alphabet
            indice = (indice % l) + 1
            if state == vecAlph[i]
                append!(vecAlph, wsample(Alphabet, MProb[indice,:], 1))
            end
        end
    end
    
    # Return Markov Chain
    return vecAlph
end