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
	'0900878989',
	false
),(
	'Robert Quiqley',
	'45 Chili Commons',
	'7884567863',
	false
);

INSERT INTO PhotoType(photoname,height,width)
VALUES (
        'Wallet',
        1,
        1
),(
	'Small',
	4,
	6
),(
	'Large',
	8,
	12
);

INSERT INTO Package(description)
VALUES (
        'Just the basics'
),(
	'Extra wallet pictures'
);

INSERT INTO PhotoInPackage(package,photo,qty)
VALUES (
       (SELECT MAX(package_id) FROM Package WHERE description = 'Just the basics'),
       (SELECT MAX(phototype_id) FROM PhotoType WHERE photoname = 'Wallet'),
       1
),(
       (SELECT MAX(package_id) FROM Package WHERE description = 'Just the basics'),
       (SELECT MAX(phototype_id) FROM PhotoType WHERE photoname = 'Small'),
       1
);

INSERT INTO PhotoInPackage(package,photo,qty)
VALUES (
       (SELECT MAX(package_id) FROM Package WHERE description = 'Extra wallet pictures'),
       (SELECT MAX(phototype_id) FROM PhotoType WHERE photoname = 'Wallet'),
       3
),(
       (SELECT MAX(package_id) FROM Package WHERE description = 'Extra wallet pictures'),
       (SELECT MAX(phototype_id) FROM PhotoType WHERE photoname = 'Small'),
       1
);

/*
 * INSERT INTO Job(client,location,scheduled,payed,photographer)
 * SELECT (SELECT MAX(client_id) FROM Client WHERE phone ='1234567890') as client
 *     , 'Gollisano College room 3245' as location
 *     , '4/20/2015 8:20pm' as scheduled
 *     , 10.00 as balance
 *     , (SELECT MAX(photographer_id) FROM Photographer WHERE phone ='7884567863') as photographer;
 */

