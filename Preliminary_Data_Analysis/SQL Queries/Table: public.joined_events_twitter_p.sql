-- Table: public.joined_events_twitter_pre_ml

-- DROP TABLE IF EXISTS public.joined_events_twitter_pre_ml;

CREATE TABLE IF NOT EXISTS public.joined_events_twitter_pre_ml
(
    username text COLLATE pg_catalog."default",
    following integer,
    followers integer,
    totaltweets integer,
    usercreatedts date,
    tweetcreatedts date,
    retweetcount integer,
    text text COLLATE pg_catalog."default",
    hashtags text COLLATE pg_catalog."default",
    language text COLLATE pg_catalog."default",
    favorite_count integer,
    is_retweet boolean,
    is_quote_status boolean,
    extractedts date,
    weekofyear integer,
    search_results bigint NOT NULL,
    weight numeric NOT NULL
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.joined_events_twitter_pre_ml
    OWNER to uatweets;


SELECT 
	*
    INTO joined_events_twitter_pre_ml
FROM filter_tweets_results_pre_ml
LEFT JOIN events_search_pre_ml ON
filter_tweets_results_pre_ml.date = events_search_pre_ml.date; 


SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT *
INTO joined_events_twitter_pre_ml_3
FROM joined_events_twitter_pre_ml_2
GROUP BY username,
      text, 
      hashtags
HAVING COUNT(*) > 1;

SELECT [FirstName], 
    [LastName], 
    [Country], 
    COUNT(*) AS CNT
FROM [SampleDB].[dbo].[Employee]
GROUP BY [FirstName], 
      [LastName], 
      [Country]
HAVING COUNT(*) > 1;

SELECT *
INTO joined_events_twitter_pre_ml_3
FROM joined_events_twitter_pre_ml_2
GROUP BY username,
	  following,
	  followers,
	  totaltweets,
	  usercreatedts,
	  tweetcreatedts,
	  retweetcount,
	  language,
	  favorite_count,
	  is_retweet,
	  is_quote_status,
	  extractedts,
	  weekofyear,
	  search_results,
	  weight,
	  date,
      text, 
      hashtags
HAVING COUNT(*) > 1;


select *,
EXTRACT(WEEK FROM date) as weekofyear
INTO events_search_pre_ml2
from events_search_pre_ml;

SELECT 
	filter_tweets_results_pre_ml.username,
	filter_tweets_results_pre_ml.following,
	filter_tweets_results_pre_ml.followers,
	filter_tweets_results_pre_ml.totaltweets,
	filter_tweets_results_pre_ml.usercreatedts,
	filter_tweets_results_pre_ml.tweetcreatedts,
	filter_tweets_results_pre_ml.retweetcount,
	filter_tweets_results_pre_ml.text,
	filter_tweets_results_pre_ml.hashtags,
	filter_tweets_results_pre_ml.language,
	filter_tweets_results_pre_ml.favorite_count,
    filter_tweets_results_pre_ml.is_retweet,
	filter_tweets_results_pre_ml.is_quote_status,
	filter_tweets_results_pre_ml.extractedts,
	filter_tweets_results_pre_ml.weekofyear
    INTO joined_events_twitter_pre_ml_4
FROM filter_tweets_results_pre_ml
LEFT JOIN events_search_pre_ml2 ON filter_tweets_results_pre_ml.weekofyear = events_search_pre_ml2.weekofyear; 

SELECT 
	filter_tweets_results_pre_ml.username,
	filter_tweets_results_pre_ml.following,
	filter_tweets_results_pre_ml.followers,
	filter_tweets_results_pre_ml.totaltweets,
	filter_tweets_results_pre_ml.usercreatedts,
	filter_tweets_results_pre_ml.tweetcreatedts,
	filter_tweets_results_pre_ml.retweetcount,
	filter_tweets_results_pre_ml.text,
	filter_tweets_results_pre_ml.hashtags,
	filter_tweets_results_pre_ml.language,
	filter_tweets_results_pre_ml.favorite_count,
    filter_tweets_results_pre_ml.is_retweet,
	filter_tweets_results_pre_ml.is_quote_status,
	filter_tweets_results_pre_ml.extractedts,
	filter_tweets_results_pre_ml.weekofyear,
	events_search_pre_ml2.search_results,
	events_search_pre_ml2.weight,
	events_search_pre_ml2.date
    INTO joined_events_twitter_pre_ml_4
FROM filter_tweets_results_pre_ml
LEFT JOIN events_search_pre_ml2 ON filter_tweets_results_pre_ml.weekofyear = events_search_pre_ml2.weekofyear; 

CREATE TABLE joined_events_twitter_pre_ml_5 AS (
SELECT 
	filter_tweets_results_pre_ml.username,
	filter_tweets_results_pre_ml.following,
	filter_tweets_results_pre_ml.followers,
	filter_tweets_results_pre_ml.totaltweets,
	filter_tweets_results_pre_ml.usercreatedts,
	filter_tweets_results_pre_ml.tweetcreatedts,
	filter_tweets_results_pre_ml.retweetcount,
	filter_tweets_results_pre_ml.text,
	filter_tweets_results_pre_ml.hashtags,
	filter_tweets_results_pre_ml.language,
	filter_tweets_results_pre_ml.favorite_count,
    filter_tweets_results_pre_ml.is_retweet,
	filter_tweets_results_pre_ml.is_quote_status,
	filter_tweets_results_pre_ml.extractedts,
	filter_tweets_results_pre_ml.weekofyear,
	events_search_pre_ml2.search_results,
	events_search_pre_ml2.weight,
	events_search_pre_ml2.date
FROM filter_tweets_results_pre_ml 
LEFT JOIN events_search_pre_ml2 ON
filter_tweets_results_pre_ml.tweetcreatedts = events_search_pre_ml2.date); 

CREATE TABLE joined_events_twitter_pre_ml AS (
SELECT 
	filter_tweets_results_pre_ml.username,
	filter_tweets_results_pre_ml.following,
	filter_tweets_results_pre_ml.followers,
	filter_tweets_results_pre_ml.totaltweets,
	filter_tweets_results_pre_ml.usercreatedts,
	filter_tweets_results_pre_ml.tweetcreatedts,
	filter_tweets_results_pre_ml.retweetcount,
	filter_tweets_results_pre_ml.text,
	filter_tweets_results_pre_ml.hashtags,
	filter_tweets_results_pre_ml.language,
	filter_tweets_results_pre_ml.favorite_count,
    filter_tweets_results_pre_ml.is_retweet,
	filter_tweets_results_pre_ml.is_quote_status,
	filter_tweets_results_pre_ml.extractedts,
	filter_tweets_results_pre_ml.weekofyear,
	events_search_pre_ml.search_results,
	events_search_pre_ml.weight,
	events_search_pre_ml.date
FROM filter_tweets_results_pre_ml 
LEFT JOIN events_search_pre_ml ON
filter_tweets_results_pre_ml.tweetcreatedts = events_search_pre_ml.date
AND filter_tweets_results_pre_ml.weekofyear = events_search_pre_ml.weekofyear);

SELECT * FROM joined_events_twitter_pre_ml LIMIT 100;

-- RE-CREATING TABLE AND UPLOADING joined.csv to fill the data
DROP TABLE joined_events_twitter_pre_ml; 

CREATE TABLE joined_events_twitter_pre_ml
(username VARCHAR,
following NUMERIC,
followers NUMERIC,
totaltweets numeric,
usercreatedts date, 
tweetcreatedts date,
retweetcount numeric,
hashtags varchar,
language varchar,
favorite_count numeric,
extractedts date,
is_retweet boolean,
is_quote_status boolean, 
weekofyear numeric,
cleaned_text varchar,
negative numeric,
neutral numeric,
positive numeric,
search_results numeric,
weight numeric
);