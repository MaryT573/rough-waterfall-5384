require 'rails_helper'

RSpec.describe "customer show" do
  describe 'features' do
    it "can display a list of items associated with the customer and the name of the supermarket" do
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

      visit "/customers/#{customer1.id}"
      expect(current_path).to eq("/customers/#{customer1.id}")

      expect(page).to_not have_content(customer2.name)

      expect(page).to have_content(customer1.name)
      expect(page).to have_content(super1.name)

      within "#customer-item" do
        expect(page).to have_content(item1.name)
        expect(page).to have_content(item2.name)
        expect(page).to have_content(item3.name)
        expect(page).to_not have_content(item4.name)
      end
    end

    it 'can display total price of items' do
      super1 = Supermarket.create(name: 'Publix', location: 'Beaufort')

      customer1 = super1.customers.create(name: "John")

      item1 = Item.create(name: "toothpaste", price: 3)
      item2 = Item.create(name: "apple", price: 1)
      item3 = Item.create(name: "chicken", price: 6)

      custitem1 = CustomerItem.create(customer: customer1, item: item1)
      custitem2 = CustomerItem.create(customer: customer1, item: item2)
      custitem3 = CustomerItem.create(customer: customer1, item: item3)

      visit "/customers/#{customer1.id}"
      expect(current_path).to eq("/customers/#{customer1.id}")

      within "#total-price" do
        expect(page).to have_content(10)
      end
    end
  end
end
