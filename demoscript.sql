/*
This is going to be where we put the demo queries.
*/


UPDATE Job
   SET cancelled=true
 WHERE job_id=3

SELECT cl.*
     , SUM(jb.balance) as client_balance
  FROM Client cl
 INNER JOIN JobBalance jb
    ON cl.client_id = jb.client
 GROUP BY cl.client_id
HAVING SUM(jb.balance) < CAST(0.00 AS money)