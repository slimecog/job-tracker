require "rails_helper"

describe "user sees all categories" do
  scenario "a user sees all existing categories" do
    category1 = Category.create!(title: "Groceries")
    category2 = Category.create!(title: "another")
    category3 = Category.create!(title: "something")

    visit categories_path

    expect(page).to have_content(category1.title)
    expect(page).to have_content(category2.title)
    expect(page).to have_content(category3.title)
  end
end
