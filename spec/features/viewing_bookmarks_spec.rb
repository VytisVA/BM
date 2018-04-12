require 'pg'
require 'pry'
require 'capybara/rspec'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
  	connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
	connection.exec("INSERT INTO bookmarks (url) VALUES ('http://viewing_bookmarks_test.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://viewing_bookmarks_test2.com');")
    
    visit('/bookmarks/bookmarks')

    expect(page).to have_content "http://viewing_bookmarks_test.com"
    expect(page).to have_content "http://viewing_bookmarks_test2.com"
  end
end