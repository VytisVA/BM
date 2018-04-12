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
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{options[:url]}')")
  end
end