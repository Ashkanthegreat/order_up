require 'rails_helper'

RSpec.describe 'Dish show page' do
  describe "As a visitor" do
    it "Can see a list of ingredients and the chef's name" do
      bob = Chef.create(name: "Bob")
      dish1 = Dish.create(name: "Mashed Potatoes", description: "Mashed Potatoes with butter", chef_id: bob.id)
      dish2 = Dish.create(name: "Green Beans", description: "Green Beans with butter", chef_id: bob.id)
      potatoes = Ingredient.create(name: "potatoes", calories: 200)
      green_beans = Ingredient.create(name: "green beans", calories: 100)
      butter = Ingredient.create(name: "butter", calories: 300)

      DishIngredient.create(dish: dish1, ingredient: potatoes)
      DishIngredient.create(dish: dish1, ingredient: butter)
      DishIngredient.create(dish: dish2, ingredient: green_beans)
      DishIngredient.create(dish: dish1, ingredient: butter)

      visit "dishes/#{dish1.id}"

      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.chef.name)
      expect(page).to have_content(potatoes.name)
      expect(page).to have_content(butter.name)

    end

    it "Can see total calories for that dish" do
      bob = Chef.create(name: "Bob")
      dish1 = Dish.create(name: "Mashed Potatoes", description: "Mashed Potatoes with butter", chef_id: bob.id)
      dish2 = Dish.create(name: "Green Beans", description: "Green Beans with butter", chef_id: bob.id)
      potatoes = Ingredient.create(name: "potatoes", calories: 200)
      green_beans = Ingredient.create(name: "green beans", calories: 100)
      butter = Ingredient.create(name: "butter", calories: 300)

      DishIngredient.create(dish: dish1, ingredient: potatoes)
      DishIngredient.create(dish: dish1, ingredient: butter)
      DishIngredient.create(dish: dish2, ingredient: green_beans)
      DishIngredient.create(dish: dish2, ingredient: butter)

      visit "dishes/#{dish1.id}"

      expect(page).to have_content(500)


    end
  end
end


# Story 2 of 3
# As a visitor
# When I visit a dish's show page
# I see the total calorie count for that dish.
