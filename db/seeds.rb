# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(title: 'Mini Tacos', description: 'With our beer braised pulled pork', price: 69, category: 'starters')
Product.create(title: 'Burrata Heaven', description: 'Slow cooked Italian tomatoes with the best Burrata', price: 99, category: 'starters')
Product.create(title: 'Chicken Devils', description: 'Tender drumsticks rolled in spicy crunch', price: 69, category: 'starters')
Product.create(title: 'Tenderloins', description: 'Best meat in town', price: 199, category: 'mains')
Product.create(title: 'Beasty Burger', description: 'Double up on Angus', price: 179, category: 'mains')
Product.create(title: 'Funghi Pizza', description: 'No ulterior motives here...', price: 135, category: 'mains')
Product.create(title: 'Rainbow Ice cream', description: 'Because why not..?', price: 129, category: 'desserts')
Product.create(title: 'Lemon Merengue', description: 'Oh sweet lemons', price: 129, category: 'desserts')
Product.create(title: 'Tiramisu', description: 'Mascarpone Al Capone Car Phone are Prone to be Shown', price: 129, category: 'desserts')