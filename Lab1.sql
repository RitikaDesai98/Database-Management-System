USE rhd11;

DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts(
	account_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    balance DOUBLE NOT NULL,
    type VARCHAR(30) NOT NULL,
    date_opened DATETIME NOT NULL,
    status VARCHAR(30) NOT NULL
) Engine = InnoDB;

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions(
	transaction_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    date_time DATETIME NOT NULL,
    amount DOUBLE NOT NULL,
    remaining_balance DOUBLE NOT NULL,
    account_id INT NOT NULL
) Engine = InnoDB;

ALTER TABLE transactions
	ADD CONSTRAINT
    FOREIGN KEY(account_id)
    REFERENCES accounts(account_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
    
INSERT INTO accounts(balance, type, date_opened, status) VALUES
(45982, 'Checking', '1970-11-19 11:15:45', 'Open'),
(9023413, 'Checking', '1998-03-16 09:12:34', 'Open'),
(4532495, 'Savings', '1960-06-25 14:45:55', 'Closed'),
(123631098, 'Savings', '1996-12-12 10:17:30', 'Open');

INSERT INTO transactions(date_time, amount, remaining_balance, account_id) VALUES
('2012-12-20 09:45:29', 1000, 44982, 1),
('2009-09-15 10:13:20', 5000, 9018412, 2),
('2010-08-02 13:45:55', 30000, 8988413, 2),
('2015-10-16 12:35:00', 15000, 4517495, 3),
('2020-02-19 09:20:00', 70000, 123561098, 4);

SELECT * FROM accounts;
SELECT * FROM transactions;