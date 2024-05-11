/* 
Answer: What are the most optimal skills to learn ( aka its in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on jobs in the Uk with specicfied salaries
- Why? Targets skills that offer job security (High demand) and financial benefits (high salaries),
offering strategic insights for carrer development in data analysis
*/

SELECT
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demnad_count,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary 
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id =  skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND RIGHT(job_location, 4) = ', UK'
GROUP BY 
    skills_dim.skill_id
HAVING
    COUNT(skills_job_dim.job_id) > 10
ORDER BY 
    avg_salary DESC,
    demnad_count DESC
LIMIT 25;