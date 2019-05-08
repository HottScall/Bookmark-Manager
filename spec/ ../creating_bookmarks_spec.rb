feature do
  scenario do
    visit ('bookmarks/new')
    fill_in :url, with: ('http://www.testbookmarks.com')
    fill_in :title, with: ('Test bookmark')
    click_button 'Submit'

    expect(page).to have_link('Test bookmark', href: 'http://www.testbookmarks.com' )
  end
end
