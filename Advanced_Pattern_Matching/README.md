# ADVANCED SQL PATTERN MATCHING

This table summarizes the commonly used regular expression patterns in MySQL `REGEXP` queries for advanced SQL pattern matching.

| Pattern      | Symbol / Format     | Explanation                                         | Example SQL Query |
|--------------|---------------------|-----------------------------------------------------|-------------------|
| `^J`         | `^`                 | Matches strings that **start with 'J'**             | `SELECT * FROM Employees WHERE name REGEXP '^J';` |
| `n$`         | `$`                 | Matches strings that **end with 'n'**               | `SELECT * FROM Employees WHERE name REGEXP 'n$';` |
| `a.b`        | `.`                 | Any **single character** between `a` and `b`        | `SELECT * FROM Employees WHERE name REGEXP 'a.b';` |
| `go*`        | `*`                 | `'g'` followed by **zero or more 'o'**              | `SELECT * FROM Employees WHERE name REGEXP 'go*';` |
| `go+`        | `+`                 | `'g'` followed by **one or more 'o'**               | `SELECT * FROM Employees WHERE name REGEXP 'go+';` |
| `colou?r`    | `?`                 | Matches **'color' or 'colour'**                     | `SELECT * FROM Employees WHERE name REGEXP 'colou?r';` |
| `[aeiou]`    | `[]`                | Contains **any one vowel**                          | `SELECT * FROM Employees WHERE name REGEXP '[aeiou]';` |
| `[^aeiou]`   | `[^]`               | **Does not** contain a vowel                        | `SELECT * FROM Employees WHERE name REGEXP '^[^aeiou]';` |
| `[0-9]{3}`   | `{n}`               | Exactly **3 digits**                                | `SELECT * FROM Employees WHERE email REGEXP '[0-9]{3}';` |
| `a{2,}`      | `{n,}`              | At least **2 'a's**                                 | `SELECT * FROM Employees WHERE name REGEXP 'a{2,}';` |
| `a{2,4}`     | `{n,m}`             | **2 to 4** 'a's in a row                            | `SELECT * FROM Employees WHERE name REGEXP 'a{2,4}';` |
| `(ab)+`      | `()`                | Matches one or more **'ab'** substrings             | `SELECT * FROM Employees WHERE name REGEXP '(ab)+';` |
| `\\.`        | `\\`                | Escapes special characters (e.g., dot)              | `SELECT * FROM Employees WHERE email REGEXP '\\.';` |
| `[A-Z]`      | `[A-Z]`             | Matches any **uppercase** letter                    | `SELECT * FROM Employees WHERE department REGEXP '[A-Z]';` |
| `[a-z]`      | `[a-z]`             | Matches any **lowercase** letter                    | `SELECT * FROM Employees WHERE department REGEXP '[a-z]';` |
| `[0-9]`      | `[0-9]`             | Matches any **digit 0–9**                           | `SELECT * FROM Employees WHERE name REGEXP '[0-9]';` |
| `^.{5}$`     | `.` with `^` & `$`  | Matches strings with **exactly 5 characters**       | `SELECT * FROM Employees WHERE name REGEXP '^.{5}$';` |
| `([a-z])\\1` | Backreference       | Matches **repeated characters** (like `'ss'`)       | `SELECT * FROM Employees WHERE name REGEXP '([a-z])\\1';` |
| `^[a-z0-9_]+@[a-z]+\\.com$` | Full pattern | Validates **simple `.com` email format**       | `SELECT * FROM Employees WHERE email REGEXP '^[a-z0-9_]+@[a-z]+\\.com$';` |

> ✅ Use `REGEXP` or `RLIKE` in MySQL for pattern matching. Be mindful of escape characters (`\\`) in regex.


