# Budget App

### REQUIREMENTS
# Allow user to enter monthly budget line items (for example, rent: 1000). Provide methods to update, add, remove lines.
# Allow user to enter expenses (for example, phone bill: -60). Include the budget category, the amount, and notes for any specifics (for example, category might be restaurants, notes might be "Bob's Pizza with Joe")
# Allow user to check remaining balance in specific budget items and total remaining balance
# Save the data for each month so you can go back and see how your budgetting fared in February
# Reset amounts when a new month starts.

### NOTES
# Use separate ruby files for methods and UI. Methods should not take direct input. 
# UI file needs a method for printing table data prettily.
# Throw error when a balance goes below 0?

### METHODS

# New budget method DONE 
# Add budget category method DONE
# Update budget category method
# Delete budget category method
# Enter new expense method DONE
# Add new month method DONE
# Add new budget-month method DONE
# Update budget-month method DONE
# Check remaining balance by category method
# Check total remaining balance method
# View all budget categories for current month method
# View budget category for all months method
# Print budget categories method DONE
# Get month ID method DONE

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

##### METHODS #####

require 'sqlite3'

def create_budget(budget_name)

  #budget_name << ".db"

  db = SQLite3::Database.new("./#{budget_name}.db")

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

end

def add_month(db)
  time = Time.new

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

def get_budgets(db)
  budgets = db.execute("SELECT * FROM budgets")
end

def add_budget_month(db, budget_id, month_id)

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

def get_budget_month_id(db, budget_id, month_id)

  budget_month_id = db.execute("SELECT id FROM budget_months WHERE budget_id=? AND month_id=?", [budget_id, month_id])

end

def enter_expense(db, budget_id, description, amount, date)
  add_month(db)

  date_array = date.split('/')

  month_id = get_month_id(db, date_array[0], date_array[2])

  add_budget_month(db, budget_id, month_id)

  budget_month_id = db.execute("SELECT id FROM budget_months WHERE budget_id=? AND month_id=?", [budget_id, month_id])

  db.execute("INSERT INTO expenses (budget_month_id, description, amount, expense_date) VALUES (?, ?, ?, ?)", [budget_month_id, description, amount, date])

  update_budget_month(db, budget_month_id, amount)
end

def update_budget_month(db, budget_month_id, amount)
  previous_bal = db.execute("SELECT balance FROM budget_months WHERE id=?", [budget_month_id])

  new_bal = previous_bal[0][0]- amount

  db.execute("UPDATE budget_months SET balance=? WHERE id=?", [new_bal, budget_month_id])
end

def check_balance_category(db, month, year, budget_id)
  month_id = get_month_id(db, month, year)
  budget_month_id = get_budget_month_id(db, budget_id, month_id)

  balance = db.execute("SELECT balance FROM budget_months WHERE id=?", [budget_month_id])
end

def check_total_balance(db, month, year)

  month_id = get_month_id(db, month, year)

  balance = db.execute("SELECT SUM(balance) FROM budget_months WHERE month_id=?", [month_id])

end

def view_budget_month(db, month, year)
  month_id = get_month_id(db, month, year)
  budget_month = db.execute("SELECT * FROM budget_months WHERE month_id=?", [month_id])
end

def view_budget_category(db, budget_id)

  budget_category = db.execute("SELECT * FROM budget_months WHERE budget_id=?", [budget_id])

end

def update_budget(db, budget_id, new_amount)

  db.execute("UPDATE budgets SET amount=? WHERE id=?", [new_amount, budget_id])

end


### DRIVER CODE
#puts database = create_budget("doom_budget")
# #add_month(database)
# ##add_budget_category(database, "food", 200)
# #add_budget_month(database, 8, 8, 2017)
# #enter_expense(database, 3, "paid rent", 750, "8/1/2017")
# #enter_expense(database, 8, "groceries", 50, "8/20/2017")
# puts check_balance_category(database, 8, 2017, 1)
# puts check_total_balance(database, 8, 2017)
# p view_budget_month(database, 8, 2017)
# p view_budget_category(database, 3)
# update_budget(database, 2, 900)
# print_budgets(database)