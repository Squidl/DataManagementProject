/*CREATE VIEW invoicable AS
 *SELECT (SELECT SUM(Photo.cost) - Job.payed
 *          FROM Photo
 *	 WHERE Photo.from_job=Job.job_id
 *       ) as balance
 *     , Client.full_name AS customer
 *     , Client.phone AS contact
 *  FROM Job, Client
 * WHERE Job.Client=Client.client_id;
 */

CREATE VIEW disposable AS
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

