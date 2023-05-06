
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

/* Which pronvince or territory had the largest growth rate in total healthcare professionals between 2017 - 2021? */

(SELECT ab1.prov_terr, 
	CAST((((CAST(ab2.total_count_2021 AS DECIMAL(8,2)) - CAST(ab1.total_count_2017 AS DECIMAL(8,2)))/CAST(ab1.total_count_2017 AS DECIMAL(8,2))) * 100) AS DECIMAL(2,1)) AS growth_rate_pct,
	ab1.total_count_2017, ab2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Alberta' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM alberta_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ab1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Alberta' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM alberta_profs
		 WHERE year = 2021
		 GROUP BY 1) AS ab2
ON ab1.prov_terr = ab2.prov_terr)
UNION ALL
(SELECT bc1.prov_terr, 
	CAST((((CAST(bc2.total_count_2021 AS DECIMAL(8,2)) - CAST(bc1.total_count_2017 AS DECIMAL(8,2)))/CAST(bc1.total_count_2017 AS DECIMAL(8,2))) * 100) AS DECIMAL(2,1)) AS growth_rate_pct,
	bc1.total_count_2017, bc2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'British Columbia' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM bc_profs
		 WHERE year = 2017
		 GROUP BY 1) AS bc1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'British Columbia' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM bc_profs
		 WHERE year = 2021
		 GROUP BY 1) AS bc2
ON bc1.prov_terr = bc2.prov_terr)
UNION ALL
(SELECT mb1.prov_terr, 
	CAST((((CAST(mb2.total_count_2021 AS DECIMAL(8,2)) - CAST(mb1.total_count_2017 AS DECIMAL(8,2)))/CAST(mb1.total_count_2017 AS DECIMAL(8,2))) * 100) AS DECIMAL(2,1)) AS growth_rate_pct,
	mb1.total_count_2017, mb2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Manitoba' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM manitoba_profs
		 WHERE year = 2017
		 GROUP BY 1) AS mb1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Manitoba' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM manitoba_profs
		 WHERE year = 2021
		 GROUP BY 1) AS mb2
ON mb1.prov_terr = mb2.prov_terr)
UNION ALL
(SELECT nb1.prov_terr, 
	CAST((((CAST(nb2.total_count_2021 AS DECIMAL(8,2)) - CAST(nb1.total_count_2017 AS DECIMAL(8,2)))/CAST(nb1.total_count_2017 AS DECIMAL(8,2))) * 100) AS DECIMAL(2,1)) AS growth_rate_pct,
	nb1.total_count_2017, nb2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'New Brunswick' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM nb_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nb1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'New Brunswick' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM nb_profs
		 WHERE year = 2021
		 GROUP BY 1) AS nb2
ON nb1.prov_terr = nb2.prov_terr)
UNION ALL
(SELECT nfld1.prov_terr, 
	CAST((((CAST(nfld2.total_count_2021 AS DECIMAL(8,2)) - CAST(nfld1.total_count_2017 AS DECIMAL(8,2)))/CAST(nfld1.total_count_2017 AS DECIMAL(8,2))) * 100) AS DECIMAL(2,1)) AS growth_rate_pct,
	nfld1.total_count_2017, nfld2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Newfoundland and Labrador' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM nfld_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nfld1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Newfoundland and Labrador' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM nfld_profs
		 WHERE year = 2021
		 GROUP BY 1) AS nfld2
