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

