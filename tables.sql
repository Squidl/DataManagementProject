
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
        payed money,
 photographer int REFERENCES Photographer
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
