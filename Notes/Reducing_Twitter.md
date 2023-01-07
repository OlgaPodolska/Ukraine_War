# Reducing Twiter data

## Twitter datasets recearch

About our data. I did some research, there are two popular free Twitter datasets only! Both of them are about 12-13 Gigabytes. All smaller datasets are broken in different ways, I believe I tried all of them in the whole Internet. 
We can just assume that it is normal amount of data for this task, and there is no point for us do our own API downloading, it will be the same big.

How can we reduce data?

As example, we can use tweets with only one hashtag.  
Unfortunately, it definitely will skew our data, hashtags popularity changes all the time. We don’t even sure the hashtag was existing at Feb 24!

The same problem is with many another ways of reducing. We don’t know users gender, age, geographical position to make a selection according to these parameters. Any selection according to the content of the tweet - quote, retweet, hashtags – skew out data.

  
But!

## How and Why we can reduce

We know for sure one thing about users: data of their registration. We can take tweets from the registered before certain data users only. 

First, it allow as meet out technical requirements.
Second, we can be sure that there is no fake Kremlin users in this dataset: now there is Kremlin's network of Twitter accounts that work together to retweet and drive up traffic:  

[Kremlin's Network](https://www.bbc.com/news/technology-60790821)

![img7.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img7.png)

Additionally, we can compare our study for reduced dataset with Alexander Shevtsov study for the whole dataset. If significant difference in trends  appears, that means we catched the Kremlin bots working!  

[Alexander Shevtsov study](https://alexdrk14.github.io/RussiaUkraineWar/sentiment.html)  

![img8.png](/Preliminary_Data_Analysis/Twitter/Resources/Images/img8.png)

Ok. Now, how we reduce the user’s quantity?


The duration of the war is 179 days for today. Our training dataset is 12 days, i.e. 7%.That means we should be prepared to work with 14 times bigger dataset.
Now, whole training dataset has 1050058 rows.
Registered before 2005 – 2 rows, which is too small amount.
Registered before 2007 – 168 rows
Registered before 2008 – 3266 rows
Registered before 2009 – 18091 rows
Registered before 2010 - 96683 rows, which is probably too big.

I offer to choose the 2008 year: it is year, when Russian invasion to Georgia started.
At the end it could give us about 45K rows dataset, which is affordable.
