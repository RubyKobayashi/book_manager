# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    # E 1
    # p "request arrived"
    @bookmarks = Bookmark.all
    # B, D
    # result = erb :'bookmarks/index'
    # p result
    # result
    erb :'bookmarks/index'
  end

  run! if app_file == $PROGRAM_NAME
end
