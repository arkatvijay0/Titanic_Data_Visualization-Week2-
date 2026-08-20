# ============================================================
# WEEK 2 TASK
# DATA VISUALIZATION AND INSIGHT COMMUNICATION USING R
# ============================================================
#
# Project Title:
# Titanic Data Visualization and Insight Communication
#
# Dataset:
# Titanic Dataset
#
# Tools:
# R, RStudio, ggplot2, dplyr, readr, scales
# ============================================================

# install the required packages

install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
install.packages("scales")

# Load required libraries

library(ggplot2)
library(dplyr)
library(readr)
library(scales)

# ============================================================
# 1. LOAD CLEANED TITANIC DATASET
# ============================================================

titanic <- read_csv("C:/Users/arkat/OneDrive/Desktop/M.tech/b.techprojects/Internship projects/Virtual R Data Analyst Intern/Week_2_Titanic_Data_Visualization/Titanic-Cleaned.csv")

head(titanic)

dim(titanic)

names(titanic)

colSums(is.na(titanic))

# ============================================================
# 2. DATA OVERVIEW
# ============================================================

# Number of rows and columns
dim(titanic)

# Display first 10 rows
head(titanic, 10)

# Display all column names
names(titanic)

# Check structure of the dataset
str(titanic)

# Check missing values in every column
colSums(is.na(titanic))

# Total number of passengers
total_passengers <- nrow(titanic)

cat("Total Passengers:", total_passengers, "\n")

# Total number of survivors
total_survivors <- sum(titanic$Survived)

cat("Total Survivors:", total_survivors, "\n")

# Total number of passengers who did not survive
total_non_survivors <- sum(titanic$Survived == 0)

cat("Total Non-Survivors:", total_non_survivors, "\n")

# Overall survival rate
survival_rate <- mean(titanic$Survived) * 100

cat("Overall Survival Rate:",
    round(survival_rate, 2),
    "%\n")

# Passenger count by gender
gender_count <- table(titanic$Sex)

print(gender_count)

# Survival count by gender
gender_survival <- titanic %>%
  group_by(Sex) %>%
  summarise(
    Total = n(),
    Survivors = sum(Survived),
    Survival_Rate = mean(Survived) * 100
  )

print(gender_survival)

# Passenger count by class
class_count <- titanic %>%
  group_by(Pclass_Label) %>%
  summarise(
    Total_Passengers = n()
  )

print(class_count)

# Survival analysis by passenger class
class_survival <- titanic %>%
  group_by(Pclass_Label) %>%
  summarise(
    Total = n(),
    Survivors = sum(Survived),
    Survival_Rate = mean(Survived) * 100
  )

print(class_survival)

# Age statistics
cat("Minimum Age:", min(titanic$Age), "\n")
cat("Maximum Age:", max(titanic$Age), "\n")
cat("Average Age:", round(mean(titanic$Age), 2), "\n")
cat("Median Age:", median(titanic$Age), "\n")

# Fare statistics
cat("Minimum Fare:", min(titanic$Fare), "\n")
cat("Maximum Fare:", max(titanic$Fare), "\n")
cat("Average Fare:", round(mean(titanic$Fare), 2), "\n")
cat("Median Fare:", median(titanic$Fare), "\n")

# ============================================================
# 3. VISUALIZATION 1 - SURVIVAL DISTRIBUTION
# ============================================================

# ============================================================
# VISUALIZATION 1 - SURVIVAL DISTRIBUTION
# ============================================================

