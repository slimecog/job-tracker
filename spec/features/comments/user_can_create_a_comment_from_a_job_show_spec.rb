require "rails_helper"

describe "user can create a comment" do
  scenario "from a job show page" do
    company = Company.create!(name: "company")
    category = Category.create!(title: "category")
    job = Job.create!(title: "title", description: "description", level_of_interest: 10, city: "city", company: company, category_id: category.id)

    visit company_jobs_path(company, job)
    click_on "title"

    fill_in "comment[content]", with: "comment content"
    click_button "Create"

    expect(current_path).to eq(job_path(job))
    expect(page).to have_content("Title: title")
    expect(page).to have_content("comment content")
  end
end
