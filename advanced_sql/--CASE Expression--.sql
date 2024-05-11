--CASE Expression--

/**SELECT 
    COUNT (job_id) AS jobs_count,
    CASE 
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'London, UK' THEN 'local'
        ELSE 'ONSITE'
        END AS location_category
FROM
    job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category
ORDER BY jobs_count DESC;**/


SELECT 
    job_title_short,
CASE
    WHEN salary_year_avg >'100000'THEN 'Higher'
    WHEN salary_year_avg >'50000' THEN 'Standard'
    ELSE 'Low'
    END Salary
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;


/**SELECT 
   COUNT(job_id) AS number_of_jobs,
CASE
    WHEN salary_year_avg >'100000'THEN 'Higher'
    WHEN salary_year_avg >'50000' THEN 'Standard'
    ELSE 'Low'
    END Salary
FROM
    job_postings_fact
HAVING 
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    Salary
ORDER BY
    salary_year_avg DESC;**/



