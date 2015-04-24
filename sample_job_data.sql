/*
 * Event Types
 */

INSERT INTO JobType(jobmode,jobtype,cost)
VALUES (
        'Portrait',
        'Single',
        15.00
),(
        'Portrait',
        'Group',
        30.00
),(
        'Portrait',
        'Family',
        45.00
),(
        'Event',
        'Graduation',
        40.00
),(
        'Event',
        'Awards Ceremony',
        85.00
),(
        'Event',
        'Buisness Conference',
        65.00
),(
        'Event',
        'Reception',
        45.00
),(
        'Event',
        'Wedding',
        75.00
),(
        'Event',
        'Family',
        45.00
);

INSERT INTO Job(jobmode, jobtype, client, location, scheduled, photographer)
VALUES (
        'Portrait',
        'Family',
        2,
        'Studio room 3',
        '4/25/2015 8:20pm',
        2
),(
	'Portrait',
	'Single',
	5,
	'Studio room 5',
	'4/27/2015 9:00pm',
	5
);

INSERT INTO Job(jobmode, jobtype, package, client, location, scheduled,
       photographer, assistant, booked)
VALUES (
       'Portrait',
       'Group',
       2,
       3,
       'City Hall Rochester NY',
       '4/30/2015 11:00am',
       4,
       NULL,
       true
),(
       'Event',
       'Wedding',
       3,
       8,
       'City Hall Rochester NY',
       '4/30/2015 11:00am',
       6,
       8,
       true
);

INSERT INTO Job(jobmode, jobtype, package, client, location,
                scheduled, photographer, assistant, booked, performed)
VALUES (
       'Event',
       'Family',
       1,
       1,
       '23 Alfred St. Rochester NY',
       '4/27/2015 4:00pm',
       5,
       9,
       true,
       true
),(
       'Portrait',
       'Family',
       1,
       1,
       '23 Alfred St. Rochester NY',
       '4/27/2015 4:00pm',
       5,
       NULL,
       true,
       true
);

INSERT INTO Payment(apply_to,amount,refference)
VALUES (
       1,
       40,
       'CHECK# 123487'
),(
       2,
       35,
       'CASH'
),(
        3,
        42,
        'CHECK# 324234'
),(
        4,
        42,
        'CHECK# 324445'
),(
        5,
        42,
        'CHECK# 784565'
),(
        5,
        40,
        'CHECK# 665540'
),(
        5,
        47,
        'CHECK# 324004'
),(
        6,
        42,
        'CHECK# 324234'
),(
        6,
        42,
        'CASH'
);

