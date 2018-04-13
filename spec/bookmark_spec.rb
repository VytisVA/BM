require 'bookmark'
require 'pry'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks wrapped in an instance' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)

      # Add the test data
      expect(urls).to include(url: 'http://databasetest1.com', name: 'databasetest1' )
      expect(urls).to include(url: 'http://databasetest2.com', name: 'databasetest2' )
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)

      expect(urls).to include (url: 'http://www.testbookmark.com', name: 'testbookmark')
    end

    it 'not creating a bookmark if url is not valid' do
      bookmarks = Bookmark.all
      urls = bookmarks.map(&:url)

      expect(urls).not_to include 'not a valid url'
    end
  end
end