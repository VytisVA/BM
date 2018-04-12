require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks/bookmarks' do
    # ENV
    @bookmarks = Bookmark.all
    erb :"bookmarks/bookmarks"
  end

  get '/bookmarks/new' do
    erb :"bookmarks/new"
  end

  post '/bookmarks' do
    Bookmark.create(url: params['url'])
    redirect '/'
  end

  run! if app_file == $0
end