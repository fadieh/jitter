require 'spec_helper'

feature "User browses the list of links" do

  before(:each) {
    Cheep.create(:message => "Hello World",
                :username => "Fadie")
  }

  scenario "When opening the home page" do
    visit '/'
    expect(page).to have_content("Hello World")
  end
end