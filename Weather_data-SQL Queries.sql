USE Weatherdb;

SELECT * 
FROM weatherdata;

-- Renaming Weather to Weather_Condition.
EXEC sp_rename 'WeatherData.Weather', 'Weather_Condition', 'COLUMN';


-- Checking for NULL
SELECT
    COUNT(CASE WHEN Weather_Condition IS NULL THEN 1 END) AS Weather_NULLs,
    COUNT(CASE WHEN Visibility_km IS NULL THEN 1 END) AS Visibility_NULLs,
    COUNT(CASE WHEN Wind_Speed_Km_h IS NULL THEN 1 END) AS Wind_Speed_NULLs,
	COUNT(CASE WHEN Temp_C IS NULL THEN 1 END) AS Temp_C_NULLs,
	COUNT(CASE WHEN Rel_Hum IS NULL THEN 1 END) AS Rel_Hum_NULLs,
	COUNT(CASE WHEN Press_kPa IS NULL THEN 1 END) AS Press_kPa_NULLs
FROM WeatherData;

-- Find all records WHERE weather was exactly clear
 SELECT COUNT(*)
 FROM WeatherData
 WHERE Wind_Speed_Km_h = 4;

 --  What is the mean visibility of the dataset?
SELECT ROUND(AVG(Visibility_km), 2) AS mean_visibility
FROM WeatherData;

-- Find the number of records where the wind speed is greater than 24 km/hr and visibility is equal to 25 km.
SELECT COUNT(*) AS records
FROM Weatherdata
WHERE Wind_Speed_Km_h > 24 AND Visibility_km = 25;

--What is the mean value of each column for each weather condition?
SELECT
    Weather_Condition,
    AVG(Temp_C) AS avg_temp,
    AVG(Dew_Point_Temp_C) AS avg_dewPoint,
    AVG(Rel_Hum) AS Avg_Rel,
	AVG(Visibility_km) AS avg_Visibility,
	AVG(Press_kPa) AS avg_Press
FROM WeatherData
GROUP BY Weather_Condition;

-- Find all instances where the weather is clear and the relative humidity is greater than 50, or visibility is above 40.
SELECT COUNT(*) AS records
FROM Weatherdata
WHERE Weather_Condition = 'Clear' AND Rel_Hum > 50 OR Visibility_km > 40;

-- Find the number of weather conditions that include snow.
SELECT COUNT(*) AS records
FROM Weatherdata
WHERE Weather_Condition = 'Snow';
