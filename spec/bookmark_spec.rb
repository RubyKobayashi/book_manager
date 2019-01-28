# frozen_string_literal: true

require 'bookmark'
RSpec.describe Bookmark do
  describe '.all' do
    it 'returns all the bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end
end
