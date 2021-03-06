
# frozen_string_literal: true

# frozen_string_literal: true

# As a time-pressed user
# So that I can quickly go to web sites I regularly visit
# I would like to see a list of bookmarks

feature 'Seeing a list of bookmarks' do
  scenario 'visiting the homepage ' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end

  feature 'Viewing bookmarks' do
    scenario 'A user can see bookmarks' do
      # connection = PG.connect(dbname: 'bookmark_manager_test')
      # connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
      Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'Destroy all software', url: 'http://www.destroyallsoftware.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')
      visit('/bookmarks')

      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
      expect(page).to have_link('Destroy all software', href: 'http://www.destroyallsoftware.com')
      expect(page).to have_link('Google', href: 'http://www.google.com')
    end
  end
end