survival_plot <- ggplot(
  titanic,
  aes(x = Survived_Label)
) +
  geom_bar() +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.5,
    size = 5
  ) +
  labs(
    title = "Titanic Passenger Survival Distribution",
    x = "Survival Status",
    y = "Number of Passengers"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

print(survival_plot)

ggsave(
  filename = "Visualizations/01_Survival_Distribution.png",
  plot = survival_plot,
  width = 10,
  height = 6,
  dpi = 300
)

# ============================================================
# 4. VISUALIZATION 3 - SURVIVAL RATE BY GENDER
# ============================================================

gender_rate <- titanic %>%
  group_by(Sex) %>%
  summarise(
    Total_Passengers = n(),
    Survivors = sum(Survived),
    Survival_Rate = mean(Survived)
  )

print(gender_rate)

gender_rate_plot <- ggplot(
  gender_rate,
  aes(
    x = Sex,
    y = Survival_Rate
  )
) +
  geom_col() +
  geom_text(
    aes(
      label = percent(Survival_Rate, accuracy = 0.1)
    ),
    vjust = -0.5,
    size = 5
  ) +
  scale_y_continuous(
    labels = percent,
    limits = c(0, 0.85)
  ) +
  labs(
    title = "Titanic Survival Rate by Gender",
    x = "Gender",
    y = "Survival Rate"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

print(gender_rate_plot)

# ============================================================
# 5. VISUALIZATION 4 - AGE DISTRIBUTION
# ============================================================

average_age <- mean(titanic$Age)

age_plot <- ggplot(
  titanic,
  aes(x = Age)
) +
  geom_histogram(
    bins = 30,
    na.rm = TRUE
  ) +
  geom_vline(
    xintercept = average_age,
    linetype = "dashed",
    linewidth = 1
  ) +
  annotate(
    "text",
    x = average_age + 5,
    y = Inf,
    label = paste(
      "Mean Age:",
      round(average_age, 1)
    ),
    vjust = 2,
    size = 4
  ) +
  labs(
    title = "Age Distribution of Titanic Passengers",
    x = "Age",
    y = "Number of Passengers"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(age_plot)

# ============================================================
# 6. VISUALIZATION 5 - PASSENGER CLASS DISTRIBUTION
# ============================================================

class_plot <- ggplot(
  titanic,
  aes(x = Pclass_Label)
) +
  geom_bar() +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    vjust = -0.5,
    size = 5
  ) +
  labs(
    title = "Titanic Passenger Distribution by Class",
    x = "Passenger Class",
    y = "Number of Passengers"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(class_plot)

# ============================================================
# 7. VISUALIZATION 6 - SURVIVAL BY PASSENGER CLASS
# ============================================================

class_survival_plot <- ggplot(
  titanic,
  aes(
    x = Pclass_Label,
    fill = Survived_Label
  )
) +
  geom_bar(
    position = position_dodge(width = 0.9)
  ) +
  geom_text(
    stat = "count",
    aes(label = after_stat(count)),
    position = position_dodge(width = 0.9),
    vjust = -0.5,
    size = 4
  ) +
  labs(
    title = "Titanic Survival Distribution by Passenger Class",
    x = "Passenger Class",
    y = "Number of Passengers",
    fill = "Survival Status"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(class_survival_plot)

# ============================================================
# 8. VISUALIZATION 7 - AGE VS FARE
# ============================================================

age_fare_plot <- ggplot(
  titanic,
  aes(
    x = Age,
    y = Fare
  )
) +
  geom_point(
    alpha = 0.5,
    size = 2
  ) +
  geom_smooth(
    method = "lm",
    se = TRUE
  ) +
  labs(
    title = "Relationship Between Passenger Age and Fare",
    x = "Age",
    y = "Fare"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(age_fare_plot)

# ============================================================
# 9. VISUALIZATION 8 - AGE DISTRIBUTION BY SURVIVAL
# ============================================================

age_survival_plot <- ggplot(
  titanic,
  aes(
    x = Survived_Label,
    y = Age
  )
) +
  geom_boxplot(
    na.rm = TRUE
  ) +
  labs(
    title = "Age Distribution by Survival Status",
    x = "Survival Status",
    y = "Age"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(age_survival_plot)

# ============================================================
# 10. VISUALIZATION 9 - FARE DISTRIBUTION BY SURVIVAL
# ============================================================

fare_survival_plot <- ggplot(
  titanic,
  aes(
    x = Survived_Label,
    y = Fare
  )
) +
  geom_boxplot(
    na.rm = TRUE
  ) +
  labs(
    title = "Fare Distribution by Survival Status",
    x = "Survival Status",
    y = "Fare"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(fare_survival_plot)

# ============================================================
# 11. VISUALIZATION 10 - SURVIVAL RATE BY AGE GROUP
# ============================================================

age_group_rate <- titanic %>%
  group_by(AgeGroup) %>%
  summarise(
    Total_Passengers = n(),
    Survivors = sum(Survived),
    Survival_Rate = mean(Survived)
  )

print(age_group_rate)
age_group_plot <- ggplot(
  age_group_rate,
  aes(
    x = AgeGroup,
    y = Survival_Rate
  )
) +
  geom_col() +
  geom_text(
    aes(
      label = percent(
        Survival_Rate,
        accuracy = 0.1
      )
    ),
    vjust = -0.5,
    size = 4
  ) +
  scale_y_continuous(
    labels = percent,
    limits = c(0, 0.85)
  ) +
  labs(
    title = "Titanic Survival Rate by Age Group",
    x = "Age Group",
    y = "Survival Rate"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(
      hjust = 0.5,
      face = "bold",
      size = 16
    ),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 11)
  )

# Display graph
print(age_group_plot)

# ============================================================
# 12. FINAL ANALYSIS SUMMARY
# ============================================================

# Overall survival statistics
final_summary <- titanic %>%
  summarise(
    Total_Passengers = n(),
    Total_Survivors = sum(Survived),
    Total_Non_Survivors = sum(Survived == 0),
    Overall_Survival_Rate = mean(Survived) * 100,
    Average_Age = mean(Age),
    Median_Age = median(Age),
    Average_Fare = mean(Fare),
    Median_Fare = median(Fare)
  )

print(final_summary)

# ============================================================
# 13. BEST SURVIVAL GROUPS
# ============================================================

best_gender <- gender_rate %>%
  arrange(desc(Survival_Rate)) %>%
  slice(1)

print(best_gender)

best_class <- class_survival %>%
  arrange(desc(Survival_Rate)) %>%
  slice(1)

print(best_class)

# Survival rate by passenger class
class_rate <- titanic %>%
  group_by(Pclass_Label) %>%
  summarise(
    Total_Passengers = n(),
    Survivors = sum(Survived),
    Survival_Rate = mean(Survived)
  ) %>%
  arrange(desc(Survival_Rate))

print(class_rate)

# ============================================================
# 14. CORRELATION ANALYSIS
# ============================================================

age_fare_correlation <- cor(
  titanic$Age,
  titanic$Fare,
  use = "complete.obs"
)

cat(
  "Correlation between Age and Fare:",
  round(age_fare_correlation, 3),
  "\n"
)

# ============================================================
# 15. FINAL KEY FINDINGS
# ============================================================

cat("\n================ KEY FINDINGS ================\n")

cat(
  "1. Total passengers:",
  nrow(titanic),
  "\n"
)

cat(
  "2. Total survivors:",
  sum(titanic$Survived),
  "\n"
)

cat(
  "3. Overall survival rate:",
  round(mean(titanic$Survived) * 100, 2),
  "%\n"
)

cat(
  "4. Female survival rate:",
  round(
    gender_rate$Survival_Rate[
      gender_rate$Sex == "female"
    ] * 100,
    2
  ),
  "%\n"
)

cat(
  "5. Male survival rate:",
  round(
    gender_rate$Survival_Rate[
      gender_rate$Sex == "male"
    ] * 100,
    2
  ),
  "%\n"
)

cat(
  "6. Highest survival class:",
  best_class$Pclass_Label,
  "\n"
)

cat(
  "7. Age-Fare correlation:",
  round(age_fare_correlation, 3),
  "\n"
)

cat("================================================\n")

# Set logical order for age groups
titanic$AgeGroup <- factor(
  titanic$AgeGroup,
  levels = c(
    "Child",
    "Teenager",
    "Young Adult",
    "Adult",
    "Senior"
  )
)
