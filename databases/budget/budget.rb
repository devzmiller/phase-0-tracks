# Budget App

### REQUIREMENTS
# Allow user to enter monthly budget line items (for example, rent: 1000). Provide methods to update, add, remove lines.
# Allow user to enter expenses (for example, phone bill: -60). Include the budget category, the amount, and notes for any specifics (for example, category might be restaurants, notes might be "Bob's Pizza with Joe")
# Allow user to check remaining balance in specific budget items and total remaining balance
# Save the data for each month so you can go back and see how your budgetting faired in February
# Reset amounts when a new month starts.

### NOTES
# Use separate ruby files for methods and UI. Methods should not take direct input. 
# UI file needs a method for printing table data prettily.
# Throw error when a balance goes below 0?

### METHODS

## Create new budget.
# Input: budget name
# Creates new database file.
# Creates budget table.
# Creates expense table.
# Creates month table and inserts current month
# Creates budget-month table.

## Add budget category.
# Input: category name, amount, due date (optional)
# Creates new row in budget table
# Creates new row in budget-month table

## Update budget category.
# Input: budget ID to be changed, new amount.

## Delete budget category.
# Input: Category ID to be deleted.

## Enter new expense.
# Input: budget category ID, notes, amount, date.
# Calls new budget-month method.
# Use date and budget category ID to get budget-month ID. 
# Enters new row into expense table.
# Calls update budget-month method.

## Add new month
# Check if current month exists in table
# If not, create it.

## Add new budget-month
# Checks if current month exists in month table. Uses built-in ruby date/time to do this.
# If not, create new budget-month rows for all budget categories.
# Initialize remaining balance to 0.

## Update budget-month row
# Input: budget-month ID, amount.
# Updates row in budget-month table.

## Check remaining balance for budget category.
# Input: budget category ID, month, year.
# Use budget category ID to get budget-month ID.
# Get remaining balance of budget-month ID.
# Return: remaining balance.

## Check total month's remaining balance
# Input: month, year.
# Get month ID using input.
# Sum remaining balance in budget-month table where current month ID exists.
# Return remaining balance.

## View all budget categories for a given month
# Input: month, year.
# Select all rows from budget-month table for chosen month.

## View given budget category for all months.
# Input: budget category.
# Select all rows from budget-month table for chosen category.

### DATABASE DESIGN

# Budget table. ID, budget category, due date (can be null), amount
# Month table. ID, month, year
# Budget-month table. ID, budget ID, month ID, remaining balance
# Expense table. ID, budget-month ID, notes, amount, date

require 'sqlite3'
require 'faker'

## Create new budget.
# Input: budget name
# Creates new database file.
# Creates budget table.
# Creates expense table.
# Creates month table and inserts current month
# Creates budget-month table.
def create_budget(budget_name)

  db = SQLite3::Database.new("#{budget_name}.db")

  budget_tbl_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS budgets(
      id INTEGER PRIMARY KEY,
      category_name VARCHAR(255),
      amount REAL,
      due_date DATE NULL
    )
  SQL

  month_tbl_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS months(
      id INTEGER PRIMARY KEY,
      month INT,
      year INT
    )
  SQL

  budget_month_tbl_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS budget_months(
      id INTEGER PRIMARY KEY,
      budget_id INT,
      month_id INT,
      balance REAL,
      FOREIGN KEY (budget_id) REFERENCES budgets(id),
      FOREIGN KEY (month_id) REFERENCES months(id)
    )
  SQL

  expenses_tbl_cmd = <<-SQL
    CREATE TABLE IF NOT EXISTS expenses(
      id INTEGER PRIMARY KEY,
      budget_month_id INT,
      description VARCHAR(255),
      amount REAL,
      expense_date DATE,
      FOREIGN KEY (budget_month_id) REFERENCES budget_months(id)
    )
  SQL

  db.execute(budget_tbl_cmd)
  db.execute(month_tbl_cmd)
  db.execute(budget_month_tbl_cmd)
  db.execute(expenses_tbl_cmd)

  return db

  # NEED TO INSERT CURRENT MONTH INTO MONTH TABLE
end

def add_month(db)
  time = Time.new

  # get month and year from Time. Check if month table has that month and year already.
  # if it doesn't, insert the month.

  current_month = time.month
  current_year = time.year

  month_exists_cmd = <<-SQL
    SELECT * FROM months
    WHERE EXISTS (SELECT month, year FROM months WHERE month=? AND year=?)
  SQL

  month_exists = db.execute(month_exists_cmd, [current_month, current_year])

  if month_exists.empty?
    db.execute("INSERT INTO months (month, year) VALUES (?, ?)", [current_month, current_year])
  end

end

def add_budget_category(db, category_name, amount, due_date="null")

  db.execute("INSERT INTO budgets (category_name, amount, due_date) VALUES (?, ?, ?)", [category_name, amount, due_date])

end 

def print_budgets(db)

  budgets = db.execute("SELECT * FROM budgets")

  puts "Budget ID".ljust(20) + "Budget Category".ljust(20) + "Amount".ljust(20) + "Due Date".ljust(20)
  budgets.each do |row|
    row.each do |i|
      print "#{i.to_s.ljust(20)}"
    end
    puts ""
  end
end

def add_budget_month(db, budget_id, month, year)

  month_id_cmd = <<-SQL
    SELECT id FROM months
    WHERE EXISTS (SELECT month, year FROM months WHERE month=? AND year=?)
  SQL

  month_id = db.execute(month_id_cmd, [month, year])

  exists_cmd = <<-SQL
    SELECT * FROM budget_months
    WHERE EXISTS (SELECT * FROM budget_months WHERE budget_id=? AND month_id=?)
  SQL

  puts exists = db.execute(exists_cmd, [budget_id, month_id])

  balance = db.execute("SELECT amount FROM budgets WHERE id=?", [budget_id])

  if exists.empty?
    db.execute("INSERT INTO budget_months (budget_id, month_id, balance) VALUES (?, ?, ?)", [budget_id, month_id, balance])
  end
end

def get_month_id(db, month, year)

  month_id_cmd = <<-SQL
    SELECT id FROM months
    WHERE EXISTS (SELECT month, year FROM months WHERE month=? AND year=?)
  SQL

  month_id = db.execute(month_id_cmd, [month, year])

end

def enter_expense(db, budget_id, description, amount, date)
  date_array = date.split('/')

  month_id = get_month_id(db, date_array[0], date_array[2])

  budget_month_id = db.execute("SELECT id FROM budget_months WHERE budget_id=? AND month_id=?", [budget_id, month_id])

  db.execute("INSERT INTO expenses (budget_month_id, description, amount, expense_date) VALUES (?, ?, ?, ?)", [budget_month_id, description, amount, date])

  update_budget_month(db, budget_month_id, amount)
end

def update_budget_month(db, budget_month_id, amount)
  previous_bal = db.execute("SELECT balance FROM budget_months WHERE id=?", [budget_month_id])

  new_bal = previous_bal[0][0]- amount

  db.execute("UPDATE budget_months SET balance=? WHERE id=?", [new_bal, budget_month_id])
end

### DRIVER CODE
database = create_budget("test_budget")
add_month(database)
#add_budget_category(database, "rent", 800, 31)
#print_budgets(database)
add_budget_month(database, 3, 8, 2017)
#enter_expense(database, 3, "paid rent", 750, "8/1/2017")