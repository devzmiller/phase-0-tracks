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
	puts "(9) Exit program"
	choice = gets.chomp

	case choice

	when "1"
		ui_new_category(db)
	when "2"
		ui_update_category(db)
	when "3"
		ui_list_categories(db)
	when "4"
		run_options = false
	when "5"
		run_options = false
	when "6"
		run_options = false
	when "7"
		run_options = false
	when "8"
		run_options = false
	when "9"
		run_options = false
	else
		puts "Invalid Input. Try again."
	end
end


