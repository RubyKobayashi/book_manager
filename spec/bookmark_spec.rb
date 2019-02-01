# frozen_string_literal: true

require 'database_helpers'
require 'bookmark'
RSpec.describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

      # Add the test data
      # connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers Academy', 'http://www.makersacademy.com');")
      # connection.exec("INSERT INTO bookmarks (title, url) VALUES('Destroy all software', 'http://www.destroyallsoftware.com');")
      # connection.exec("INSERT INTO bookmarks (title, url) VALUES('Google', 'http://www.google.com');")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(title: 'Test', url: 'http://www.github.com')
      persisted_data = persisted_data(id: bookmark.id)
      expect(bookmark).to be_a Bookmark
      expect(bookmark.title).to eq 'Test'
      expect(bookmark.url).to eq 'http://www.github.com'
    end
  end

  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
