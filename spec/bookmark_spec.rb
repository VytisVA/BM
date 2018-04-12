require 'bookmark'
require 'pry'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks in an array' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      Bookmark.create(url: 'http://databasetest1.com', name: 'databasetest1' )
      Bookmark.create(url: 'http://databasetest2.com', name: 'databasetest2' )

      expected_bookmarks = [
        'http://databasetest1.com',
        'http://databasetest2.com'
      ]

      expect(Bookmark.all).to eq expected_bookmarks
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create(url: 'http://www.testbookmark.com', name: 'testbookmark')

      expect(Bookmark.all).to include 'http://www.testbookmark.com'
    end

    it 'not creating a bookmark if url is not valid' do
      Bookmark.create(url: 'not a valid url')

      expect(Bookmark.all).not_to include 'not a valid url'
    end
  end
end