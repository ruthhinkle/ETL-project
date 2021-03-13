-- Create netflix and imdb tables
CREATE TABLE netflix (
    index INT,
    title TEXT PRIMARY KEY,
    premiere DATE,
    no_of_seasons INT,
    no_of_episodes TEXT
);
CREATE TABLE imdb (
    index INT PRIMARY KEY,
    series_title TEXT,
    genre TEXT,
    imdb_rating INT,
overview TEXT
);