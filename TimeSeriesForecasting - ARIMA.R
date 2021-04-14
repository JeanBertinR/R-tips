# Load library
library(forecast)

# Plot time series (object must be ts class)
plot(AirPassengers)

# Decompose time serie 
m_ets = ets(AirPassengers)
f_ets = forecast(m_ets, h=24) # forecast 24 months into the future

# Plot time serie prediction 
plot(f_ets)
class(AirPassengers)

# Auto ARIMA on time serie
m_aa = auto.arima(AirPassengers)
f_aa = forecast(m_aa, h=24)
plot(f_aa)

# Tbats method on time serie 
m_tbats = tbats(AirPassengers)
f_tbats = forecast(m_tbats, h=24)
plot(f_tbats)

# Plot results to compare performances 
barplot(c(ETS=m_ets$aic, ARIMA=m_aa$aic, TBATS=m_tbats$AIC),col="light blue",
        ylab="AIC")

# And the winner is ...
# Le meilleur modele est celui qui l'AIC le plus petit : en l'occurence il s'agit de l'ARIMA 

