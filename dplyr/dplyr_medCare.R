library(dplyr)

setwd("~/Desktop")
medCare = read.csv("Medicare_MedOrganization_MeanPayments.csv")

# Select
dataSelected = medCare %>% select(Med_Organization_Name, Med_Organization_State, Med_Service_Cnt)
dataSelected = medCare %>% select(-Med_Organization_Name, - Med_Organization_State, -Med_Service_Cnt)
dataSelected = medCare %>% select(-c(Med_Organization_Name,  Med_Organization_State, Med_Service_Cnt))
rm(dataSelected)


# Filter (and pipe)
dataFiltered = medCare %>% filter( Med_Organization_State == "OK")
View(dataFiltered)
dataFiltered = medCare %>% filter( Med_Organization_State == "OK" & Med_Organization_City == "STILLWATER")
View(dataFiltered)
rm(dataFiltered)


# Group and summarize
data_ClassCount = medCare %>% group_by(Med_Organization_State) %>% summarize(MeanSpent = mean(Med_Organization_Payment_Received, na.rm = T)) 
View(data_ClassCount)
rm(data_ClassCount)

# Mutate
dataMutated = medCare %>% mutate(TotaAmount = Med_Organization_Payment_Received*Med_Service_Cnt)
rm(dataMutated)
 
# Rename
dataRenamed = medCare %>% rename(ID = Med_Organization_Identifier )
rm(dataRenamed)

# Distant
medCareNew = rbind(medCare, medCare[1:5, ])
dataWithOutDuplicate = medCareNew %>% distinct()
rm(dataWithOutDuplicate, medCareNew)

# Sample
dataSampled = sample_n(medCare, size = 100, replace = FALSE)
rm(dataSampled)
