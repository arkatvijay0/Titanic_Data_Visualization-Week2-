# 🚢 Titanic Data Visualization and Insight Communication using R

## 📌 Project Overview

This project focuses on **Data Visualization and Insight Communication using R**.

The Titanic passenger dataset was analyzed using R to identify important patterns, trends, relationships, and differences in passenger survival outcomes.

Multiple visualization techniques were developed using **ggplot2**, including bar charts, grouped bar charts, histograms, scatter plots, and box plots.

The project is part of a **Week 2 Data Analyst / Data Science Internship Task**.

---

## 🎯 Objectives

The main objectives of this project are:

- Understand the Titanic passenger dataset
- Clean and prepare the dataset for analysis
- Perform exploratory data analysis
- Create meaningful visualizations using R
- Identify trends, patterns, and anomalies
- Compare survival outcomes across different passenger groups
- Communicate analytical insights clearly
- Develop professional data visualization skills

---

## 📊 Dataset

The project uses a cleaned version of the **Titanic passenger dataset**.

### Dataset Size

- **Records:** 891 passengers
- **Variables:** 16
- **Target Variable:** Survived

### Important Variables

| Variable | Description |
|---|---|
| PassengerId | Unique passenger identifier |
| Survived | Survival status: 0 = No, 1 = Yes |
| Pclass | Passenger class |
| Name | Passenger name |
| Sex | Passenger gender |
| Age | Passenger age |
| SibSp | Number of siblings/spouses aboard |
| Parch | Number of parents/children aboard |
| Ticket | Ticket identifier |
| Fare | Passenger fare |
| Cabin | Cabin information |
| Embarked | Port of embarkation |
| Survived_Label | Readable survival status |
| Pclass_Label | Readable passenger class |
| FamilySize | Total family size |
| AgeGroup | Categorized age group |

---

## 🧹 Data Cleaning

The dataset was prepared before visualization.

The following preprocessing steps were performed:

- Handled missing Age values
- Handled missing Embarked values
- Represented missing Cabin values as `Unknown`
- Standardized categorical variables
- Created readable survival labels
- Created passenger class labels
- Created `FamilySize`
- Created `AgeGroup`
- Verified the cleaned dataset
- Retained all 891 passenger records

---

## 🛠️ Technologies Used

### Programming Language
- R

### Development Environment
- RStudio

### R Libraries

- `ggplot2`
- `dplyr`
- `readr`
- `scales`

---

## 📈 Visualizations Created

A total of **10 visualizations** were created.

### 1. Titanic Passenger Survival Distribution

Shows the overall number of passengers who survived and did not survive.

### 2. Titanic Survival Distribution by Gender

Compares survival and non-survival counts between female and male passengers.

### 3. Titanic Survival Rate by Gender

Compares the percentage of female and male passengers who survived.

### 4. Age Distribution of Titanic Passengers

A histogram showing the distribution of passenger ages.

### 5. Titanic Passenger Distribution by Class

Shows the number of passengers in First, Second and Third Class.

### 6. Titanic Survival Distribution by Passenger Class

Compares survival outcomes across First, Second and Third Class.

### 7. Relationship Between Passenger Age and Fare

A scatter plot examining the relationship between age and ticket fare.

### 8. Age Distribution by Survival Status

A box plot comparing passenger ages between survivors and non-survivors.

### 9. Fare Distribution by Survival Status

A box plot comparing ticket fare distributions between survivors and non-survivors.

### 10. Titanic Survival Rate by Age Group

Compares survival rates across Child, Teenager, Young Adult, Adult and Senior groups.

---

## 🔍 Key Findings

### Overall Survival

Out of 891 passengers:

- **342 passengers survived**
- **549 passengers did not survive**
- Overall survival rate was approximately **38.4%**

### Gender

Female passengers had a substantially higher survival rate than male passengers.

- Female survival rate: **74.2%**
- Male survival rate: **18.9%**

### Passenger Class

Third Class contained the largest number of passengers.

- First Class: 216
- Second Class: 184
- Third Class: 491

Third Class also had the largest number of non-survivors.

### Age

Passenger ages covered a wide range, with a large concentration around young-adult and adult ages.

### Fare

Survivors generally had higher fare distributions than non-survivors.

However, fare should not be interpreted as an independent cause of survival because fare is strongly related to passenger class.

### Age and Fare

The relationship between age and fare was relatively weak, indicating that age alone does not strongly explain ticket fare.

---

👨‍💻 Author

Vijay Kumar A G

M.Tech – Data Science
