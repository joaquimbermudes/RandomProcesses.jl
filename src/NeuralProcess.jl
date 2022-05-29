export NeuralProcess

# Activate = list of activate function
# Initial = initial values
# Matrix = matrix of weights list
# Bias = Bias 
# distErro = Error distribution
# Len = Lenght of serie


function NeuralProcess(;Activate, Initial = [0.5, 0.75], Matrix = [[2 0.2; -0.8 0.3], [-1 2]], Bias = [[0; 0], [0]], distErro = Normal(0, 0.2),  Len = 100)
    
    # initing serie
    NeuralSerie = zeros(Len)
    
    # generating serie
    for j in 1:Len # Loop of serie lenght
        for i in 1:length(Matrix) # loop for creante serie[j] value
            function FunctionActvation(x; FunctionXYZ = Activate[i])
                return FunctionXYZ(x)
            end
           Initial = FunctionActvation(Matrix[i] * Initial .+ Bias[i])
        end
        Initial = Initial  + rand(distErro)
        NeuralSerie[j] = Initial
    end
    
    # return serie
    return NeuralSerie
end