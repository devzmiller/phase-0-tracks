# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# add static resources


get '/students/:id' do
  @student_id = params['id'].to_i
  @student = db.execute("SELECT name, age, campus FROM students WHERE id=?", @student_id)
  erb :student_template
end


post '/update/:student_id' do
	@student_id = params['student_id'].to_i 
  erb :form
end

post '/updated/:student_id' do

	@student_id = params['student_id'].to_i 
	db.execute("UPDATE students SET name = ?, campus = ?, age = ? WHERE id=?", [params['name'], params['campus'], params['age'].to_i, @student_id])
	redirect '/'
end