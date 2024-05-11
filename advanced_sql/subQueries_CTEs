--subQueries_CTEs--

/**SELECT *
FROM (-- SubQuery starts here
SELECT *
FROM job_postings_fact  
WHERE EXTRACT (MONTH FROM job_posted_date) = 1  
) AS january_jobs
-- subQuery ends here**/


/**WITH january_jobs As ( -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
)-- CTEs ends here

SELECT *
FROM january_jobs;**/


--Example of subquery in WHERE statetment--

/**SELECT name AS company_name -- In this query we are trying to return all the company names who acceppt with no college degree from a different table which company_dim--
FROM company_dim
WHERE company_id IN(
    SELECT
        company_id
    FROM
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE**/
)



/**SELECT -- this is simple and can be done very easily--
    job_title_short,
    job_no_degree_mention 
FROM job_postings_fact
WHERE job_no_degree_mention = TRUE
LIMIT 500;**/



--more on CTEs-- 

/* 
find the companies that have the most job openings
-get the total number of jobs postings per company id
-return the total number of jobs with the company name
*/



/**WITH company_job_count AS(
SELECT
    company_id,
    COUNT(*) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT company_dim.name AS company_name,
    company_job_count.total_jobs
FROM  company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs desc**/



SELECT job_title_short AS job_title
FROM job_postings_fact
WHERE job_id IN(
SELECT 
    COUNT (skill_id) AS no_skill_id
FROM skills_job_dim
)



