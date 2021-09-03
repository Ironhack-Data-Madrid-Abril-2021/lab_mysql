USE lab_mysql;

SELECT *
FROM cars;

UPDATE  customers
SET country = 'Ecuador'
where customer_id = 12345;

UPDATE  cars
SET vin = 0420
where vin = 1216;


UPDATE  invoice
SET customer = 'Juan'
where invoice_num = 134537;