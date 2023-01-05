# Explanatory note for our Deep Learning Model

Our hypothesis was that we can show that Ukrainian War news have impact on the trend of tweets negative sentiment. We proceeded from the fact that the news of the war is mostly negative, and it will influence the emotions in tweets. 

Preliminary analysis of datasets showed that such a relationship is possible.

![img22.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img22.png) 

The peaks on the negative emotions twitter chart (where partial data is used) by dates are approximately corresponding with the dates where there are peaks on the news chart.

![Search%20Results%20by%20Date.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/Search%20Results%20by%20Date.png) 

## Choosing Machine Learning Model

Clearly, we have pretty complex dataset: many of variables, the complex distribution of values, and huge size of the dataset even afer we were reducing data.

We decided to investigate the negative emotion of tweets. At the first sight the distribution was looking like a linear regression, and we expected from our machine learning model to find out the exact correlation between magnitude of negative emotion of tweets and the number of articles about war in the Google search on that date. Considering that war is the very negative event itself, we thought that the peak of negative emotions would accompany every big event in this war.

So, considering our estimated output should be a number - negative score of tweet emotions - we desided to use a linear regression machine learning model.

But after using this model for negative emotions prediction we discovered, that there is no correlation between tweets negative emotions and amount of articles in Google search:

![img23.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img23.png) 

Looks like we could improve this result by adding the setniment analysis for the news: as we can see by the date, the first big peak on the news dataset dedicated to the Bucha massacre, which is terrible negative event, but second big peack dedicated to the lend-lease signing to help Ukraine in this war, which can be seen as a positive development. Probably adding the setniment analysis for the thousend of articles could help us, but we do not have the technical ability to do this.

## Deep Learning Model

That why we chose to try the Deep Learning Model.

Considering we still hoped to get the output as a number of negative score of tweet emotions, as Activation function for the hidden layers we choosed ReLU, and as Activation function for the output layer we choosed Linear. For compiling model we used loss='mean_squared_error'.

Unfortunately, that still did not bring meaningful results. The model worked, but the accuracy of prediction = 0.

![img24.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img24.png) 

Than we decided to discover, what does the distribution of our values look like in general. 

We used kernel density estimation (KDE) as a non-parametric way to estimate the Probability Density Function (PDF) of a random variable. Unfortunately, the probability density for all our variables is close to 0, which means they are totally random:

![img25.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img25.png) 

But further discovering shows us that there is still hope. When we determined the evaluation points for the plot of the estimated PDF, we got three variables which can have some connection:

![img26.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img26.png) 
