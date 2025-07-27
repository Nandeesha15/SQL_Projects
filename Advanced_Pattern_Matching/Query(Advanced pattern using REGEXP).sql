CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50)
);

INSERT INTO Employees (id, name, email, department) VALUES
(1, 'John Smith', 'john.smith@example.com', 'Engineering'),
(2, 'Jane Doe', 'jane_doe123@workmail.com', 'Marketing'),
(3, 'Ian Oliver Newton', 'ian.newton99@example.net', 'Research'),
(4, 'Evan Evans', 'evan.evans@company.org', 'Development'),
(5, 'Ravi Kumar', 'ravi.kumar@tech.co.in', 'Support'),
(6, 'Ananya Rao', 'ananya@hrmail.com', 'HR'),
(7, 'Michael Jordan', 'mj23@basketball.com', 'Sports'),
(8, 'Alice Wonderland', 'alice.w@wonderland.com', 'Design'),
(9, 'Bob Marley', 'bob@reggae.com', 'Music'),
(10, 'Kumar Vishwas', 'kumar@poetry.com', 'Arts'),
(11, 'Sunny Leone', 'sunny.leone@movies.net', 'Film'),
(12, 'Sundar Pichai', 'sundar@google.com', 'Executive'),
(13, 'Steve Jobs', 'steve@apple.com', 'Executive'),
(14, 'Bill Gates', 'bill.gates@microsoft.com', 'Executive'),
(15, 'Ramesh Babu Rao', 'ramesh.babu@domain.com', 'Operations'),
(16, 'Manoj Prabhakar', 'manoj_p@cricket.org', 'Sports'),
(17, 'Anil Kapoor', 'anil.kapoor@film.com', 'Entertainment'),
(18, 'Mohan Lal', 'mohan@cinema.com', 'Entertainment'),
(19, 'Tom Cruise', 'tom.cruise@hollywood.com', 'Acting'),
(20, 'Cristiano Ronaldo', 'cr7@football.com', 'Sports');

-- ADVANCED PATTERN MATCHING 

select * from Employees order by name;

-- 1.	Get all employees whose name starts with J
select * from Employees where name regexp '^J';

-- 2.Find employees whose name ends with ‘n’
select * from Employees where name regexp 'n$';

-- 3.List employees whose name has any character between 'a' and 'b'
select * from employees where name  regexp 'a.b';

-- 4.Name has g followed by zero or more o
select * from Employees where name regexp 'go*';

-- 5. Find employees whose name contains ‘g’ followed by one or more ‘o’ characters.alter
select * from Employees where name regexp 'go+';

-- 6.Find employees whose name contains either "color" or "colour" 
select * from Employees where name regexp 'colo?r';

-- 7. Pattern: [aeiou]
select *from Employees where name regexp '[aeiou]';

-- 8.Find employees whose names do not start with a vowel.
select * from Employees where name regexp '^[^aeiouAEIOU]';

-- 9.Find employees whose email contains exactly 3 digits in a row (e.g., abc123@..., user999@...).
select *from Employees where email regexp '[0-9]{3}';

-- 10.Find employees whose names contain at least two consecutive 'a' characters (like "Aarav", "Raaheem").alter
select * from Employees where name regexp 'a{2,}';

-- 11.Get all employees whose name contains 2 to 4 consecutive 'a' characters.
select * from Employees where name regexp 'a{2,4}';

-- 12.Get all employees whose name contains the substring 'ab' repeated one or more times.
select * from Employees where name regexp '(ab)+';

-- 13.Match any name containing a literal dot (.) character (like "john.doe"):
select * from Employees where name regexp '[\\.]';

-- 14. Select all employees whose department contains any uppercase letter.
select * from Employees where department regexp '[A-Z]';

-- 15.Select all employees whose department contains any lowercase letter.
select * from Employees where department regexp '[a-z]';

-- 16.List all employees whose names contain at least one digit (e.g., "John2", "3Mike").
select * from Employees where name regexp '[0-9]+';

-- 17. Find all employees whose name is exactly 5 characters long.
select * from Employees where name regexp '^.{5}$';

-- 18.Get all employees whose names contain two identical lowercase letters next to each other (like “Aaron”, “Bobby”, or “Nissa”).
SELECT * FROM Employees WHERE name REGEXP '([a-z])\\1';

-- 19.Write a query to fetch all employees whose email matches a 
-- valid pattern where: It starts with lowercase letters, numbers, 
-- or underscores ([a-z0-9_]+) Followed by @Then a domain name with only lowercase letters ([a-z]+)
-- Ends with .com
select * from Employees where email regexp '^[a-z0-9_]+@[a-z]+\\.com$';
