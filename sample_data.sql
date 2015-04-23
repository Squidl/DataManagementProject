INSERT INTO Client(full_name,address,phone)
VALUES (
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
),(
	'Bart Simpson',
	'742 Evergreen Terrace',
	'1234567890'
),(
	'Jane Doe',
	'123 Main Street',
	'4908146660'
),(
	'Charles Lawson',
	'3382 Hardesty Street',
	'5184281313'	
),(
	'Herbert Shapiro',
	'4546 Angus Road',
	'2124099275'
),(
	'Courney Logan',
	'1950 Shinn Street',
	'2127143086'
),(
	'Michael Long',
	'1995 Joes Road',
	'5186736242'
),(
	'Dani Kirby',
	'3033 Patterson Road',
	'7188609167'
);

INSERT INTO Photographer(full_name,address,phone,is_employed)
VALUES (
	'Sacha Arnold',
	'123 Park Point Drive apt 23',
	'4244244242',
	true
),(
	'Henry Mansfield',
	'45 University Commons',
	'1920878989',
	true
),(
	'James Cancel',
	'47 University Commons',
	'0900878989',
	true
),(
	'Robert Quiqley',
	'45 Chili Commons',
	'7994567863',
	true
),(
	'Clara Anderson',
	'32 Chili Commons',
	'7884567863',
	true
),(
	'Eden Ward',
	'890 Park Point Drive apt 2',
	'7641119876',
	true
),(
	'Robert Harris',
	'2718 Hoffman Avenue',
	'9179335441',
	false
),(
	'Randy Flowers',
	'1674 Oak Street',
	'3153195757',
	true
),(
	'Dorothea Baldwin',
	'2835 Briercliff Road',
	'7186757386',
	true
),(
	'Alfonso Maldonado',
	'1756 Buckhannan Avenue',
	'3155067909',
	false
),(
	'Robert Horowitz',
	'1968 Stanley Avenue',
	'5165811373',
	true
);


/*
 * Photo Types and Packages
 */
INSERT INTO PhotoType(photoname,height,width,cost)
VALUES (
        'Wallet',
        1,
        1,
	4.00
),(
	'Small',
	4,
	6,
	6.00
),(
	'Large',
	8,
	12,
	7.00
),(
	'Poster',
	24,
	36,
	35.00
),(
	'Instagram',
	10,
	10,
	10.00
),(
	'Banner',
	36,
	60,
	50.00
),(
	'Window',
	48,
	48,
	40.00
),(
	'Mantle',
	12,
	16,
	15.00
),(
	'Desktop',
	5,
	5,
	6.00
),(
	'Portrait',
	24,
	18,
	20.00
);

INSERT INTO Package(description)
VALUES (
        'Just the basics'
),(
	'Extra wallet pictures'
),(
	'Advertising Special'
);

INSERT INTO PhotoInPackage(package,photo,qty)
VALUES (
       1,
       1,  
       1
),(
       1,
       2,
       1
),(
	1,
	3,
	1
);

INSERT INTO PhotoInPackage(package,photo,qty)
VALUES (
       2,
       1,
       5
),(
	2,
       2,
       1
),(
	2,
	3,
	1
);

INSERT INTO PhotoInPackage(package,photo,qty)
VALUES (
	3,
	1,
	1

),(
	3,
	2,
	4
),(
	3,
	5,
	2
);


/*
 * Event Types
 */

INSERT INTO JobType(jobmode,jobtype,cost)
VALUES (
	'Portrait',
	'Proffesional',
	15.00
),(
	'Portrait',
	'Family',
	35.00
),(
	'Event',
	'Family',
	45.00
),(
	'Event',
	'Wedding',
	75.00
);

/*
 * INSERT INTO Job(client,location,scheduled,payed,photographer)
 * SELECT (SELECT MAX(client_id) FROM Client WHERE phone ='1234567890') as client
 *     , 'Gollisano College room 3245' as location
 *     , '4/20/2015 8:20pm' as scheduled
 *     , 10.00 as balance
 *     , (SELECT MAX(photographer_id) FROM Photographer WHERE phone ='7884567863') as photographer;
 */
 
INSERT INTO Job(jobmode, jobtype, client, location, scheduled, photographer)
VALUES (
	'Portrait',
	'Family',
	2,
	'Studio room 3',
	'4/25/2015 8:20pm',
	2
);

INSERT INTO Job(jobmode, jobtype, package, client, location, scheduled, photographer,booked)
VALUES (
       'Event',
       'Wedding',
       2,
       3,
       'City Hall Rochester NY',
       '4/30/2015 11:00am',
       4,
       true
);

INSERT INTO Job(jobmode, jobtype, package, client, location,
       	        scheduled, photographer, booked, performed)
VALUES (
       'Event',
       'Family',
       1,
       1,
       '23 Alfred St. Rochester NY',
       '4/27/2015 4:00pm',
       5,
       true,
       true
);

INSERT INTO Payment(apply_to,amount,refference)
VALUES (
       2,
       40,
       'CHECK# 123487'
),(
       3,
       35,
       'CASH'
),(
	2,
	42,
	'CHECK# 324234'	
);

INSERT INTO Photo(phototype, from_job, is_ordered)
VALUES (
       1,
       2,
       false
),(
       2,
       2,
       false
),(
       3,
       2,
       true
);
