select *
from [dbo].[credit_d]

select *
from [dbo].[cust_detail]

-- 4. Insert additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table

-- Set the date format to DD-MM-YYYY
SET DATEFORMAT dmy;

BULK INSERT credit_d
FROM 'C:\Users\Imart\Downloads\cc_add.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if your CSV has a header row
);
-- copy additional data (week-53) in cust_detail table (remember to update the file name and file location in below query)
BULK INSERT cust_detail
FROM 'C:\Users\Imart\Downloads\cust_add.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if your CSV has a header row
);





COPY cust_detail
FROM 'D:\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;
