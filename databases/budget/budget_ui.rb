require_relative 'budget'

##### User Interface Methods #####
##################################

## Take user input, call back-end methods that interface with the database ##

def ui_new_category(db)
	puts "\nName the budget category:"
	category_name = gets.chomp
	puts "Enter the budget amount:"
	category_amount = gets.chomp.to_f
	puts "Enter a due date, if this category is to be paid by a certain day each month (if there is no due date, press enter):"
	due_date = gets.chomp
	if due_date.empty? == true
		add_budget_category(db, category_name, category_amount)
	else
		add_budget_category(db, category_name, category_amount, due_date)
	end
	puts "\nYour category has been added!\n\n"
end

def ui_list_categories(db)
	budgets = get_budgets(db)
	puts "\nBudget ID".ljust(30) + "Budget Category".ljust(30) + "Amount".ljust(30) + "Due Date".ljust(30)
	print_table(budgets)
end

def ui_update_category(db)
	ui_list_categories(db)

	puts "\nEnter the ID of the category you'd like to update:"
	budget_id = gets.chomp.to_i
	puts "Enter the new budget amount:"
	amount = gets.chomp.to_f
	update_budget(db, budget_id, amount)
	puts "\nBudget updated! Please note, if you have already entered expenses for this category this month, \nonly the amount for future months will be updated. If you would like to update the current month, \nenter an expense to adjust the balance."
end

def ui_new_expense(db)
	ui_list_categories(db)

	puts "\nEnter the budget ID of your expense:"
	budget_id = gets.chomp.to_i
	puts "Enter a description of the expense:"
	description = gets.chomp
	puts "Enter the amount of the expense:"
	amount = gets.chomp.to_f
	puts "Enter the date of the expense:"
	date = gets.chomp

	enter_expense(db, budget_id, description, amount, date)

	puts "\nYour expense has been added!"
end

def ui_view_month(db)
	puts "\nEnter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i
	budgets = view_budget_month(db, month, year)

	puts "\nBudget ID".ljust(30) + "Budget Category".ljust(30) + "Month".ljust(30) + "Year".ljust(30) + "Balance".ljust(30)
	print_table(budgets)
end

def ui_view_category(db)
	ui_list_categories(db)

	puts "\nEnter the budget ID for the category you wish to view:"
	budget_id = gets.chomp.to_i

	budgets = view_budget_category(db, budget_id)

	puts "\nBudget ID".ljust(30) + "Budget Category".ljust(30) + "Month".ljust(30) + "Year".ljust(30) + "Balance".ljust(30)
	print_table(budgets)
end

def ui_view_total_balance(db)
	puts "\nEnter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	balance = get_total_balance(db, month, year)

	puts "\nYour total balance from the month of #{month}/#{year} is $%0.2f." % balance
end

def ui_view_category_balance(db)
	ui_list_categories(db)

	puts "\nEnter the budget ID for the category you wish to view:"
	budget_id = gets.chomp.to_i
	puts "Enter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	balance = get_balance_category(db, month, year, budget_id)

	puts "\nYour total balance in this category from the month of #{month}/#{year} is $%0.2f." % balance
end

def ui_view_expenses_month(db)
	puts "\nEnter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	expenses = view_expenses_month(db, month, year)

	puts "\nBudget Category".ljust(30) + "Expense Description".ljust(30) + "Expense Amount".ljust(30) + "Expense Date".ljust(30)
	print_table(expenses)
end

def ui_view_expenses_category(db)
	ui_list_categories(db)

	puts "\nEnter the budget ID for the category you wish to view:"
	budget_id = gets.chomp.to_i

	expenses = view_expenses_category(db, budget_id)

	puts "\nExpense Description".ljust(30) + "Expense Amount".ljust(30) + "Expense Date".ljust(30)
	print_table(expenses)
end

def print_table(array)
	array.each do |row|
		row.each do |i|
			if i.kind_of?(Float)
				print "$%0.2f".ljust(30) % i
			else
		  		print "#{i.to_s.ljust(30)}"
		  	end
		end
		puts ""
	end
end

##### DRIVER CODE #####
#######################

## Displays options and takes user selections. ##

puts "**********************************************"
puts "*****           Budget App              ******"
puts "***** Created by Devin Miller, 8/20/2017 *****"
puts "**********************************************"

run_options = true

while run_options == true
	puts "\nChoose an option:"
	puts "(1) Create a new budget"
	puts "(2) Choose an existing budget\n\n"

	choice = gets.chomp

	case choice
	when "1"
		puts "\nEnter a name for your budget (no spaces):"
		budget_name = gets.chomp
		db = create_budget(budget_name)
		puts "\nYour budget has been created!\n\n"
		run_options = false
	when "2"
		puts "\nExisting budgets:"
		budgets = Dir["*.db"]
		budgets.each do |budget|
			print budget + "\t"
		end
		puts "\n\n"
		puts "Choose a budget:\n\n"
		budget_name = gets.chomp.split(".db")
		db = create_budget(budget_name[0])
		puts "\nYou chose the #{budget_name[0]} budget."
		run_options = false
	else
		puts "\nInvalid input. Try again."
	end

	if run_options == false
		puts "\nPress enter to continue."
		input = gets.chomp
	end
end

run_options = true

while run_options == true
	puts "Choose an option:"
	puts "(1) Add a new budget category"
	puts "(2) Update a budget category"
	puts "(3) View list of budget categories"
	puts "(4) Enter an expense"
	puts "(5) View all budget categories by month"
	puts "(6) View a budget category for all months"
	puts "(7) Check total remaining balance for month"
	puts "(8) Check remaining balance by category"
	puts "(9) View all expenses for month"
	puts "(10) View all expenses for category"
	puts "(11) Exit program\n\n"
	choice = gets.chomp

	case choice

	when "1"
		ui_new_category(db)
	when "2"
		ui_update_category(db)
	when "3"
		ui_list_categories(db)
	when "4"
		ui_new_expense(db)
	when "5"
		ui_view_month(db)
	when "6"
		ui_view_category(db)
	when "7"
		ui_view_total_balance(db)
	when "8"
		ui_view_category_balance(db)
	when "9"
		ui_view_expenses_month(db)
	when "10"
		ui_view_expenses_category(db)
	when "11"
		run_options = false
	else
		puts "Invalid Input. Try again."
	end

	if run_options == true
		puts "\nPress enter to select another option."
		input = gets.chomp
	end
end


