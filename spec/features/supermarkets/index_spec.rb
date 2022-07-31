require 'rails_helper'

RSpec.describe "supermarket index" do
  describe 'features' do
    it 'shows supermarket name and link to view all items' do
      super1 = Supermarket.create(name: 'Publix', location: 'Beaufort')

      customer1 = super1.customers.create(name: "John")
      customer2 = super1.customers.create(name: "Sarah")

      item1 = Item.create(name: "toothpaste", price: 3)
      item2 = Item.create(name: "apple", price: 1)
      item3 = Item.create(name: "chicken", price: 6)
      item4 = Item.create(name: "spinach", price: 2)
      
      custitem1 = CustomerItem.create(customer: customer1, item: item1)
      custitem2 = CustomerItem.create(customer: customer1, item: item2)
      custitem3 = CustomerItem.create(customer: customer1, item: item3)
      custitem4 = CustomerItem.create(customer: customer2, item: item4)
      custitem4 = CustomerItem.create(customer: customer2, item: item1)
      custitem4 = CustomerItem.create(customer: customer2, item: item2)

      visit "/supermarkets/#{super1.id}/items"
      expect(current_path).to eq("/supermarkets/#{super1.id}/items")
      #save_and_open_page
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item2.name)
      expect(page).to have_content(item3.name)
      expect(page).to have_content(item4.name)
    end
  end
end
