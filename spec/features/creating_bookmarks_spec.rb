feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'http://newonetest.com')
    fill_in('name', with: 'newonetest')
    click_button('Submit')
    click_button('See bookmarks')

    expect(page).to have_content 'http://newonetest.com'
  end

  scenario 'A user can can only add correct URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'newonetest.com')
    fill_in('name', with: 'newonetest')
    click_button('Submit')

    expect(page).to have_content 'Incorrect URL'
  end  
end