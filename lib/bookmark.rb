# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'bookmark_manager_test')
                 else
                   PG.connect(dbname: 'bookmark_manager')
               end
    # 3H query = ("SELECT * FROM bookmarks;")
    # p query
    # 4C result = connection.exec(query)
    # p result
    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
end
  # 2 F p "all has been called"
  # 5 G p Bookmark.all
end
