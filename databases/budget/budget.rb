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