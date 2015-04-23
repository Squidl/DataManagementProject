CREATE TABLE Photographer(
    photographer_id serial PRIMARY KEY,
          full_name varchar(150) NOT NULL,
            address varchar(4000) NOT NULL,
              phone char(10) NOT NULL,
        is_employed bool NOT NULL
);

CREATE TABLE Client(
    client_id serial PRIMARY KEY,
    full_name varchar(150) NOT NULL,
      address varchar(4000) NOT NULL,
        phone char(10) NOT NULL
);

CREATE TYPE JobMode AS ENUM ('Event', 'Portrait');

CREATE TABLE JobType(
      jobmode JobMode,
      jobtype varchar(150),
         cost money NOT NULL,
      PRIMARY KEY ( jobmode, jobtype )	 
);

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
       booked bool NOT NULL DEFAULT FALSE,
    performed bool NOT NULL DEFAULT FALSE,
        final bool NOT NULL DEFAULT FALSE,
              CHECK ( NOT booked OR photographer IS NOT NULL ),
	      CHECK ( NOT booked OR ( (jobmode = 'Portrait') != assistant IS NULL) )
);


CREATE TABLE Package(
    package_id serial PRIMARY KEY,
   description varchar(4000) NOT NULL
);

CREATE TABLE PhotoType(
  phototype_id serial PRIMARY KEY,
     photoname varchar(150) NOT NULL,
        height numeric NOT NULL,
         width numeric NOT NULL,
	  cost money NOT NULL
);

CREATE TABLE PhotoInPackage(
       package int NOT NULL REFERENCES Package,
         photo int NOT NULL REFERENCES PhotoType,
	   qty int NOT NULL,
       PRIMARY KEY(package,photo)
);

CREATE TABLE Photo(
      proof_id serial PRIMARY KEY,
     phototype int NOT NULL REFERENCES PhotoType,
    expiration timestamp NOT NULL DEFAULT now() + interval '6 months',
    is_ordered bool NOT NULL DEFAULT false,
      from_job int NOT NULL REFERENCES Job
);

CREATE TABLE Payment(
    payment_id serial PRIMARY KEY,
      apply_to int NOT NULL REFERENCES Job,
        amount money NOT NULL,
    refference varchar(150) NOT NULL
);

CREATE TABLE Credit(
  from_payment int NOT NULL REFERENCES Payment,
    to_payment int NOT NULL REFERENCES Payment,
        amount money NOT NULL,
       PRIMARY KEY(from_payment,to_payment)
);