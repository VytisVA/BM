require 'pg'

class Bookmark

  attr_reader :url 

  def initialize(url)
    @url = url
  end

  def self.connection
    if ENV['RACK_ENV'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    else
      return PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.all
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| Bookmark.new(bookmark['url']) }
  end

  def self.create(options)
  	if valid_url?(options)
	  result = connection.exec("INSERT INTO bookmarks (url, name) VALUES('#{options[:url]}', '#{options[:name]}') RETURNING id, url")
    Bookmark.new(result.first['id'], result.first['url'])
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