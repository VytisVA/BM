require 'pg'

class Bookmark

	def self.all
		conn = PG::Connection.open(:dbname => 'bookmark_manager')
		res = conn.exec_params("SELECT * FROM bookmarks")
		res.map { |bookmark| bookmark['url']}
	end

	def clearout
	  	p "Setting up test database..."
	  	connection = PG.connect(dbname: 'bookmark_manager_test')
	  	connection.exec("TRUNCATE bookmarks;")
	end	
end
