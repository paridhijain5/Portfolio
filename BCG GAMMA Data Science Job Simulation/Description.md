# BCG GAMMA Data Science Job Simulation (on Forage)

## Project Overview
This project conducted at BCG GAMMA focuses on leveraging data science to address customer churn challenges for PowerCo, a leading energy provider catering to small and medium-sized enterprises (SMEs). The goal is to identify key factors influencing churn and develop predictive models to mitigate customer attrition.


## Task 1: Business Understanding & Hypothesis Framing

Here are some key facts about this program:
* You are working as a Junior Data Scientist at BCG GAMMA
* You work within a larger team, where each member has a different role and level of responsibility.
* Your team has been assigned a new project for a client called PowerCo

BCG GAMMA is transforming businesses using data science to help companies generate competitive advantage. To do this, we typically follow a 5-step methodology:
* Business understanding & problem framing: what is the context of this problem and why are they trying to solve it?
* Exploratory data analysis & data cleaning: what data are we working with, what does it look like and how can we make it better?
* Feature engineering: can we enrich this dataset using our own expertise or third party information?
* Modeling and evaluation: can we use this dataset to accurately make predictions? If so, are they reliable?
* Insights & Recommendations: how we can communicate the value of these predictions by explaining them in a way that matters to the business?

The tasks in this program will be focused on using different parts of this methodology at different times, so you’ll get a taste of the overall process.

It’s a really exciting time to be working with BCG GAMMA as more clients are needing data to drive key decisions. So, let’s check out what case you’ll be working on!

#### The brief from PowerCo
The Associate Director (AD) of the Data Science team held a team meeting to discuss the client brief. You’ll be working closely with Estelle Altazin, a senior data scientist on your team.

Here are the key takeaways from the meeting:
* Your client is PowerCo - a major gas and electricity utility that supplies to small and medium sized enterprises.
* The energy market has had a lot of change in recent years and there are more options than ever for customers to choose from.
* PowerCo are concerned about their customers leaving for better offers from other energy providers. When a customer leaves to use another service provider, this is called churn.
* This is becoming a big issue for PowerCo and they have engaged BCG to help diagnose the reason why their customers are churning.

During the meeting your AD discussed some potential reasons for this churn, one being how “sensitive” the price is. In other words, how much is price a factor in a customer’s choice to stay with or leave PowerCo?

So, now it’s time for you to investigate this hypothesis.

#### The task - we need to understand PowerCo’s problem in detail
First things first, you and Estelle need to understand the problem that PowerCo is facing at a deeper level and plan how you’ll tackle it. If you recall the 5 steps in the Data Science methodology, this is called “business understanding & problem framing”.

Your AD wants you and Estelle to email him by COB today outlining:
* the data that we’ll need from the client, and
* the techniques we’ll use to investigate the issue.

Use the text field below to write your email, here’s what you’ll need to include:

You must formulate PowerCo’s issue as a problem using the 5 step data science process and lay out the major steps needed to test it.

* What do you think are the key reasons for a customer deciding to stay with or switch energy providers? For example: price, is it clean energy, customer service, location etc.
* What data do you think would be useful in order to investigate these key reasons? E.g. customer purchasing trends over past 5 years, location of business etc.
* If you were to get this data, how could you analyse or visualize it to test whether these reasons may have an impact on churn?


## Task 2: Exploratory Data Analysis

After reviewing your project plan, the AD would like you lead on the Data Science deliverables for the rest of the project.

The AD would like you to investigate whether price sensitivity is the most influential factor for a customer churning, and if not, to what extent does price sensitivity influence churn.

The client has sent over 2 datasets and it your responsibility to perform some exploratory data analysis.

In this step, you'll need to analyse client data sets using Python and upload your work as a Jupyter notebook.

The client has sent over 3 data sets (shown below):
* Historical customer data: Customer data such as usage, sign up date, forecasted usage etc
* Historical pricing data: variable and fixed pricing data etc
* Churn indicator: whether each customer has churned or not

You need to analyze the following using Python:
* The data types of each column
* Descriptive statistics of the dataset
* Distributions of columns


## Task 3: Feature Engineering & Modelling

Estelle reviewed your work with the AD and Estelle has come up with an idea to enrich the dataset when trying to predict churn:

  * “I think that the difference between off-peak prices in December and January the preceding year could be a significant feature when predicting churn”

As the Data Scientist on the team, you need to investigate this question. So, in this task you’ll be responsible for completing feature eingeering for the dataset.

Estelle has done some further cleaning of the data and provided you with a new CSV file to complete our work from named “clean_data_after_eda.csv”. Be sure to use this data for your work on this task.--

Your task is to create new features for your analysis and upload your completed python file.

As before, a good way to quickly learn how to effectively feature engineer is to build a framework to follow. Below is an example of how you could attempt this task:

  * First - can we remove any of the columns in the datasets?
    There will almost always be columns in a dataset that can be removed, perhaps because they are not relevant to the analysis, or they only have 1 unique value.

  * Second - can we expand the datasets and use existing columns to create new features?
    For example, if you have “date” columns, in their raw form they are not so useful. But if you were to extract month, day of month, day of year and year into individual columns, these could be more useful.

  * Third - can we combine some columns together to create “better” columns?
    How do we define a “better” column and how do we know which columns to combine?
        - We’re trying to accurately predict churn - so a “better” column could be a column that improves the accuracy of the model.
        - And which columns to combine? This can sometimes be a matter of experimenting until you find something useful, or you may notice that 2 columns share very similar information so you want to combine them.

  * Finally - can we combine these datasets and if so, how?
    To combine datasets, you need a column that features in both datasets that share the same values to join them on.


## Task 4: Findings & Recommendations

Now that you have a dataset of cleaned and engineered features, it is time to build a predictive model to see how well these features are able to predict a customer churning.

Estelle has informed you that a classification model would be best for this task, and has suggested that you try the Random Forest classifier.

It is your task to:
* Train a random forest classifier to predict churn
* Evaluate the predictions using evaluation metrics to demonstrate how accurately the model has performed

Furthermore after the previous task of feature engineering, Estelle conducted a further review and has provided you with a final dataset to use this for this task, named “data_for_predictions.csv”. Be sure to use this dataset for this task.--

The outputs of your work will be shared with the AD and Estelle has given you a few points to include within the notebook:
* Why did you choose the evaluation metrics that you used? Please elaborate on your choices.
* Do you think that the model performance is satisfactory? Give justification for your answer.
* Make sure that your work is presented clearly with comments and explanations

#### Finally, let's create a quick summary for the client
Before we finish up, the client wants a quick update on the project progress. Your AD wants you to draft an abstract (executive summary) of your findings so far.

Here is your task:
* Develop an abstract slide synthesizing all the findings from the project so far, keeping in mind that this will be for the key stakeholders meeting which the Head of the SME division, as well as other various stakeholders, will be attending.

**Note:** a steering committee meeting is a meeting where the BCG team presents key findings and recommendations (and/or project progress) to key client stakeholders.

A few things to think about for this abstract include:
* What is the most important number or metric to share with the client?
* What impact would the model have on the client’s bottom line?
* Please note, there are multiple ways to approach the task and that the sample answer is just one way to do it.

If you are stuck:
* What do you think the client wants to hear? How much detail should you go into, especially with the technical details of your work? 
* Always test what you write with the “so what?” test, i.e. sharing a fact, even an interesting one, only matters if the client can actually do something useful with it. E.g. 60% of your customers are from City A is pointless, but customers in City A should be prioritized for giving discount as they are among your most valuable ones, if true, is an actionable finding.


## Certficate


## License

