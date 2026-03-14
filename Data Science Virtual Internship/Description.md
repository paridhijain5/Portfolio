# Data Science Virtual Internship

## I. Loan Approval Prediction using Machine Learning

### Project Overview
This project applies a Machine Learning classification model to predict whether a loan application will be approved or rejected based on applicant information.
The project was completed as part of a Virtual Data Science Internship and demonstrates the complete machine learning workflow including data exploration, preprocessing, model building, and evaluation.
The model analyzes applicant features such as income, credit history, education, and loan amount to determine the likelihood of loan approval.

### Dataset Information
The dataset contains 614 loan applications with 13 features describing applicant demographics, financial details, and loan information.
##### Key Features
* Gender
* Married
* Dependents
* Education
* Self Employed
* Applicant Income
* Coapplicant Income
* Loan Amount
* Loan Amount Term
* Credit History

#### Target Variable
Loan_Status
* Y → Loan Approved
* N → Loan Rejected

Dataset: [Loan Dataset](https://github.com/paridhijain5/Portfolio/blob/main/Data%20Science%20Virtual%20Internship/loan_data_set.csv)


### Project Workflow
The project follows a standard machine learning pipeline:

#### 1. Data Loading
The dataset was loaded using Pandas and inspected to understand its structure.

#### 2. Data Cleaning
Missing values were handled using appropriate strategies:
* Mode for categorical variables
* Median for numerical variables

#### 3. Exploratory Data Analysis (EDA)
EDA was performed to identify patterns and relationships in the dataset.
Key visualizations included:
* Loan approval distribution
* Credit history vs loan approval
* Education vs loan approval
* Income distribution
* Loan amount distribution

#### 4. Data Preprocessing
Categorical variables were converted into numerical form using Label Encoding to make them suitable for machine learning models.

#### 5. Model Building
A Logistic Regression classifier was implemented using Scikit-learn since the problem is a binary classification task.

#### 6. Model Evaluation
The model performance was evaluated using:
* Accuracy Score
* Confusion Matrix
* Classification Report


### Model Performance
The Logistic Regression model achieved:
#### Accuracy: ~78.8%

Evaluation metrics used:
* Accuracy Score
* Precision
* Recall
* F1 Score
* Confusion Matrix

The model performs well in identifying approved loans but shows slightly lower performance when predicting rejected applications.


### Key Insights
* Credit History is the most important factor influencing loan approval.
* Applicants with higher income levels have better chances of loan approval.
* Graduates show slightly higher approval rates than non-graduates.
* The dataset contains skewed income distribution and outliers.
* Logistic Regression provides a simple and interpretable baseline model for this problem.

### Technologies Used
* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Scikit-learn
* Jupyter Notebook

[Machine Learning Model Application on Loan Dataset Jupyter Notebook](https://github.com/paridhijain5/Portfolio/blob/main/Data%20Science%20Virtual%20Internship/Machine%20learning%20model%20application%20on%20loan%20data%20set.ipynb)


## II. COVID-19 Data Analysis (EDA) using Python

### Project Overview
This project performs Exploratory Data Analysis (EDA) on a global COVID-19 dataset to understand trends in infection spread, mortality rates, and socio-economic indicators across continents.
Using Python data analysis libraries, the dataset was cleaned, transformed, and analyzed to identify relationships between COVID-19 cases, deaths, GDP per capita, and Human Development Index (HDI).
The analysis highlights how population size, healthcare infrastructure, and economic development influence pandemic outcomes.

### Objectives
* Understand the global distribution of COVID-19 cases and deaths.
* Analyze relationships between economic indicators and pandemic impact.
* Compare continent-wise infection spread and mortality ratios.
* Use data visualization and statistical analysis to derive insights.

### Dataset
Source dataset used in this project:

##### Dataset Link: https://raw.githubusercontent.com/SR1608/Datasets/main/covid-data.csv

The dataset contains global COVID-19 statistics along with socio-economic indicators such as:
* Continent
* Location (Country)
* Date
* Total Cases
* Total Deaths
* GDP per Capita
* Human Development Index


### Tools & Technologies
* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Jupyter Notebook


### Key Steps Performed
#### 1. Data Understanding
* Examined dataset structure and statistical summary
* Identified data types and missing values

#### 2. Data Cleaning
* Removed duplicate records
* Handled missing values
* Filtered relevant analytical features

#### 3. Feature Engineering
* Created a Mortality Ratio feature:
###### Mortality Ratio = Total Deaths / Total Cases
	​
#### 4. Data Aggregation
* Aggregated continent-level statistics using groupby analysis

#### 5. Data Visualization
Several visualizations were created to explore relationships in the data:
* GDP distribution histogram
* GDP vs Total Cases scatter plot
* Multivariate pair plot
* Continent-wise case comparison
* Mortality ratio comparison
* Correlation heatmap


### Key Insights
* North America and Asia recorded the highest number of COVID-19 cases due to large populations and strong testing infrastructure.
* GDP per capita and Human Development Index show moderate positive correlation, indicating that economic strength contributes to better development indicators.
* Total cases and deaths show strong correlation, confirming expected pandemic patterns.
* Asia shows the lowest mortality ratio, suggesting effective containment strategies and healthcare response.
* Population size and healthcare infrastructure appear to influence pandemic outcomes more than economic status alone.

### Visualizations
The project includes multiple visualizations such as:
* Distribution plots
* Scatter plots
* Pair plots
* Bar charts
* Correlation heatmap
These visualizations help identify trends and relationships within the dataset.

### Skills Demonstrated
* Exploratory Data Analysis (EDA)
* Data Cleaning & Preprocessing
* Feature Engineering
* Data Visualization
* Statistical Interpretation
* Python Data Analysis

### Conclusion
This project demonstrates how exploratory data analysis can uncover patterns and relationships in large real-world datasets. The findings emphasize the role of population size, healthcare infrastructure, and policy responses in shaping COVID-19 outcomes across different regions.


## Certificate
Here is the [Certficate of Completion]

## License



