/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for data analyst positions 
- Focuses on roles with specified salalries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0)AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim AS skills_to_job ON job_postings_fact.job_id = skills_to_job.job_id
INNER JOIN skills_dim ON skills_to_job.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    RIGHT(job_location, 4) = ', UK'
    GROUP BY
    skills
ORDER BY avg_salary Desc
LIMIT 25;
