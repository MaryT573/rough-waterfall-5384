# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

CustomerItem.destroy_all
Customer.destroy_all
Item.destroy_all
Supermarket.destroy_all

super1 = Supermarket.create(name: 'Publix', location: 'Beaufort')
super2 = Supermarket.create(name: 'Safeway', location: 'Denver')

customer1 = super1.customers.create(name: "John")
customer2 = super1.customers.create(name: "Sarah")
customer3 = super2.customers.create(name: "Eliza")
customer4 = super2.customers.create(name: "George")

item1 = Item.create(name: "toothpaste", price: 3)
item2 = Item.create(name: "apple", price: 1)
item3 = Item.create(name: "chicken", price: 6)
item4 = Item.create(name: "spinach", price: 2)

custitem1 = CustomerItem.create(customer: customer1, item: item1)
custitem1 = CustomerItem.create(customer: customer1, item: item2)
custitem1 = CustomerItem.create(customer: customer2, item: item3)
custitem1 = CustomerItem.create(customer: customer2, item: item4)
custitem1 = CustomerItem.create(customer: customer3, item: item1)
custitem1 = CustomerItem.create(customer: customer3, item: item2)
custitem1 = CustomerItem.create(customer: customer4, item: item3)
