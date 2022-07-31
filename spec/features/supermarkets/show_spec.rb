require 'rails_helper'

RSpec.describe "supermarket show" do
  describe 'features' do
    it 'shows supermarket name and link to view all items' do
      super1 = Supermarket.create(name: 'Publix', location: 'Beaufort')
      super2 = Supermarket.create(name: 'Safeway', location: 'Denver')

      visit "/supermarkets/#{super1.id}"
      expect(current_path).to eq("/supermarkets/#{super1.id}")

      expect(page).to have_content('Publix')
      expect(page).to_not have_content('Safeway')

      expect(page).to have_link("View all Items")

      click_link "View all Items"
      expect(current_path).to eq("/supermarkets/#{super1.id}/items")
    end
  end
end
