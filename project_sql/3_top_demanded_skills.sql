/*
Question: What are the most in-demand skills for data analysis?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for  a data analyst 
- Focus on all job postings 
- Why? Reterives the top 5 skills with the highest demand in the job market,
providing insights into he most valuable skills for job seekers.
*/



SELECT 
    skills,
    COUNT(skills_to_job.job_id) AS demnad_count
FROM job_postings_fact
INNER JOIN skills_job_dim AS skills_to_job ON job_postings_fact.job_id = skills_to_job.job_id
INNER JOIN skills_dim ON skills_to_job.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    RIGHT(job_location, 4) = ', UK'
    GROUP BY
    skills
ORDER BY demnad_count DESC
LIMIT 5;
 

 /*

Here's the breakdown of the most demanded skills for data analysts in 2023
Excel and SQL remain fundamental, emphasizing the need for strong foundation.
visualization and programming tools like Power Bi, tableau and Python are also important skills 
which give more depth to your data analysis.

[
  {
    "skills": "excel",
    "demnad_count": "3068"
  },
  {
    "skills": "sql",
    "demnad_count": "3067"
  },
  {
    "skills": "power bi",
    "demnad_count": "2008"
  },
  {
    "skills": "python",
    "demnad_count": "1380"
  },
  {
    "skills": "tableau",
    "demnad_count": "1075"
  }
]

*/