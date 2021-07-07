-- Data Science Proficiency Test
-- Retno Dewi Yulianti
-- Data Fellowship Batch 6 - Data Science (2021)

-- Sebutkan distrik mana (A/B/C/D/E, tanpa nomor) yang memiliki angka tindak kriminal yang paling tinggi!
SELECT SUBSTRING(DISTRICT, 1, 1) CODE_DISTRICT, COUNT (*) Total_Kriminal
FROM datacrime
GROUP BY CODE_DISTRICT
ORDER BY Total_Kriminal DESC 

-- Sebutkan 3 jenis tindak kriminal yang terjadi pada tahun 2020 namun tidak terjadi di tahun 2019!
SELECT OFFENSE_DESCRIPTION 
FROM datacrime
WHERE OCCURRED_ON_DATE LIKE '%2020%'
AND OFFENSE_DESCRIPTION NOT IN (
SELECT OFFENSE_DESCRIPTION FROM datacrime WHERE OCCURRED_ON_DATE LIKE '%2019%')
LIMIT 3

-- Apakah kelompok tindak kriminal yang paling banyak terjadi pada minggu ke 40-45?
SELECT "OFFENSE_DESCRIPTION", COUNT(*) Total_Kriminal
FROM datacrime
WHERE "MONTH" LIKE '%11%'
GROUP BY "OFFENSE_DESCRIPTION" 
ORDER BY Total_Kriminal DESC 

-- Sebutkan nama distrik (A/B/C/D/E, tanpa nomor) yang memiliki jumlah tindak kriminal terkecil di akhir pekan!
SELECT SUBSTRING(DISTRICT, 1, 1) CODE_DISTRICT, COUNT (*) Total_Kriminal
FROM datacrime
WHERE DAY_OF_WEEK LIKE 'Saturday' OR DAY_OF_WEEK LIKE 'Sunday'
GROUP BY CODE_DISTRICT
ORDER BY Total_Kriminal ASC 

-- Sebutkan nama distrik (A/B/C/D/E, tanpa nomor) yang memiliki jumlah tindak kriminal terbanyak di hari kerja!
SELECT SUBSTRING(DISTRICT, 1, 1) CODE_DISTRICT, COUNT (*) Total_Kriminal
FROM datacrime
WHERE DAY_OF_WEEK LIKE 'Monday' OR DAY_OF_WEEK LIKE 'Tuesday' 
OR DAY_OF_WEEK LIKE 'Wednesday' OR DAY_OF_WEEK LIKE 'Thursday' OR DAY_OF_WEEK LIKE 'Friday' 
GROUP BY CODE_DISTRICT
ORDER BY Total_Kriminal DESC 
