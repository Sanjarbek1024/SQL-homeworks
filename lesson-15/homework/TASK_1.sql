--CREATE DATABASE SQLexam;
--GO

--USE SQLexam;
--GO

DROP TABLE IF EXISTS Contacts;
CREATE TABLE Contacts
(
	identifier_name NVARCHAR(50),
	identifier_value NVARCHAR(255),
	firstname NVARCHAR(255),
	lastname NVARCHAR(255),
	website NVARCHAR(255),
	company NVARCHAR(255),
	phone NVARCHAR(255),
	address NVARCHAR(255),
	city NVARCHAR(255),
	state NVARCHAR(255),
	zip NVARCHAR(255),
);

INSERT INTO Contacts(identifier_name, identifier_value, firstname, lastname, website, company, phone, address, city, state, zip)
VALUES 
	('vid', '259429', 'Harper', 'Wolfberg', 'http://hubspot.com', 'HubSpot', '555-122-2323', '25 First Street', 'Cambridge', 'MA', '02139'),
	('email', 'testingapis@hubspot.com', 'Codey', 'Huang', 'http://hubspot.com', 'HubSpot', '555-122-2323', '25 First Street', 'Cambridge', 'MA', '02139'),
    ('email', 'john.doe@example.com', 'John', 'Doe', 'http://example.org', 'Example Inc', '555-345-6789', '456 Oak St', 'Boston', 'MA', '02110'),
    ('email', 'alice.wonderland@fable.com', 'Alice', 'Wonderland', 'http://fable.com', 'Fable Enterprises', '555-987-6543', '102 Rabbit Hole', 'Wonderland', 'CA', '90210'),
	('vid', '543210', 'Ava', 'Smith', 'http://example.com', 'Example Corp', '555-233-4545', '123 Maple Ave', 'Springfield', 'IL', '62701'),
    ('vid', '987654', 'Jane', 'Roe', 'http://company.net', 'Company LLC', '555-678-1234', '789 Pine Rd', 'New York', 'NY', '10001'),
    ('email', 'emily.brown@company.com', 'Emily', 'Brown', 'http://company.com', 'Company Ltd', '555-222-3333', '88 Blueberry Lane', 'Austin', 'TX', '73301'),
    ('vid', '321987', 'Robert', 'Johnson', 'http://robertj.com', 'RJ Consulting', '555-111-2222', '22 Lincoln Way', 'Columbus', 'OH', '43215'),
    ('vid', '654321', 'Michael', 'Davis', 'http://davistech.com', 'Davis Technologies', '555-444-5555', '99 Tech Park', 'Seattle', 'WA', '98109'),
    ('email', 'oliver.queen@starcity.com', 'Oliver', 'Queen', 'http://starcity.com', 'Star City Industries', '555-777-8888', '567 Arrow St', 'Star City', 'CA', '94016');


--------------------------------------------------------------------------------

SELECT * FROM Contacts

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

DECLARE @columns NVARCHAR(MAX);
DECLARE @sql NVARCHAR(MAX);

SELECT @columns = string_agg(quotename(COLUMN_NAME), ', ')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Contacts' 
AND COLUMN_NAME NOT IN ('identifier_name', 'identifier_value');

SET @sql = N'
WITH cte AS (
    SELECT 
        identifier_name, 
        identifier_value, 
        column_name AS property, 
        column_value AS value
    FROM Contacts
    UNPIVOT (
        column_value FOR column_name IN (' + @columns + ') -- Asosiy qismi, priorities dagi columnlarni kiritish
    ) AS unpvt
), 
for_json AS (
	SELECT 
        identifier_name, 
        identifier_value,
        (
            SELECT property, value
            FROM cte AS t1
            WHERE t1.identifier_name = t2.identifier_name
              AND t1.identifier_value = t2.identifier_value
              AND value IS NOT NULL  -- NULL qiymatlarni JSON da korsatmaydi, va dynamic qiladi
            FOR JSON PATH
        ) AS properties
    FROM Contacts AS t2
    GROUP BY identifier_name, identifier_value
)
SELECT STRING_AGG(
    ''{"'' + identifier_name + ''": "'' + identifier_value + ''", "properties": '' + COALESCE(JSON_QUERY(properties), ''{}'') + ''}''
, '', '') 
FROM for_json;';

EXECUTE(@sql);

------------------------------------------------------------------------------

-- Menimcha hammasi ishlayapti.
-- DYNAMIC SQL dan foydalandim. 
-- JSON formatga otkazishda birinchi properties uchun FOR JSON PATH dan foydalandim, keyin STRING_AGG()


