
# frozen_string_literal: true

# As a user
# So I can store bookmark data for later retrieval
# I want to add a bookmark to Bookmark Manager

feature 'Adding bookmarks' do
  scenario 'adding to the list of bookmarks' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.github.com')
    click_button('Submit')
    expect(page).to have_content 'https://www.github.com'
  end
end
