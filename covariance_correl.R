library(readxl)
library(dplyr)
library(FactoMineR)
library(ggplot2)
library(corrr)
library(prcomp)
library(factoextra) #Easy PCA plots and visualization
library(FactoMineR) #PCA and factor analysis functions  
library(ggplot2) #Enhanced data visualization
library(dplyr) #Data manipulation
library(gridExtra) #Arranging multiple plot grids
library(gt) # For creating beautiful tables

solarData <- read_excel("Copy of Solar Generation Daily  Report with CUF.xlsx")

solarData <- solarData %>%
  slice(-(1:2)) 

solarData$DATE <- as.Date(as.numeric(solarData$DATE), origin = "1899-12-30")

# Assuming solarData is your dataframe with DATE and SKH 1(MANDIR) columns
# Convert DATE column to Date class if not already done
solarData$DATE <- as.Date(as.numeric(solarData$DATE), origin = "1899-12-30")

# Plot time series
ggplot(data = solarData, aes(x = DATE, y =N8)) +
  geom_line() +
  labs(x = "Date", y = "SKH 1(MANDIR)",
       title = "Time Series of SKH 1(MANDIR)") +
  theme_minimal()


numeric_solarData <- solarData %>%
  select(where(is.numeric))


scaled_solarData <- scale(numeric_solarData)

solar.pca <- princomp(na.omit(scaled_solarData))
summary(solar.pca)


#####################################################################
df <- numeric_solarData

save(df, file = "df_numericVars.RData")
save(solarData, file = "solarData.RData")
