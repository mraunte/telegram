require 'sqlite3'
db = SQLite3::Database.new "users.db"

	if ARGV[0].to_i == 1
	db = db.execute <<-SQL
	  create table users (
	    telegram_id int,
	    who_it int,
	    facc int,
	    course int
	  );
	SQL
	elsif ARGV[0].to_i == 2
	db = db.execute <<-SQL
	  create table teachers (
		telegram_id int,
		id int,
		first_name varchar[20],
		second_name varchar[20]
		);
	SQL
	elsif ARGV[0].to_i == 10
 		db.execute("DROP TABLE users")
 	elsif ARGV[0].to_i == 20
 		db.execute("DROP TABLE teachers")

	elsif ARGV[0].to_i == 11
		db.execute( "select * from users") do |row|
  		p row
  	end
  	elsif ARGV[0].to_i == 21
  		db.execute( "select * from teachers") do |row|
  		p row
  	end

  
end