/*
Question: what skills are required for the top-paying data analyst jobs?
- use the top 10 highest-paying Data Analyst jobs fromt he first query
-Add the specific skiils required for the roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills, 
  helping job seekers understand which skills to develop thta align with top salalries*/


WITH Highest_paying_datajobs AS(
    SELECT 
        job_id,
        job_title,
        name AS Company_name,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id 
    WHERE job_title_short = 'Data Analyst' AND  
        RIGHT(job_location, 4) = ', UK' AND
        salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
Highest_paying_datajobs.*,
skills_dim.skills
FROM Highest_paying_datajobs
INNER JOIN skills_job_dim AS skills_to_job ON Highest_paying_datajobs.job_id = skills_to_job.job_id
INNER JOIN skills_dim ON skills_to_job.skill_id = skills_dim.skill_id
--WHERE skills_dim.skills = 'sql'-- to go further to get only jobs that require SQL--
ORDER BY Highest_paying_datajobs.salary_year_avg DESC




/*
Here's the breakdown of the most demanded skills for data ananlysts in 2023, based on job postings:







[
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "python"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "c++"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "pandas"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "numpy"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "tensorflow"
  },
  {
    "job_id": 159866,
    "job_title": "Research Engineer, Science",
    "company_name": "DeepMind",
    "salary_year_avg": "177283.0",
    "skills": "pytorch"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "company_name": "Darktrace",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "company_name": "Darktrace",
    "salary_year_avg": "165000.0",
    "skills": "mysql"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "company_name": "Darktrace",
    "salary_year_avg": "165000.0",
    "skills": "sql server"
  },
  {
    "job_id": 1563887,
    "job_title": "Data Architect",
    "company_name": "Darktrace",
    "salary_year_avg": "165000.0",
    "skills": "flow"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "sql"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "python"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "scala"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "r"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "postgresql"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "elasticsearch"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "sql server"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "mongodb"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "azure"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "aws"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "redshift"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "oracle"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "aurora"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "hadoop"
  },
  {
    "job_id": 258461,
    "job_title": "Data Architect",
    "company_name": "AND Digital",
    "salary_year_avg": "165000.0",
    "skills": "kafka"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "company_name": "Logispin",
    "salary_year_avg": "163782.0",
    "skills": "nosql"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "company_name": "Logispin",
    "salary_year_avg": "163782.0",
    "skills": "azure"
  },
  {
    "job_id": 478395,
    "job_title": "Data Architect",
    "company_name": "Logispin",
    "salary_year_avg": "163782.0",
    "skills": "looker"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "company_name": "AccorCorpo",
    "salary_year_avg": "139216.0",
    "skills": "sql"
  },
  {
    "job_id": 217504,
    "job_title": "Analytics Engineer - ENA London, Warsaw- (F/M)",
    "company_name": "AccorCorpo",
    "salary_year_avg": "139216.0",
    "skills": "python"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "company_name": "AJ Bell",
    "salary_year_avg": "132500.0",
    "skills": "sql"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "company_name": "AJ Bell",
    "salary_year_avg": "132500.0",
    "skills": "python"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "company_name": "AJ Bell",
    "salary_year_avg": "132500.0",
    "skills": "r"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "company_name": "AJ Bell",
    "salary_year_avg": "132500.0",
    "skills": "excel"
  },
  {
    "job_id": 307234,
    "job_title": "Finance Data Analytics Manager",
    "company_name": "AJ Bell",
    "salary_year_avg": "132500.0",
    "skills": "power bi"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "sas"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "aws"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "oracle"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "hadoop"
  },
  {
    "job_id": 1396666,
    "job_title": "Data Analyst - Financial services",
    "company_name": "Version 1",
    "salary_year_avg": "111175.0",
    "skills": "sas"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "sql"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "python"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "javascript"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "vba"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "excel"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "looker"
  },
  {
    "job_id": 178006,
    "job_title": "Data Analyst - (Ratings Ops)",
    "company_name": "Sylvera",
    "salary_year_avg": "111175.0",
    "skills": "sheets"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "company_name": "Ocorian",
    "salary_year_avg": "111175.0",
    "skills": "excel"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "company_name": "Ocorian",
    "salary_year_avg": "111175.0",
    "skills": "tableau"
  },
  {
    "job_id": 4851,
    "job_title": "Business Intelligence Data Analyst",
    "company_name": "Ocorian",
    "salary_year_avg": "111175.0",
    "skills": "powerpoint"
  }
]
*/

