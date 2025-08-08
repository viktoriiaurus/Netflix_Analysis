-- DATA CLEANING SCRIPT FOR NETFLIX DATASET

SELECT COUNT(*) AS total_rows FROM netflix_titles;

SELECT * FROM netflix_titles LIMIT 100;

-- 1. Check for NULLs
SELECT
  COUNT(*) FILTER (WHERE show_id IS NULL OR show_id = '') AS null_show_id,
  COUNT(*) FILTER (WHERE type IS NULL OR type = '') AS null_type,
  COUNT(*) FILTER (WHERE title IS NULL OR title = '') AS null_title,
  COUNT(*) FILTER (WHERE director IS NULL OR director = '') AS null_director,
  COUNT(*) FILTER (WHERE cast_members IS NULL OR cast_members = '') AS null_cast,
  COUNT(*) FILTER (WHERE country IS NULL OR country = '') AS null_country,
  COUNT(*) FILTER (WHERE date_added IS NULL) AS null_date_added,
  COUNT(*) FILTER (WHERE release_year IS NULL) AS null_release_year,
  COUNT(*) FILTER (WHERE rating IS NULL OR rating = '') AS null_rating,
  COUNT(*) FILTER (WHERE duration IS NULL OR duration = '') AS null_duration,
  COUNT(*) FILTER (WHERE listed_in IS NULL OR listed_in = '') AS null_listed_in,
  COUNT(*) FILTER (WHERE description IS NULL OR description = '') AS null_description
FROM netflix_titles;

-- Removing records with missing primary key (show_id) to ensure data integrity
DELETE FROM netflix_titles
WHERE show_id IS NULL OR show_id = '';

UPDATE netflix_titles
SET director = 'Unknown'
WHERE director IS NULL OR director = '';

UPDATE netflix_titles
SET cast_members = 'Unknown'
WHERE cast_members IS NULL OR cast_members = '';

UPDATE netflix_titles
SET country = 'Unknown'
WHERE country IS NULL OR country = '';

UPDATE netflix_titles
SET rating = 'Unknown'
WHERE rating IS NULL OR rating = '';

-- Deleting rows where 'date_added' is missing because this field is essential for time-series and trend analysis
DELETE FROM netflix_titles
WHERE date_added IS NULL;

-- Final check: count how many rows remain after cleaning
SELECT COUNT(*) AS total_cleaned_rows FROM netflix_titles;


-- 2. Standardizing text data: trimming spaces and unifying capitalization styles 

UPDATE netflix_titles
SET type = INITCAP(TRIM(type))
WHERE type IS NOT NULL;

UPDATE netflix_titles
SET rating = UPPER(TRIM(rating))
WHERE rating IS NOT NULL;

UPDATE netflix_titles
SET country = INITCAP(TRIM(country))
WHERE country IS NOT NULL;


-- Checking for duplicate 'show_id' values to ensure primary key uniqueness
SELECT show_id, COUNT(*) AS count
FROM netflix_titles
GROUP BY show_id
HAVING COUNT(*) > 1;

-- Checking for duplicated movie/show titles to identify potential data redundancies.
SELECT *
FROM netflix_titles
WHERE title IN (
  SELECT title
  FROM netflix_titles
  GROUP BY title
  HAVING COUNT(*) > 1
)
ORDER BY title;

-- Removing fully duplicated rows (same title, type, director, etc., but different show_id) to ensure each content entry is unique.

DELETE FROM netflix_titles a
USING netflix_titles b
WHERE a.ctid < b.ctid
  AND a.title = b.title
  AND a.type = b.type
  AND a.director = b.director
  AND a.cast_members = b.cast_members
  AND a.country = b.country
  AND a.date_added = b.date_added
  AND a.release_year = b.release_year
  AND a.rating = b.rating
  AND a.duration = b.duration
  AND a.listed_in = b.listed_in
  AND a.description = b.description;

-- Final NULL check after cleaning
SELECT
  COUNT(*) FILTER (WHERE show_id IS NULL OR show_id = '') AS null_show_id,
  COUNT(*) FILTER (WHERE type IS NULL OR type = '') AS null_type,
  COUNT(*) FILTER (WHERE title IS NULL OR title = '') AS null_title,
  COUNT(*) FILTER (WHERE director IS NULL OR director = '') AS null_director,
  COUNT(*) FILTER (WHERE cast_members IS NULL OR cast_members = '') AS null_cast,
  COUNT(*) FILTER (WHERE country IS NULL OR country = '') AS null_country,
  COUNT(*) FILTER (WHERE date_added IS NULL) AS null_date_added,
  COUNT(*) FILTER (WHERE release_year IS NULL) AS null_release_year,
  COUNT(*) FILTER (WHERE rating IS NULL OR rating = '') AS null_rating,
  COUNT(*) FILTER (WHERE duration IS NULL OR duration = '') AS null_duration,
  COUNT(*) FILTER (WHERE listed_in IS NULL OR listed_in = '') AS null_listed_in,
  COUNT(*) FILTER (WHERE description IS NULL OR description = '') AS null_description
FROM netflix_titles;

SELECT * FROM netflix_titles LIMIT 100;

