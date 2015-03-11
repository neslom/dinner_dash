# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

item_contents = ([{ name: "Chocolate Toast", description: "Dark chocolate on toast",
        price: "3.00"}, { name: "Cake Toast", description: "Lemon poppyseed cake on toast", price: "4.00"},
        { name: "Brownie Toast", description: "Delicious dark chocolate brownie on toast", price: "4.00"},
        { name: "Cinnamon Sugar Toast", description: "Toast sprinkled with raw cane sugar, fresh ground
        cinnamon, and a hint of sea salt", price: "2.50"}, { name: "Avacodo Toast", description: "Fresh
        California avacado sliced over toast", price: "5.00"}, { name: "Egg Toast", description: "Choose
        from fried or scrambled eggs!", price: "4.00"}, { name: "Dry Toast", description: "Nothing on it",
        price: "2.00"}, { name: "Tuna Salad Toast", description: "With pickles,onions, and a hint of basil",
        price: "4.50"}, { name: "Enchilada Toast", description: "Black beans, chicken, and salsa", price:
        "5.00"}, { name: "Mac and Cheese Toast", description: "Rich, three cheese mac and cheese, on toast",
        price: "4.50"}, { name: "Salad Toast", description: "House salad on toast", price: "4.00"}, { name:
        "Lasagna Toast", description: "Roasted veggies, ground beef and pork", price: "7.00"}, { name:
        "Sausage Toast", description: "German style brat on toast", price: "6.00"}, { name: "Risotto Toast",
        description: "Rich risotto on toast", price: "5.50"}, { name: "Chicken Toast", description: "Fried
        or grilled!", price: "8.00"}, { name: "Eggplant Toast", description: "Roasted Eggplant on toast",
        price: "5.00"}, { name: "Curry Toast", description: "Spicy and delicious", price: "8.00"}, { name:
        "Steak Toast", description: "Flank Steak", price: "7.50"}, { name: "Tofu Toast", description:
        "Marinated tofu", price: "4.00"}, { name: "Salmon Toast", description: "Alaskan made!", price:
        "8.00"}])

item_contents.each { |content| Item.create(content) }

category_contents = ([{ name: "Side dishes"}, { name: "Small plates" }, { name: "Desserts"}, { name: "Main Courses"},
              { name: "Specials" }])

category_contents.each { |content| Category.create(content) }
