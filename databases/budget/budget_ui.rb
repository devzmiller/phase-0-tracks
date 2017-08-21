require_relative 'budget'

def ui_new_category(db)

	puts "Name the budget category:"
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
	puts "Your category has been added!"
end

def ui_list_categories(db)
	budgets = get_budgets(db)

	puts "Budget ID".ljust(20) + "Budget Category".ljust(20) + "Amount".ljust(20) + "Due Date".ljust(20)
	budgets.each do |row|
		row.each do |i|
		  print "#{i.to_s.ljust(20)}"
		end
		puts ""
	end
end

def ui_update_category(db)
	ui_list_categories(db)

	puts "Enter the ID of the category you'd like to update:"
	budget_id = gets.chomp.to_i
	puts "Enter the new budget amount:"
	amount = gets.chomp.to_f
	update_budget(db, budget_id, amount)
	puts "Budget updated! Please note, this will only update the budget balances for future months. If you would like to update the current month, enter an expense to adjust the balance."
end

def ui_new_expense(db)

	ui_list_categories(db)

	puts "Enter the budget ID of your expense:"
	budget_id = gets.chomp.to_i
	puts "Enter a description of the expense:"
	description = gets.chomp
	puts "Enter the amount of the expense:"
	amount = gets.chomp.to_f
	puts "Enter the date of the expense:"
	date = gets.chomp

	enter_expense(db, budget_id, description, amount, date)
end

def ui_view_month(db)

	puts "Enter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i
	budgets = view_budget_month(db, month, year)

	puts "Budget ID".ljust(20) + "Budget Category".ljust(20) + "Month".ljust(20) + "Year".ljust(20) + "Balance".ljust(20)
	budgets.each do |row|
		row.each do |i|
		  print "#{i.to_s.ljust(20)}"
		end
		puts ""
	end
end

def ui_view_category(db)

	ui_list_categories(db)

	puts "Enter the budget ID for the cateogry you wish to view:"
	budget_id = gets.chomp.to_i

	budgets = view_budget_category(db, budget_id)

	puts "Budget ID".ljust(20) + "Budget Category".ljust(20) + "Month".ljust(20) + "Year".ljust(20) + "Balance".ljust(20)
	budgets.each do |row|
		row.each do |i|
		  print "#{i.to_s.ljust(20)}"
		end
		puts ""
	end

end

def ui_view_total_balance(db)

	puts "Enter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	balance = check_total_balance(db, month, year)

	puts "Your total balance from the month of #{month}/#{year} is $%0.2f." % balance

end

def ui_view_category_balance(db)

	ui_list_categories(db)

	puts "Enter the budget ID for the cateogry you wish to view:"
	budget_id = gets.chomp.to_i
	puts "Enter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	balance = check_balance_category(db, month, year, budget_id)

	puts "Your total balance in this category from the month of #{month}/#{year} is $%0.2f." % balance

end

def ui_view_expenses_month(db)
	
	puts "Enter the month you wish to view (in number format, ex. 6 for June):"
	month = gets.chomp.to_i
	puts "Enter the year you wish to view:"
	year = gets.chomp.to_i

	expenses = view_expenses_month(db, month, year)

	puts "Budget Category".ljust(20) + "Expense Description".ljust(20) + "Expense Amount".ljust(20) + "Expense Date".ljust(20)
	expenses.each do |row|
		row.each do |i|
		  print "#{i.to_s.ljust(20)}"
		end
		puts ""
	end

end

puts "***********"
puts "Budget App"
puts "Created by Devin Miller, 8/20/2017"
puts "***********"

run_options = true

while run_options == true
	puts "Choose an option:"
	puts "(1) Create a new budget"
	puts "(2) Choose an existing budget"
	choice = gets.chomp
	case choice
	when "1"
		puts "Enter a name for your budget (no spaces):"
		budget_name = gets.chomp
		db = create_budget(budget_name)
		puts "Your budget has been created!"
		run_options = false
	when "2"
		puts "Existing budgets:"
		budgets = Dir["*.db"]
		budgets.each do |budget|
			print budget + "\t"
		end
		puts ""
		puts "Choose a budget:"
		budget_name = gets.chomp.split(".db")
		db = create_budget(budget_name[0])
		run_options = false
	else
		puts "******"
		puts "Invalid input. Try again."
		puts "******"
	end

	puts "Press enter to continue."
	input = gets.chomp
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
	puts "(10) Exit program"
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
		run_options = false
	else
		puts "Invalid Input. Try again."
	end

	if run_options == true
		puts "Press enter to select another option."
		input = gets.chomp
	end
end


