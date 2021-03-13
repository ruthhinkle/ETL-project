-- Join tables on titles
SELECT * FROM netflix
SELECT netflix.title, netflix.premiere, netflix.no_of_seasons, netflix.no_of_episodes, imdb.genre, imdb.imdb_rating, imdb.overview
FROM netflix
JOIN imdb
ON netflix.title = imdb.series_title;