feature 'Seeing a list of bookmarks' do
  scenario 'visiting the homepage ' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end
