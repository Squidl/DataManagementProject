
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

CREATE TABLE Job(
       job_id serial PRIMARY KEY,
       client int NOT NULL REFERENCES Client,
     location varchar(400),
    scheduled timestamp,
 photographer int REFERENCES Photographer,
    finalized bool NOT NULL DEFAULT FALSE,
        CHECK ( finalized OR photographer IS NOT NULL )
);

CREATE TABLE EventJob(
     assistant int REFERENCES Photographer
) INHERITS (Job);

CREATE TABLE Photo(
      proof_id serial PRIMARY KEY,
    expiration timestamp NOT NULL DEFAULT now() + interval '6 months',
          cost money NOT NULL,
    is_ordered bool NOT NULL DEFAULT false,
      from_job int NOT NULL REFERENCES Photo
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
         photo int NOT NULL REFERENCES Photo
);