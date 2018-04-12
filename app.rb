require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

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
    if Bookmark.create(url: params['url'], name: params['name'])
      flash[:message] = "#{params[:url]} was added to Bookmark Manager"
    else
      flash[:message] = 'Incorrect URL'
    end  
    redirect '/'
  end

  run! if app_file == $0
end