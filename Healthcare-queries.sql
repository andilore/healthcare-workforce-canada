
/* Which province/territory has the highest number of healthcare professionals in 2017? */

SELECT *
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Alberta' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM alberta_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ab
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'BC' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM bc_profs
		 WHERE year = 2017
		 GROUP BY 1) AS bc
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Manitoba' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM manitoba_profs
		 WHERE year = 2017
		 GROUP BY 1) AS mb
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'New Brunswick' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM nb_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nb	
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Newfoundland' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM nfld_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nfld
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nova Scotia' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM ns_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ns
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nunavut' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM nunavut_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nvt
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'NWT' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM nwt_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nwt
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Ontario' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM ont_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ont
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'PEI' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM pei_profs
		 WHERE year = 2017
		 GROUP BY 1) AS pei
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Quebec' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM quebec_profs
		 WHERE year = 2017
		 GROUP BY 1) AS qb
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Saskatchewan' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM sask_profs
		 WHERE year = 2017
		 GROUP BY 1) AS sk
UNION ALL
SELECT *
FROM 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Yukon' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count
		 FROM yukon_profs
		 WHERE year = 2017
		 GROUP BY 1) AS yk
ORDER BY total_count DESC