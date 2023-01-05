

-- Use following to derived week from into new table aug_twitter_sentiments table in order to join by week 
select *, 
EXTRACT(WEEK FROM date) as week
from aug_twitter_sentiments;

-- Use following to derived week from into new table events_ua table to join by week
select *, 
EXTRACT(WEEK FROM date) as week
from events_ua;