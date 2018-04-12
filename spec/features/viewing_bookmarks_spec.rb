require 'pg'
require 'pry'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
  	# connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    Bookmark.create(url: 'http://viewing_bookmarks_test.com')
    Bookmark.create(url: 'http://viewing_bookmarks_test2.com')
    
    visit('/bookmarks')

    expect(page).to have_content "http://viewing_bookmarks_test.com"
    expect(page).to have_content "http://viewing_bookmarks_test2.com"
  end
end