require "rails_helper"

describe "user creates a category" do
  scenario "from the new category page" do
    visit new_category_path

    fill_in "category[title]", with: "a title"
    click_on "Create"

    expect(current_path).to eq(category_jobs_path(Category.last.id))
  end
end
