require "rails_helper"

describe "user creates a new category" do
  scenario "a user can create a new category" do
    category = Category.new(title: "Groceries")
    visit new_category_path

    fill_in "category[title]", with: "#{category.title}"
    click_button "Create Category"

    expect(page).to have_content("Groceries")
    expect(Category.count).to eq(1)
  end
end
