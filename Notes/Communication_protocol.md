# Communication protocol for Second Segment: Build the Pieces

For most updates we use Slack, if something urgent is needed – texts by phone.  
**Zoom time:**
1.	Classes
2.	Office hours
3.	Scheduled calls for group and for pairs
Weekly time for project ~ 20+ hours a week.
4 tasks for each person (2 main + 2 additional)
## Deliverables First Segment (the rest of them):
1. New joined table from DataBase to AWS - **Vero** (+Jesse), deadline today
2. Mockup machine learning model - **Jesse** (+Olga), deadline Friday 08.26 at 11 pm
3. Readme - **Olga**, deadline Sunday 08.28 at 11 pm

## Deliverables Second Segment:
We’re using data from February 24 till August 12 only!
### Second Segment Paragraphs content:

1.	twitter_data_cleaned.csv, TwitterUA_EDA.ipynb, TwitterUA_cleaned_data.ipynb   - **Jaymee (+Olga)**  
- **Cleaned dataset for whole Twitter data** for users registered till 2008-01-01(usercreatedts)  
To do:  
1.1	Download the data from Kaggle  
1.2	Reduce data from February 24 till August 12  
1.3	Repeat Exploratory analysis  
1.4	Repeat cleaning data for whole dataset  
1.5	Repeat [cleaned_text] – for RoBERTa  
1.6	Download the data to AWS storage  
1.7	Keep the data in order and provide the ability to quickly change the list of columns
1.8	For now we need columns - date(tweetcreatedts), length_text, hashtags, favorite_count, followers, following (this list could changes due to result of machine learning)  


2.	twitter_sentiments.csv, TwitterUA_sentiment_analysis.ipynb  - **Jesse (+Olga)**  
 - **RoBERTa sentiment analysis** for whole dataset  
To do:  
2.1	Server installation  
2.2	RoBERTa installation  
2.3	Sentiment analysis  
2.4	Joining the tables with sentiment  
2.5	Download the data to AWS Data   

3.	EventUA.csv, EventUA_cleaned_data.ipynb  - **Jaymee  (+Vero)**  
- **Cleaned dataset for Event data** from 2022-02-24 till 2022-08-12  
To do:  
3.1	Find source of data  
3.2	Download the data from February 24 till August 12  
3.3	Exploratory analysis data  
3.4	Find way to create weight of events  
3.5	Creating table: date, weight  
3.6	Download the data to AWS storage  

4.	Twitter ETL.ipynb, pgAdmin  - **Vero (+Jaymee)**  
- **DataBase: joined table** exporting to Google Colab without AWS  
To do:  
4.1	Download the data from AWS to Google Colab  
4.2	Create a DataBase  
4.3	Find way to join the tables without creating a null values 
4.4	Save result to AWS  
4.5	Find way to export the joined table to Google Colab without AWS  

5.	Twitter_ensemble.ipynb  - **Olga (+Jesse)**
- **Machine Learning Model**   
To do:  
5.1	Try different models to achieve most accurate prediction:  
5.2	Linear Regression  
5.3	Balanced Random Forest Classifier  
5.4	ADA Bust Classifier  
5.5	Clustering users data  
5.6	Try different outcome for analysis – certain tweets or certain data  

### Paragraphs distribution for second segment:  
1 – Jaymee  (+Olga) deadline Friday 08.26 at 11 pm  
2 – Jesse   (+Olga) deadline Saturday 08.27 at 11 pm  
3 – Jaymee  (+Vero) deadline Sunday 08.28 at 11 pm  
4 – Vero    (+Jaymee) deadline Monday 08.29 at 6 pm  
5 – Olga    (+Jesse) deadline Wednesday 08.31 at 6 pm  
Presentation - Olga, deadline Sunday 09.04 at 11 pm  
