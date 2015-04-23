/*
* This is going to be where we put the demo queries.
*/

SELECT *
  FROM Photographer
 WHERE full_name LIKE '%Clara%';

SELECT j.job_id as job_id
     , j.client as client
     , j.scheduled as scheduled
  FROM Job j
 WHERE NOT EXISTS(
       SELECT 1
         FROM Payment p
	WHERE p.apply_to = j.job_id
     );

SELECT 'Client' as relationship
     , client_id as id
     , full_name as full_name
     , address as address
     , phone as phone
  FROM Client
 UNION
SELECT CASE WHEN is_employed THEN 'Employee' ELSE 'Freelance' END AS relationship
     , photographer_id as id
     , full_name as full_name
     , address as address
     , phone as phone
  FROM Photographer;

SELECT job_id
     , jobmode
     , jobtype
     , client
     , cancelled
  FROM Job
 WHERE job_id=3;

SELECT *
  FROM Photo
 WHERE from_job=3;

SELECT *
  FROM Disposable;

UPDATE Job
   SET cancelled=true
 WHERE job_id=3;

SELECT job_id
     , jobmode
     , jobtype
     , client
     , cancelled
  FROM Job
 WHERE job_id=3;

SELECT *
  FROM Photo
 WHERE from_job=3;

SELECT *
  FROM Disposable;

SELECT cl.client_id
     , cl.full_name
     , SUM(jb.balance) as client_balance
  FROM Client cl
 INNER JOIN JobBalance jb
    ON cl.client_id = jb.client
 GROUP BY cl.client_id
HAVING SUM(jb.balance) < CAST(0.00 AS money);
