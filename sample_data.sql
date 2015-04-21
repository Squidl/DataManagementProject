INSERT INTO Client(full_name,address,phone)
VALUES(
	'Brian Demos',
	'712 Province apt 12',
	'1234567890'
),(
	'Kenneth Shippling',
	'42 Perkins apt 31',
	'0987654321'
),(
	'John Long',
	'Sol Heumann Hall Room 1093',
	'8901234567'
);

INSERT INTO Photographer(full_name,address,phone,is_employed)
VALUES(
	'Sacha Arnold',
	'123 Park Point Drive apt 23',
	'4244244242',
	true
),(
	'Henry Mansfield',
	'45 University Commons',
	'0900878989',
	false
),(
	'Robert Quiqley',
	'45 Chili Commons',
	'7884567863',
	false
);

INSERT INTO Job(client,location,scheduled,payed,photographer)
SELECT (SELECT MAX(client_id) FROM Client WHERE phone ='1234567890') as client
     , 'Gollisano College room 3245' as location
     , '4/20/2015 8:20pm' as scheduled
     , 10.00 as balance
     , (SELECT MAX(photographer_id) FROM Photographer WHERE phone ='7884567863') as photographer;

INSERT INTO Photo(cost,from_job)
VALUES (
       12.50,
       1
);