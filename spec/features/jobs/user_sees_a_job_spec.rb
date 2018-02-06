require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", description: "Heckin' great", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company, job)
    click_link "Developer"

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Heckin' great")
    expect(page).to have_content("70")
    expect(page).to have_content("Denver")
    expect(page).to have_content("Edit This Job")
  end
end
