require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should have_many(:customers).through(:customer_items) }
    it { should have_many :customer_items }
  end

  describe 'features' do
    it 'can add item prices' do
      item1 = Item.create(name: "toothpaste", price: 3)
      item2 = Item.create(name: "apple", price: 1)
      item3 = Item.create(name: "chicken", price: 6)

      expect(Item.all.total_price).to eq(10)
    end
  end
end
