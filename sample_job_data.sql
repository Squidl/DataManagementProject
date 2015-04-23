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

