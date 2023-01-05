 # War in Ukraine: Sentiment Prediction

**Using Artificial Intellect to discover Twitter trends and Sentiment Analysis**

We selected as our topic to discover how the war in Ukraine is presented on Twitter, and to run Sentiment Prediction for recent tweets. This subject was selected due to the urgency of the war and an acute social need for such an analysis.

## Outline of the project

We intend to create supervised machine learning model which predict, based on tweet data and information about news, whether tweets will negative or not.

![image.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/image.png) 


### Data exploration phase of the project

The source of data is [Ukraine Conflict Twitter Dataset ](https://www.kaggle.com/datasets/bwandowando/ukraine-russian-crisis-twitter-dataset-1-2-m-rows?select=0801_UkraineCombinedTweetsDeduped.csv.gzip) with 49.74M tweets on Kaggle, 12 Gb. 

In total, we have 161 files with the tweets about Russian-Ukrainian War, totaling 12 Gb. We decided to choose the users that registered on Twitter before 2008. 

Regarding the language of tweets, we can see that English (en) was by far the most prevalent language in this dataset, nearing 1.2 million tweets out of 1.96 million. 

![img5.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img5.png) 

Unfortunately, the location and coordinates in twitter data do not contain meaningful information. As we can see, the location input wasn't formalized and even when users filled it, they filled it with some creative description of location as "Facing West" or "The Peanut Gallery", which doesn't give precise geographic information. Therefore, despite that the ability to analyze the correlation between tweet sentiment and users' geographic location would be a great idea, unfortunately we cannot do this. The location data wasn't standardized and can only give us information about users' endless creativity.

![img2.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img2.png) 

![img3.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img3.png) 

For the machine learning model we labeled tweet hashtags using LabelEncoder:

![lgbm_negative1.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/lgbm_negative1.png) 

## RoBERTa Sentiment Analysis

For sentiment analysis we eventually chose RoBERTa, because it is a free pretrained model from Meta (Facebook), and it is a robustly optimized method for pretraining natural language processing (NLP) systems that improves on Bidirectional Encoder Representations from Transformers, or BERT, the self-supervised method released by Google in 2018.

Considering this model should work many hours to obtain the sentiment analysis, we installed RoBERTa on the remote server.

After sentiment analysis we got the information about sentiments by each tweet and could discover the trends in the tweets.
As example, we compared sentiments for Russia and Ukraine in the tweets:

![negative_ua_ru.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/negative_ua_ru.png)

![positive_ua_ru.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/positive_ua_ru.png)

In addition we compared sentiments for Zelensky and Putin in the tweets:

![negative_ze_pu.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/negative_ze_pu.png)

![positive_ze_pu.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/positive_ze_pu.png)


## Joining the data

For our research, we needed to join the twitter table with the news table. We used PostgreSQL for that:

![img13.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img13.png)

The result is the table with the date, tweets, sentiment of tweets and weight of events:

![img14.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img14.png)

## Analysis phase of the project

Our team considered different options: Supervised and Unsupervised learning, Clustering, different Neural Networks.  

First we chose to use a Supervised Machine Learning Linear Regression Model, considering that as result of prediction we should have negative sentiment, which is a number. But it doesnt't predict neither sentiment of each tweet nor even the average sentiment of the day.

Linear Regression Model prediction for sentiment of each tweet:

![LR_all.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/LR_all.png)

Linear Regression Model prediction for the average sentiment of the day:

![LR_average.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/LR_average.png)

Then we chose to try the Deep Learning Model.

Considering we still hoped to get the output as a number of negative score of tweet emotions, as Activation function for the hidden layers we chose ReLU, and as Activation function for the output layer we chose Linear. For compiling model we used loss='mean_squared_error'.

Unfortunately, that still did not bring meaningful results. The model worked, but the accuracy of prediction = 0.

![deep_learning.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/deep_learning.png) 

Then we decided to discover, what does the distribution of our values look like in general. 

We used kernel density estimation (KDE) as a non-parametric way to estimate the Probability Density Function (PDF) of a random variable. Unfortunately, the probability density for all our variables is close to 0, which means they are mostly random:

![img25.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img25.png) 

But further discovering showed us that there is still hope. When we determined the correlation between our data, we could see, that some of them is correlated. 

We clustered our data for 3 classes: negative tweets, positive and neutral. As we can see on the plot, this classes is still pretty messed! That is understandable: the human emotion is very hard predicted.

![lgbm_negative2.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/lgbm_negative2.png) 

Unfortunately, taking the numerical representation of the correlation, we see that the correlation is fairly low, with some of them being negative. Significant correlation is between negativity and positivity only, but it is meaningless for us: clearly, if we know if the tweet was labeled as positive or neutral, we 100% can predict that the current tweet is not negative with 100% accuracy without any machine learning.

![correlation.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/correlation.png) 

To catch this low correlation we used LGBM Classifier model - gradient boosting framework LightGBM. LightGBM grows tree vertically while other tree based learning algorithms grow trees horizontally. It means that LightGBM grows tree leaf-wise while other algorithms grow level-wise. It will choose the leaf with max delta loss to grow. When growing the same leaf, leaf-wise algorithm can reduce more loss than a level-wise algorithm.

We divaded our dataset on training and testing in proportion 70/30:

![lgbm_negative3.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/lgbm_negative3.png) 

And finally we got the result! Our model got 0.6527 training-set accuracy score.
Confusion matrix looks pretty good, considering very low correlation between our data:

 [[107622  16376]  
 [ 58187  30922]]  

* True Positives(TP) =  107622
* True Negatives(TN) =  30922
* False Positives(FP) =  16376
* False Negatives(FN) =  58187

![lgbm_negative4.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/lgbm_negative4.png) 

Average precision is 0.65:

![lgbm_negative5.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/lgbm_negative5.png) 

To improve our prediction we would analyse not hashtags only, but the tweet text itself, highlighting certain keywords with a negative connotation specificly in this dataset, and teaching the machine to recognize them. This is a hard work, but certainly it could improve our results further. 
 
## Technologies, languages, tools, and algorithms used throughout the project:  

**Used tools:**  
beautifulsoup4            4.11.1  
charset-normalizer        2.0.4  
ipykernel                 6.9.1  
importlib-metadata        4.11.3   
huggingface_hub           0.2.1 
hvplot                    0.8.1  
jupyter                   1.0.0   
matplotlib-inline         0.1.2   
numpy                     1.23.1    
pandas                    1.4.3    
prompt_toolkit            3.0.20    
python                    3.10.4   
pytorch                   1.10.2  
sqlite                    3.39.2   
tokenizers                0.11.4  
transformers              4.18.0  
tqdm                      4.64.0   
urllib3                   1.26.11   
scipy                     1.7.3  
scikit-learn              2.2.0  
imbalanced-learn          0.9.0  
LabelEncoder algorithm  
LightGBM Classifier model  
RoBERTa (pretrained deep neuron network model)  
pgAdmin                   4.6.8    
postgresql              10.2.16 
Tableau Public 

## Data Visualization 
Link to Tableau dashboard – https://public.tableau.com/views/UkraineWarTweetSentiment/Retweets?:language=en-US&:display_count=n&:origin=viz_share_link

Link to our presentation - https://docs.google.com/presentation/d/15m7WHhccFcoW0xLscXw7r_kX-yVmb541g1s-voC973c/edit?usp=sharing
