# frozen_string_literal: true

require 'bookmark'

feature 'deleting bookmarks' do
  scenario 'A user can delete a bookmark from the list of bookmarks' do
    Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
  end
end
