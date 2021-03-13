# TV Shows - ETL Report

## Extract
The CSVs were sourced from Kaggle and both were created by the same user. We chose this data was because we all have an interest in TV and entertainment and we wanted to see Netflix shows that would be the most popular in consideration to their release date. We read in both CSVs and extracted the columns that we thought fit best. The data was formatted into a dataframe with pandas.

**Netflix TV Series Dataset**
This dataset includes "recent" tv shows on Netflix scraped from Wikipedia. The Kaggle user did not specify how he defined "recent."
Link: https://www.kaggle.com/harshitshankhdhar/netflix-and-amazon-prime-tv-series-dataset?select=tv_shows_data.csv

**IMDB TV Series Dataset**
This dataset contains 2000 of the most popular TV shows on IMDB, according to how many votes were placed on the IMDB site. 
Link: https://www.kaggle.com/harshitshankhdhar/tv-series-dataset 

## Transform

After pulling the CSV files and converting them into dataframes using pandas, we cleaned up the data to later load into PostGres. To do this we:

* Extracted the columns we wanted from each csv:
    * IMDB: Series_Title, Genre, IMDB_Rating, Overview
    * Netflix: all original columns
* Changed ‘Premiere’ column in Netflix database to a datetime format
* Removed the dashes in the string format with a str.replace function
* Converted to datetime using pandas
* Changed column names for both dataframes to match PostGres formatting

After loading in the CSV files for IMDB and Netflix tv show data, we pulled out only the columns we wanted to review in our final database. 

## Load
We transferred our cleaned data from Python into PostGres to generate our relational SQL database. We created the tables for the Netflix and IMDB datasets based on the structure we created in our Python workbook.  

For the Netflix dataset, we created a table with the following columns: 
* index
* title (primary key)
* premiere
* no_of_seasons 
* no_of_episodes  

For the IMDB dataset, we a table created the following columns: 
* index (primary key)
* series_title 
* genre
* imdb_rating
* overview

We chose these columns specifically so they would bring in more data once we joined the two tables together.  For the Netflix table, we used the titles as the primary key, as each title was unique.  We decided to create and use the index as the primary key for the IMDB data as there were repeat titles that prevented us from running the join properly.  From there, we ran an inner join on the titles from the Netflix table to pull the corresponding data from the IMDB table.  We chose this process as a means to include the data from the IMDB database, while filtering out the data that did not match a title in the Netflix dataset.

## Conclusion
By combining data from Netflix and IMDB, our new database now paints a more complete picture of the TV shows offered by Netflix. This would allow Netflix users (and analysts!) to learn more about a specific show using a single source.

Future analyses: 
* Finding commonalities between successful Netflix shows to get a better understanding of what contributes to a successful series.
* What is the relationship between IMDB Rating and the number of episodes and/or seasons a series has?
* Are more recent Netflix shows more successful than older series?


### Project Collaborators: Tom Ball, Ruth Hinkle, Sabah Raja