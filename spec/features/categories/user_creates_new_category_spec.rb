require "rails_helper"

describe "user creates a new category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Groceries"
    click_button "Create Category"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Groceries")
    expect(Category.count).to eq(4)
  end
end
