CREATE TABLE Photographer(
       photographer_id serial PRIMARY KEY,
       full_name varchar(150),
       address varchar(4000),
       phone char(10),
       is_employed bool
);

CREATE TABLE Client(
       client_id serial PRIMARY KEY,
       full_name varchar(150),
       address varchar(4000),
       phone char(10)
);

CREATE TYPE JobMode AS ENUM ('Event', 'Portrait');

CREATE TABLE Job(
       job_id serial PRIMARY KEY,
      jobmode JobMode NOT NULL,
      jobtype varchar(150) NOT NULL,
      FOREIGN KEY (jobmode, jobtype) REFERENCES JobType (jobmode, jobtype),	 
       client int NOT NULL REFERENCES Client,
     location varchar(400) NOT NULL,
    scheduled timestamp NOT NULL,
 photographer int REFERENCES Photographer,
    assistant int REFERENCES Photographer,
    finalized bool NOT NULL DEFAULT FALSE,
        CHECK ( NOT finalized OR photographer IS NOT NULL ),
	CHECK ( NOT finalized OR ( jobmode = 'Portrait' != assistant IS NULL) )
);

CREATE TABLE JobType(
      jobmode JobMode,
      jobtype varchar(150),
         cost money,
      PRIMARY KEY ( jobmode, jobtype )	 
);

CREATE TABLE Photo(
      proof_id serial PRIMARY KEY,
     phototype int NOT NULL REFERENCES PhotoType,
    expiration timestamp NOT NULL DEFAULT now() + interval '6 months',
    is_ordered bool NOT NULL DEFAULT false,
      from_job int NOT NULL REFERENCES Job
);

CREATE TABLE Package(
    package_id serial PRIMARY KEY,
   description varchar(4000) NOT NULL
);

CREATE TABLE PhotoType(
  phototype_id serial PRIMARY KEY,
     photoname varchar(150) NOT NULL,
        height numeric NOT NULL,
         width numeric NOT NULL
);

CREATE TABLE PhotoInPackage(
       package int NOT NULL REFERENCES Package,
         photo int NOT NULL REFERENCES Photo,
	   qty int NOT NULL,
       PRIMARY KEY(package,photo)
);

