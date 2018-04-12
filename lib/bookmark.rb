require 'pg'

class Bookmark
  def self.connection
    if ENV['RACK_ENV'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |link| link['url'] }
  end

  def self.create(options)
  	if valid_url?(options)
	  connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}')")
	  true
	else
	  false
	end    
  end

  def self.valid_url?(options)
    url_regexp = /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix
    options[:url] =~ url_regexp ? true : false
  end
end