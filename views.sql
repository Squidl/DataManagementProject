CREATE VIEW invoicable AS
SELECT (SELECT SUM(Photo.cost) - Job.payed
          FROM Photo
	 WHERE Photo.from_job=Job.job_id
       ) as balance
     , Client.full_name AS customer
     , Client.phone AS contact
  FROM Job, Client
 WHERE Job.Client=Client.client_id;

CREATE VIEW disposable AS
SELECT photo.proof_id AS "proof#"
     , photo.expiration AS "exp since"
     , job.scheduled AS "taken on"
  FROM Photo p, Job j
 WHERE p.from_job=j.job_id
   AND expiration < now()