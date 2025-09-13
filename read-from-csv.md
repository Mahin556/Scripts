Got it 👍 You want **Bash scripts to read content from a CSV file**.
I’ll show you **different methods** (basic → advanced), depending on what you want to do.

---

## 1. Read line by line

```bash
#!/bin/bash

file="data.csv"

while IFS=, read -r col1 col2 col3
do
  echo "Column1: $col1 | Column2: $col2 | Column3: $col3"
done < "$file"
```

* `IFS=,` → sets delimiter to a comma
* `read -r col1 col2 col3` → stores values in variables

---

## 2. Skip header row

```bash
#!/bin/bash

file="data.csv"

tail -n +2 "$file" | while IFS=, read -r col1 col2 col3
do
  echo "Name: $col1, Age: $col2, City: $col3"
done
```

* `tail -n +2` → starts reading from line 2 (skipping header).

---

## 3. Read into array

```bash
#!/bin/bash

file="data.csv"

while IFS=, read -r -a row
do
  echo "Row: ${row[*]}"
done < "$file"
```

* Each row is stored in array `row[]`.
* Access like `${row[0]}`, `${row[1]}`, etc.

---

## 4. Extract a specific column

```bash
#!/bin/bash

file="data.csv"

cut -d, -f2 "$file"
```

* Prints only column 2 from CSV.

---

## 5. Process with `awk`

```bash
#!/bin/bash

file="data.csv"

awk -F, '{ print "First: "$1 " | Second: "$2 " | Third: "$3 }' "$file"
```

* `-F,` sets delimiter as comma.
* `$1, $2, $3` are fields.

---

## 6. Example: CSV with Name, Age, City

**data.csv**

```
Name,Age,City
Alice,30,New York
Bob,25,London
Charlie,35,Paris
```

**Script (reading into variables):**

```bash
#!/bin/bash

file="data.csv"

tail -n +2 "$file" | while IFS=, read -r name age city
do
  echo "Name=$name | Age=$age | City=$city"
done
```

Output:

```
Name=Alice | Age=30 | City=New York
Name=Bob | Age=25 | City=London
Name=Charlie | Age=35 | City=Paris
```

---

## 7. Handling quoted fields (with commas inside)

If CSV has `"New York, USA"` style fields:

```bash
#!/bin/bash

file="data.csv"

while IFS= read -r line
do
  echo "$line" | awk -F, -v OFS=" | " '{ print "Col1="$1,"Col2="$2,"Col3="$3 }'
done < "$file"
```

For **complex CSV parsing with quotes/commas**, it’s better to use **Python** or tools like `csvkit`.

---

✅ With these scripts, you can:

* Read row by row
* Skip headers
* Extract columns
* Handle into arrays
* Use `awk` for processing

---

Do you want me to make a **general-purpose Bash CSV parser function** (so you can pass file name + delimiter and get each row in variables)?
