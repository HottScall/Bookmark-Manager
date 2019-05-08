require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base

get '/' do
  erb :homepage
end

post '/add' do
Bookmark.add(params[:add_bookmark])
redirect '/bookmarks'
end

get '/bookmarks' do
  @bookmarks = Bookmark.all
  erb:'bookmarks/index'
end

post 'bookmarks_new' do
  Bookmark.create(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end

run! if app_file == $0
end
