# Budget App

# Allow user to enter monthly budget line items (for example, rent: 1000). Provide methods to update, add, remove lines.
# Allow user to enter expenses (for example, phone bill: -60). Include the budget category, the amount, and notes for any specifics (for example, category might be restaurants, notes might be "Bob's Pizza with Joe")
# Allow user to check remaining balance in specific budget items and total remaining balance
# Save the data for each month so you can go back and see how your budgetting faired in February
# Reset amounts when a new month starts.

# Database design:

# Budget table. ID, budget category, due date (can be null), amount
# Month table. ID, month, year
# Budget-month table. ID, budget ID, month ID, remaining balance
# Expense table. ID, budget-month ID, notes, amount, date