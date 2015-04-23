CREATE VIEW JobBalance AS
  WITH photos AS(
       SELECT p.proof_id
            , p.from_job
	    , pt.cost
         FROM Photo p
	    , PhotoType pt
	WHERE p.phototype=pt.phototype_id
	  AND p.is_ordered
     )
SELECT j.job_id
     , cl.client_id as client_id
     , cl.full_name as client
     , COALESCE(SUM(pmt.amount),cast(0.00 as money)) as payed = (
       SELECT SUM(pmt.amount)
         FROM Payment p
	WHERE p.appy_to = j.job_id 
     )
     , COALESCE(SUM(ph.cost),cast(0.00 as money)) as photocost
     , jt.cost as flatcost
     , COALESCE(SUM(pmt.amount),cast(0.00 as money)) - COALESCE(SUM(ph.cost),cast(0.00 as money)) - jt.cost as balance
  FROM Job j
 INNER JOIN JobType jt ON j.jobmode = jt.jobmode AND j.jobtype = jt.jobtype
 INNER JOIN Client cl ON j.client = cl.client_id
  LEFT JOIN photos ph ON ph.from_job=j.job_id
 GROUP BY j.job_id,cl.client_id,jt.jobmode,jt.jobtype;


CREATE VIEW Disposable AS
SELECT p.proof_id AS "proof#"
     , p.expiration AS "exp since"
     , j.scheduled AS "taken on"
  FROM Photo p, Job j
 WHERE p.from_job=j.job_id
   AND expiration < now();

CREATE VIEW PhotoPackages AS
  WITH PhotoDesc AS (
       SELECT pip.package as package_id
       	    , pip.qty*pt.cost as cost
       	    , concat( '- ',pip.qty,'x ',pt.photoname,' (',pt.width,' in x ',pt.height,' in)') AS photodesc
         FROM PhotoType as pt
	    , PhotoInPackage as pip
	WHERE pt.phototype_id = pip.photo
     )
SELECT p.package_id as "package"
     , p.description as "description"
     , SUM(pt.cost) as "cost"
     , string_agg(pt.photodesc, E'\n' ) AS "includes"
  FROM Package p, PhotoDesc pt
 WHERE p.package_id = pt.package_id
 GROUP BY p.package_id;

