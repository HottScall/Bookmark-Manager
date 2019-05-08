require 'bookmark'
require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.skysports.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.skynews.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.deliveroo.com');")

      bookmarks = Bookmark.all

        expect(bookmarks).to include("http://www.skysports.com")
        expect(bookmarks).to include("http://www.skynews.com")
        expect(bookmarks).to include("http://www.deliveroo.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark which is saved to the favoruites' do

      def self.create(url:, title:)
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect('bookmark_manager_test')
        else
          connection = PG.connect('bookmark_manager')
       end

       connection.exec("INSERT INTO 'bookmarks'('title', 'url') VALUES (#{title}, #{url}) RETURNING id, url, title")


    bookmark = Bookmark.create(url: params[:url], title: params[:title]).first

    expect(bookmark['url']).to eq 'http://www.testbookmarks.com'
    expect(bookmark['title']).to eq 'Test bookmark'
    end
  end
end 
end
