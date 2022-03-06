# sql-challenge
This assignment consisted of using https://www.quickdatabasediagrams.com/ to create an entity relationship diagram (ERD) for 6 CSV files, and pgAdmin and Jupyter Notebook to perform queries and analysis on the data in the files.

# What the code does (in general terms)
The code creates a table schema and series of queries in pgAdmin, and performs additional analysis using Jupyter Notebook.

# What the code calculates

The **table_schemata.sql** code set up the table schemata for the 6 CSV's.

The **queries.sql** code displays the following:

    1. A list of the following details of each employee: employee number, last name, first name, sex, and salary.

    2. A list of the first name, last name, and hire date for employees who were hired in 1986.

    3. A list of the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

    4. A list of the department of each employee with the following information: employee number, last name, first name, and department name.

    5. A list of the first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

    6. A list of all employees in the Sales department, including their employee number, last name, first name, and department name.

    7. A list of all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

    8. A list of the frequency count of employee last names, i.e., how many employees share each last name in descending order.

The **SalaryGraphs.ipynb** code imports the SQL database into pandas using Jupyter Notebook and creates the following graphs:

    1. A histogram to visualize the most common salary ranges for employees.

    2. A bar chart of average salary by title.
