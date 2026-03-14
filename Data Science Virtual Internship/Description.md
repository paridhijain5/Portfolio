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

Dataset: 

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
###### Accuracy: ~78.8%

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

### Certificate of Completion


### License



