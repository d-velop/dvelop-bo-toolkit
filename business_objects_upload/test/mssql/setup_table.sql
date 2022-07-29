CREATE TABLE dbo.dataupload_script (
    primary_key_different INT PRIMARY KEY IDENTITY,
    string TEXT NOT NULL,
    [boolean] bit NULL,
    [dateTimeOffset] datetimeoffset NULL,
    [double] float NULL,
    [guid] text NULL,
    int16 smallint NULL,
    int32 int NULL,
    int64 bigint NULL,
    [date] date NULL
);