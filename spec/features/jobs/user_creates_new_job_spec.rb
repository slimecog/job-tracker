require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "So fun!", level_of_interest: 80, city: "Denver")
    visit new_company_job_path(company)

    fill_in "job[title]", with: job.title
    fill_in "job[description]", with: job.description
    fill_in "job[level_of_interest]", with: job.level_of_interest
    fill_in "job[city]", with: job.city

    click_button "Create"

    expect(current_path).to eq(job_path(job.id + 1))
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
