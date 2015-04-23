CREATE VIEW JobPayed AS
SELECT p.apply_to AS job_id
     , SUM(p.amount) AS payed
  FROM Payment p
 GROUP BY p.apply_to;

CREATE VIEW JobOwed AS
SELECT p.from_job AS job_id
     , SUM(pt.cost) AS photocost
  FROM Photo p
  LEFT JOIN PhotoType pt
    ON p.phototype=pt.phototype_id
 WHERE p.is_ordered
 GROUP BY p.from_job;

CREATE VIEW JobBalance AS
SELECT j.job_id
     , j.client
     , j.photographer
     , j.assistant
     , COALESCE(jp.payed,cast(0.00 as money)) AS Payed
     , jt.cost AS FlatCost
     , COALESCE(jo.photocost,cast(0.00 as money)) AS PhotoCost
     , COALESCE(jp.payed,cast(0.00 as money))
       - COALESCE(jo.photocost,cast(0.00 as money))
       - jt.cost AS Balance
  FROM Job j
  LEFT JOIN JobPayed jp
    ON j.job_id = jp.job_id
  LEFT JOIN JobOwed jo
    ON j.job_id = jo.job_id
  LEFT JOIN JobType jt
    ON j.jobmode = jt.jobmode AND j.jobtype = jt.jobtype;

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

