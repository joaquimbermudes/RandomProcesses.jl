export SARMA

# InItialValues = Serie values for initialize the process
# InitialErrors = Serie errors for initialize the process
# AR = Autoregressive parameters [AR_n, AR_{n-1}, ..., AR_1]
# MA = Moving average parameters [MA_n, MA_{n-1}, ..., MA_1]
# SAR = Seasonal autorregressive parameters [AR_{seasonal * n}, AR_{seasonal * (n-1)}, ..., AR_{seasonal}]
# SMA = Seasonal moving average parameters [MA_{seasonal * n}, MA_{seasonal * (n-1)}, ..., MA_{seasonal}]
# Seasonal = Lenght of seasonal lag
# Mean = Serie mean
# Std_Error = Standard desvio of generate error
# len = Simulatio lenght


function SARMA(;InitialVlues = [], InitialErrors = [], AR = [0], MA = [0], SAR = [0], SMA = [0], Seasonal = 1,  Mean = 0, Std_Error = 1, Len = 12)
    
    # Getting lenght of parameters
    lenAR = length(AR)
    lenMA = length(MA)
    lenSAR = length(SAR)
    lenSMA = length(SMA)
    
    # Getting maximum lenght of parameters
    lenMax = max(lenAR, lenMA, lenSAR * Seasonal, lenSMA * Seasonal)
    
    # Initializing error serie
    error = append!(InitialErrors, Std_Error .* Random.randn(Len))
    
    # Initializing serie
    if length(InitialValues) > 0
        serie = InitialValues .- Mean
    else
        serie = error[1:len]
    end
    
    # Generating simulating serie
    for i in (lenMax+1):Len
        append!(serie, sum(MA .* error[(i-lenMA):(i-1)]) + sum(SMA .* error[(i-lenSMA*Seasonal):Seasonal:(i-Seasonal)]) 
            + sum(SAR .* serie[(i-lenSAR*Seasonal):Seasonal:(i-Seasonal)]) + error[i] + sum(AR .* serie[(i-lenAR):(i-1)]))
    end
    
    # Return serie with mean
    return serie .+ Mean

end

