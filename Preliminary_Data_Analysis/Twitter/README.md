## War in Ukraine: Sentiment Prediction

**Using Artificial Intellect to discover Twitter trends and Sentiment Analysis**

We select to discover, how War in Ukraine is presented on Twitter, and to realize Sentiment Prediction for current twits. This subject was selected due to topicality of that information and acute social need for such an analysis.

On February 24th, 2022, Russia invaded Ukraine after months of military preparation around the borders. The war is going to have huge impacts around the world, perhaps even ending the globalized era as we know it. It is imperative that we capture and analyze the massive amounts of data being put out as a result of this war and extract insights for future generations.

## Hypothesis

We intend to show that Ukrainian War news have impact on the trend of tweets negative sentiment. Our supervised machine learning model might predict, based on tweet data and information about news, whether a tweets negative sentiment will rise or not.

For first segment we will use datetime and lenght of tweets for prediction, but later we could decide to make clasterisation for Twitter users for more accurate trend prediction.

# Description of the communication protocols

![img1.png](/   Resources/images/img1.png) 

# Overview of the News Data analysis



# Overview of the Twitter Data  Analysis

The source of data is [Ukraine Conflict Twitter Dataset ](https://www.kaggle.com/datasets/bwandowando/ukraine-russian-crisis-twitter-dataset-1-2-m-rows?select=0801_UkraineCombinedTweetsDeduped.csv.gzip) with 49.74M tweets on Kaggle. 

![img1.png](/Resources/images/img1.png) 

We hope to answer the following question:
* When were the earliest and latest tweets in this dataset created?  
* Visualize tweet frequency by date  
* How many languages are in this dataset?  
* What percentage of the tweets is in English (en)?
* How many symbols the shortest and longest tweet contains? 
* What a location of Twitter users in this Dataset?
* What the score for each of negative, neutral, and positive sentiments?
* Which model we should use first for prediction? 
* How we can improve prediction?

# Data exploration phase of the project:

## Twitter data preprocessing

Totally we have 161 files with the twits about Russian-Ukrainian War, but it is too much data for the first segment our project, where we want just play with the data and draft out project. Due to that we choose preprocess for start August data only and see what can we say about them. 

The raw dataset for 12 days of August has 1849926 rows and 28 columns. The earliest tweet was at 2022-08-01 00:00:00, and the latest was at 2022-08-12 23:59:58, which means that data is correct, it is all August tweets. 

We can see, that amount of tweets and tweets frequency is significantly different day by day. Probably this difference correlate with the state of war, events and news about it, but this hypothesis needs to be tested. 

![img4.png](/Resources/images/img4.png) 

About used languages we can see that English (en) was the far the most prevalent language in this dataset, nearing 1.2 million tweets out of 1.96 million. The second and third most prevalent languages were French and Thai, respectively.

Note that the forth most prevalent language was "und", which is used to indicate that Twitter could not detect a language. We can assume, that it safely inspect English language only due to most of tweets are in English despite they are from different corners of world: USA, UK, India, Ukraine etc.

![img5.png](/Resources/images/img5.png) 

Shortest tweet has 1 character. Longest tweet has 1027 characers, despite a tweet can have 280 characters max. How could one have more than the limit? Upon research, mentions supposedly do not count toward the character limit when the tweet is a reply. The distribution of lengths is right-skewed. Most tweets appear to be below 300 characters in length. But because we have a few outlying tweets that have anomalously long lengths, as investigated above, the histogram has an elongated x-axis

![img6.png](/Resources/images/img6.png) 

Dataset has 1849926 rows, but column coordinates has 1847412 null values, therefore we have 2514 data here, which is basically nothing. We can safely remove this column as well.

Column location has 800249 null values, it means that we have data in more then million rows. There are 127675 unique locations in this DataFrame.As we can see, the location input wasn't formalized and even when users filled it, they fill it with some creative description of location as "Facing West" or "The Peanut Gallery", which don't give geographic information for us. Therefore, despite analyzing correlation between twit's sentiment and autor's geographic location would be great idea, unfortunately we cannot realize it. Location data wasn't standardized and only can give us information about users' endless fantasy.

![img2.png](/Resources/images/img2.png) 

![img3.png](/Resources/images/img3.png) 


## Description of feature engineering and the feature selection, including the team's decision-making process  

Our team considered different options:
Classification - Negative, Positive, Neutral
Overtime 
Unsuprsived trend 
Negative, Positive, Neutral
Overtime 
Sentiments correlated to news events 
Predicts sentiments of future events
Supervised 
NY times data
Group by topic 
Counts of articles
Clean for 10 
Spread the 10
 
Train in feb to may 
Test june to august 
Predict 
Trends
Time - are people having a more positive or negative overtime 
Event did it cause more negative or positive sentiments 
Count of tweets - did event cause tweets to increase? 
Count of articles 

## Description of how data was split into training and testing sets  

**Slides**  
The presentation should be finalized in Google Slides and include the following:  
Slides are primarily images or graphics (rather than primarily text).  
Images are clear, in high-definition, and directly illustrative of subject matter.  

# Analysis phase of the project:

* Explanation of model choice, including limitations and benefits  
* Explanation of changes in model choice (if changes occurred between the Segment 2 and Segment 3 deliverables)  
* Description of how the model was trained (or retrained if the team used an existing model)  
* Description and explanation of model's confusion matrix, including final accuracy score  

**Slides**  
The presentation should be finalized in Google Slides and include the following:  
Slides are primarily images or graphics (rather than primarily text).  
Images are clear, in high-definition, and directly illustrative of subject matter.  

## Technologies, languages, tools, and algorithms used throughout the project:

**Used tools:**
numpy                     1.21.5  
pandas                    1.16.0  
scipy                     1.7.3  
scikit-learn              2.2.0  
imbalanced-learn          0.9.0  
RandomOverSampler  
SMOTE algorithms  
ClusterCentroids algorithm  
SMOTEENN algorithm  
BalancedRandomForestClassifier (bias reduction model)  
EasyEnsembleClassifier (bias reduction model)  

# Result of analysis

* Description and explanation of model's confusion matrix, including final accuracy score

**Live Presentation**  
Requirements for the live presentation follow:  
All team members present in equal proportions.  
The team demonstrates the dashboard's real-time interactivity.  
The presentation falls within any time limits provided by the instructor.  
The submission includes speaker notes, flashcards, or a video of the presentation rehearsal.  

# Recommendation for future analysis

Anything the team would have done differently

