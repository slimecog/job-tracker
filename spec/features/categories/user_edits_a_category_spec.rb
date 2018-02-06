require "rails_helper"

describe "user edits an existing category" do
  scenario "from the categpry index page" do
    category = Category.create!(title: "old")
    visit edit_category_path(category)

    fill_in "category[title]", with: "new"
    click_button "Update"

    expect(current_path).to eq(category_jobs_path(category))
    expect(page).to have_content("new was updated!")
    expect(page).to have_content("new")
    expect(page).to_not have_content("old")
  end
end
