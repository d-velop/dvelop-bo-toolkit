INSERT INTO dbo.dataupload_script (
    string,
    [boolean],
    [dateTimeOffset],
    [double],
    [guid],
    int16,
    int32,
    int64,
    [date]
) VALUES (
    'Yamia',
    1,
    CAST('2020-03-03 15:15:00.0000000' AS DATETIMEOFFSET),
    8369.5,
    'ac9d69fe-a9fd-4233-85db-52026687e5e3',
    11989,
    41969,
    409016,
    '2020-10-02'
),(
    'Voolith',
    1,
    CAST('2019-08-07 15:15:00.0000000' AS DATETIMEOFFSET),
    2675.5,
    'cd9c72ca-9fd6-4273-8237-f9218e7352ad',
    19113,
    11881,
    281408,
    '2021-03-02'
),(
    'Voolith',
    1,
    CAST('2020-01-25 15:15:00.0000000' AS DATETIMEOFFSET),
    5650.5,
    '414ec142-868c-470b-9c20-fb0cc09082a6',
    5650,
    42253,
    720383,
    '2020-09-15'
),(
    'Realmix',
    0,
    CAST('2020-09-12 15:15:00.0000000' AS DATETIMEOFFSET),
    8458.5,
    '1eae6971-4b0b-4374-8b45-43fcf4d7d1f7',
    18838,
    20173,
    117257,
    '2021-06-10'
),(
    'Youbridge',
    1,
    CAST('2021-05-07 15:15:00.0000000' AS DATETIMEOFFSET),
    7634.5,
    'f32fe588-3f20-4e20-9e34-04b06d432c92',
    22625,
    56067,
    960675,
    '2020-12-11'
),(
    'Twiyo',
    0,
    CAST('2020-04-23 15:15:00.0000000' AS DATETIMEOFFSET),
    6475.5,
    '789d0d08-b70f-45d8-9dbc-257a6d35ffb4',
    30095,
    71793,
    253110,
    '2021-06-06'
),(
    'Dabtype',
    1,
    CAST('2021-04-03 15:15:00.0000000' AS DATETIMEOFFSET),
    9436.5,
    '1cf23037-7fad-46a8-a9aa-c74f355973f5',
    11562,
    90319,
    159741,
    '2020-08-04'
),(
    'Twiyo',
    1,
    CAST('2020-04-30 15:15:00.0000000' AS DATETIMEOFFSET),
    2224.5,
    'a6f8bc21-db20-4036-95ec-3678d1c6aa23',
    10816,
    21169,
    491304,
    '2020-10-06'
),(
    'Kwinu',
    1,
    CAST('2020-01-17 15:15:00.0000000' AS DATETIMEOFFSET),
    309.5,
    '6ee518a6-a867-466d-8ab4-0cdba5ed5cc7',
    17435,
    46251,
    696067,
    '2020-11-19'
),(
    'Devpoint',
    0,
    CAST('2020-06-06 15:15:00.0000000' AS DATETIMEOFFSET),
    2076.5,
    '3a394ceb-b1e8-4701-b5c6-98cd2bc00965',
    32478,
    71292,
    954981,
    '2020-11-08'
);

INSERT INTO dbo.dataupload_script (
    string
) VALUES (
    'Empty'
)