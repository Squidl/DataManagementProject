CREATE VIEW invoicable AS
SELECT (SELECT SUM(Photo.cost) - Job.payed
          FROM Photo
	 WHERE Photo.from_job=Job.job_id
       ) as balance
     , Client.full_name as customer
     , Client.phone as contact
  FROM Job, Client
 WHERE Job.Client=Client.client_id;