ON nfld1.prov_terr = nfld2.prov_terr)
UNION ALL
(SELECT nvt1.prov_terr, 
	CAST(((CAST(nvt2.total_count_2021 AS DECIMAL(8,2)) - CAST(nvt1.total_count_2017 AS DECIMAL(8,2)))/CAST(nvt1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	nvt1.total_count_2017, nvt2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nunavut' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM nunavut_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nvt1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nunavut' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM nunavut_profs
		 WHERE year = 2021
		 GROUP BY 1) AS nvt2
ON nvt1.prov_terr = nvt2.prov_terr)
UNION ALL
(SELECT ns1.prov_terr, 
	CAST(((CAST(ns2.total_count_2021 AS DECIMAL(8,2)) - CAST(ns1.total_count_2017 AS DECIMAL(8,2)))/CAST(ns1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	ns1.total_count_2017, ns2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nova Scotia' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM ns_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ns1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Nova Scotia' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM ns_profs
		 WHERE year = 2021
		 GROUP BY 1) AS ns2
ON ns1.prov_terr = ns2.prov_terr)
UNION ALL
(SELECT nwt1.prov_terr, 
	CAST(((CAST(nwt2.total_count_2021 AS DECIMAL(8,2)) - CAST(nwt1.total_count_2017 AS DECIMAL(8,2)))/CAST(nwt1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	nwt1.total_count_2017, nwt2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Northwest Territories' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM nwt_profs
		 WHERE year = 2017
		 GROUP BY 1) AS nwt1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Northwest Territories' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM nwt_profs
		 WHERE year = 2021
		 GROUP BY 1) AS nwt2
ON nwt1.prov_terr = nwt2.prov_terr)
UNION ALL
(SELECT ont1.prov_terr, 
	CAST(((CAST(ont2.total_count_2021 AS DECIMAL(8,2)) - CAST(ont1.total_count_2017 AS DECIMAL(8,2)))/CAST(ont1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	ont1.total_count_2017, ont2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Ontario' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM ont_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ont1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Ontario' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM ont_profs
		 WHERE year = 2021
		 GROUP BY 1) AS ont2
ON ont1.prov_terr = ont2.prov_terr)
UNION ALL
(SELECT pei1.prov_terr, 
	CAST(((CAST(pei2.total_count_2021 AS DECIMAL(8,2)) - CAST(pei1.total_count_2017 AS DECIMAL(8,2)))/CAST(pei1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	pei1.total_count_2017, pei2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Prince Edward Island' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM pei_profs
		 WHERE year = 2017
		 GROUP BY 1) AS pei1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Prince Edward Island' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM pei_profs
		 WHERE year = 2021
		 GROUP BY 1) AS pei2
ON pei1.prov_terr = pei2.prov_terr)
UNION ALL
(SELECT ont1.prov_terr, 
	CAST(((CAST(ont2.total_count_2021 AS DECIMAL(8,2)) - CAST(ont1.total_count_2017 AS DECIMAL(8,2)))/CAST(ont1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	ont1.total_count_2017, ont2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Ontario' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM ont_profs
		 WHERE year = 2017
		 GROUP BY 1) AS ont1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Ontario' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM ont_profs
		 WHERE year = 2021
		 GROUP BY 1) AS ont2
ON ont1.prov_terr = ont2.prov_terr)
UNION ALL
(SELECT qb1.prov_terr, 
	CAST(((CAST(qb2.total_count_2021 AS DECIMAL(8,2)) - CAST(qb1.total_count_2017 AS DECIMAL(8,2)))/CAST(qb1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	qb1.total_count_2017, qb2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Quebec' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM quebec_profs
		 WHERE year = 2017
		 GROUP BY 1) AS qb1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Quebec' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM quebec_profs
		 WHERE year = 2021
		 GROUP BY 1) AS qb2
ON qb1.prov_terr = qb2.prov_terr)
UNION ALL
(SELECT sk1.prov_terr, 
	CAST(((CAST(sk2.total_count_2021 AS DECIMAL(8,2)) - CAST(sk1.total_count_2017 AS DECIMAL(8,2)))/CAST(sk1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	sk1.total_count_2017, sk2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Saskatchewan' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM sask_profs
		 WHERE year = 2017
		 GROUP BY 1) AS sk1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Saskatchewan' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM sask_profs
		 WHERE year = 2021
		 GROUP BY 1) AS sk2
ON sk1.prov_terr = sk2.prov_terr)
UNION ALL
(SELECT yk1.prov_terr, 
	CAST(((CAST(yk2.total_count_2021 AS DECIMAL(8,2)) - CAST(yk1.total_count_2017 AS DECIMAL(8,2)))/CAST(yk1.total_count_2017 AS DECIMAL(8,2)) * 100) AS DECIMAL(4,2)) AS growth_rate_pct,
	yk1.total_count_2017, yk2.total_count_2021 
FROM
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Yukon' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2017
		 FROM yukon_profs
		 WHERE year = 2017
		 GROUP BY 1) AS yk1
JOIN 
		(SELECT CASE WHEN (type_of_prof IS NOT NULL) 
				 	THEN 'Yukon' 
				 	END AS prov_terr,
		 		SUM(count) AS total_count_2021
		 FROM yukon_profs
		 WHERE year = 2021
		 GROUP BY 1) AS yk2
ON yk1.prov_terr = yk2.prov_terr)
ORDER BY 2 DESC


/* In 2021, which healthcare profession has the highest number of professionals in each province/territory? */

SELECT count_nfld, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_nfld IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_pei, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_pei IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_ns, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_ns IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_nb, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_nb IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_quebec, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_quebec IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_ontario, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_ontario IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_mb, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_mb IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_sask, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_sask IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_alb, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_alb IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_bc, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_bc IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_yukon, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_yukon IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_nwt, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_nwt IS NOT NULL
ORDER BY 1 DESC
LIMIT 1

SELECT count_nunavut, type_of_prof
FROM num_profs_all_provsterrs
WHERE count_nunavut IS NOT NULL
ORDER BY 1 DESC
LIMIT 1


/* Which province/territory has the highest ratio of healthcare professionals to population in 2021? */

(SELECT ab.*, p."2021" AS pop, CAST((ab.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Alberta'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM alberta_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS ab
JOIN population p
ON p.Province_Territory = ab.prov_terr)
UNION ALL
(SELECT bc.*, p."2021" AS pop, CAST((bc.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'British Columbia'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM bc_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS bc
JOIN population p
ON p.Province_Territory = bc.prov_terr)
UNION ALL
(SELECT mb.*, p."2021" AS pop, CAST((mb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Manitoba'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM manitoba_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS mb
JOIN population p
ON p.Province_Territory = mb.prov_terr)
UNION ALL
(SELECT nb.*, p."2021" AS pop, CAST((nb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'New Brunswick'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM nb_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS nb
JOIN population p
ON p.Province_Territory = nb.prov_terr)
UNION ALL
(SELECT nfld.*, p."2021" AS pop, CAST((nfld.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Newfoundland and Labrador'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM nfld_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS nfld
JOIN population p
ON p.Province_Territory = nfld.prov_terr)
UNION ALL
(SELECT ns.*, p."2021" AS pop, CAST((ns.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Nova Scotia'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM ns_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS ns
JOIN population p
ON p.Province_Territory = ns.prov_terr)
UNION ALL
(SELECT nvt.*, p."2021" AS pop, CAST((nvt.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Nunavut'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM nunavut_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS nvt
JOIN population p
ON p.Province_Territory = nvt.prov_terr)
UNION ALL
(SELECT nwt.*, p."2021" AS pop, CAST((nwt.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Northwest Territories'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM nwt_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS nwt
JOIN population p
ON p.Province_Territory = nwt.prov_terr)
UNION ALL
(SELECT ont.*, p."2021" AS pop, CAST((ont.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Ontario'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM ont_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS ont
JOIN population p
ON p.Province_Territory = ont.prov_terr)
UNION ALL
(SELECT pei.*, p."2021" AS pop, CAST((pei.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Prince Edward Island'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM pei_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS pei
JOIN population p
ON p.Province_Territory = pei.prov_terr)
UNION ALL
(SELECT qb.*, p."2021" AS pop, CAST((qb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Quebec'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM quebec_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS qb
JOIN population p
ON p.Province_Territory = qb.prov_terr)
UNION ALL
(SELECT sk.*, p."2021" AS pop, CAST((sk.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Saskatchewan'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM sask_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS sk
JOIN population p
ON p.Province_Territory = sk.prov_terr)
 UNION ALL
(SELECT yk.*, p."2021" AS pop, CAST((yk.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
FROM
	(SELECT 
		CASE WHEN (type_of_prof IS NOT NULL) 
			THEN 'Yukon'
			END AS prov_terr,
		SUM(count) AS total_count_2021
	FROM yukon_profs
	WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
	GROUP BY 1) AS yk
JOIN population p
ON p.Province_Territory = yk.prov_terr)
ORDER BY 4 DESC


/* Is there a relationship between the ratio of healthcare professionals to population and access to training programs in each province/territory? */

SELECT t2.prov_terr, t2.ratio_total_count_to_pop, 
		CASE WHEN (t1.num_avail_programs IS NULL)
			THEN 0
			ELSE t1.num_avail_programs
			END AS num_avail_programs
FROM
	((SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Newfoundland and Labrador'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE NL='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Prince Edward Island'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE PEI='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Nova Scotia'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE NS='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'New Brunswick'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE NB='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Quebec'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE QUE='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Ontario'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE ONT='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Manitoba'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE MB='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Saskatchewan'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE SK='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Alberta'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE AB='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'British Columbia'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE BC='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Yukon'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE YK='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Northwest Territories'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE NWT='Y'
	GROUP BY 1)
	UNION ALL
	(SELECT CASE WHEN (type_of_prof IS NOT NULL)
				THEN 'Nunavut'
				END AS prov_terr,
		COUNT(*) AS num_avail_programs
	FROM avail_programs a
	WHERE NUN='Y'
	GROUP BY 1)) AS t1
RIGHT JOIN 
	((SELECT ab.*, p."2021" AS pop, CAST((ab.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Alberta'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM alberta_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS ab
	JOIN population p
	ON p.Province_Territory = ab.prov_terr)
	UNION ALL
	(SELECT bc.*, p."2021" AS pop, CAST((bc.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'British Columbia'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM bc_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS bc
	JOIN population p
	ON p.Province_Territory = bc.prov_terr)
	UNION ALL
	(SELECT mb.*, p."2021" AS pop, CAST((mb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Manitoba'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM manitoba_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS mb
	JOIN population p
	ON p.Province_Territory = mb.prov_terr)
	UNION ALL
	(SELECT nb.*, p."2021" AS pop, CAST((nb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'New Brunswick'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM nb_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS nb
	JOIN population p
	ON p.Province_Territory = nb.prov_terr)
	UNION ALL
	(SELECT nfld.*, p."2021" AS pop, CAST((nfld.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Newfoundland and Labrador'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM nfld_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS nfld
	JOIN population p
	ON p.Province_Territory = nfld.prov_terr)
	UNION ALL
	(SELECT ns.*, p."2021" AS pop, CAST((ns.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Nova Scotia'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM ns_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS ns
	JOIN population p
	ON p.Province_Territory = ns.prov_terr)
	UNION ALL
	(SELECT nvt.*, p."2021" AS pop, CAST((nvt.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Nunavut'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM nunavut_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS nvt
	JOIN population p
	ON p.Province_Territory = nvt.prov_terr)
	UNION ALL
	(SELECT nwt.*, p."2021" AS pop, CAST((nwt.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Northwest Territories'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM nwt_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS nwt
	JOIN population p
	ON p.Province_Territory = nwt.prov_terr)
	UNION ALL
	(SELECT ont.*, p."2021" AS pop, CAST((ont.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Ontario'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM ont_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS ont
	JOIN population p
	ON p.Province_Territory = ont.prov_terr)
	UNION ALL
	(SELECT pei.*, p."2021" AS pop, CAST((pei.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Prince Edward Island'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM pei_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS pei
	JOIN population p
	ON p.Province_Territory = pei.prov_terr)
	UNION ALL
	(SELECT qb.*, p."2021" AS pop, CAST((qb.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Quebec'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM quebec_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS qb
	JOIN population p
	ON p.Province_Territory = qb.prov_terr)
	UNION ALL
	(SELECT sk.*, p."2021" AS pop, CAST((sk.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Saskatchewan'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM sask_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS sk
	JOIN population p
	ON p.Province_Territory = sk.prov_terr)
	 UNION ALL
	(SELECT yk.*, p."2021" AS pop, CAST((yk.total_count_2021 / p."2021") AS DECIMAL(8,5)) AS ratio_total_count_to_pop
	FROM
		(SELECT 
			CASE WHEN (type_of_prof IS NOT NULL) 
				THEN 'Yukon'
				END AS prov_terr,
			SUM(count) AS total_count_2021
		FROM yukon_profs
		WHERE Year = '2021' AND type_of_prof NOT IN ('Regulated nurses','Physicians')
		GROUP BY 1) AS yk
	JOIN population p
	ON p.Province_Territory = yk.prov_terr)) AS t2
ON t1.prov_terr = t2.prov_terr
ORDER BY 2 DESC

/* upon graphing in tableau, there seems to be a moderate linear, NEGATIVE relationship between the number of available programs in a province or territory, 
and the ratio of (total count of professionals to the population), ONCE WE EXCLUDE THE OUTLIERS of NWT, Nunavut, and BC (r value = 0.4786).  That is, as the number of available
programs in a province or territory increases, the ratio of (total count of professionals to the population) decreases (again, this relationship is moderate
in strength).   
However, if we include the outliers of NWT, Nunavut, and BC,  the r-value is 0.4526, so the relationship doesn't change too much.
Perhaps it makes more sense to investigate this data with the provinces SEPARATE from the territories, and vice versa.

If we look at just the provinces, and exclude the outlier of BC, we can see there is still a moderate linear, negative relationship between the number of available programs in a province or territory, 
and the ratio of (total count of professionals to the population) (r value = 0.3839).

If we look at just the territories, there is a strong linear, positive relationship between the number of available programs in a province or territory, 
and the ratio of (total count of professionals to the population), as the r-value = 0.999.  That is, the more training programs available in a territory, 
the greater the ratio of (total count of professionals to the population) */
