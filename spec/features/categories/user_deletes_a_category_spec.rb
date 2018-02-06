require "rails_helper"

describe "user deletes an existing category" do
  scenario "from the category index page" do
    category = Category.create!(title: "title")
    visit categories_path

    within(".category_#{category.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("title was deleted!")
  end
end
