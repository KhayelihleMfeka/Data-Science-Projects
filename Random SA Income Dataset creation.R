# Load required library
library(dplyr)

# Set seed for reproducibility
set.seed(123)

# Define possible values
education_levels <- c("No Schooling", "Primary", "High School", "Matric", "Diploma", "Bachelor's", "Master's", "PhD")
genders <- c("Male", "Female", "Non-binary")
occupations <- c("Teacher", "Police Officer", "Electrician", "Software Developer", "Nurse", 
                 "Construction Worker", "Shop Assistant", "Taxi Driver", "Accountant", "Data Analyst")
cities <- c("Johannesburg", "Cape Town", "Durban", "Pretoria", "Bloemfontein", 
            "Gqeberha", "Polokwane", "East London", "Kimberley", "Soweto")
marital_statuses <- c("Single", "Married", "Divorced", "Widowed","Married-Spouse-Absent")
workclass <- c("gov", "self-employed", "business", "Private")

# Function to simulate income based on occupation and education
simulate_income <- function(occupation, education) {
  base <- runif(1, 3000, 8000)
  if (education %in% c("Bachelor's", "Master's", "PhD")) base <- base + runif(1, 7000, 25000)
  if (occupation %in% c("Software Developer", "Data Analyst", "Accountant")) base <- base + runif(1, 15000, 30000)
  return(round(base, 2))
}

# Generate data
n <- 50000
data <- tibble(
  ID = 1:n,
  Age = sample(18:65, n, replace = TRUE),
  Gender = sample(genders, n, replace = TRUE),
  Education = sample(education_levels, n, replace = TRUE),
  Occupation = sample(occupations, n, replace = TRUE),
  City = sample(cities, n, replace = TRUE),
  Marital_Status = sample(marital_statuses, n, replace = TRUE),
  workclass = sample(workclass, n, replace = TRUE)
)

# Add income based on other factors
data <- data %>%
  rowwise() %>%
  mutate(Income_ZAR = simulate_income(Occupation, Education))

# Save to CSV
write.csv(data, "C:/Users/khayo/OneDrive/Desktop/Training Material/R/Datasets/south_africa_income_data.csv", row.names = FALSE)

# Done!
