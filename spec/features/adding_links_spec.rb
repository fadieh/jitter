require 'spec_helper'

feature "User adds a new cheep" do
	scenario "when browsing the homepage" do
		expect(Cheep.count).to eq(0)
		visit '/'
		add_cheep("Hello world")
		expect(Cheep.count).to eq(1)
		cheep = Cheep.first
		expect(cheep.message).to eq("Hello world")
	end

	def add_cheep(message)
		within('#new-cheep') do
			fill_in 'message', :with => message
			click_button 'Add cheep'
		end
	end
end