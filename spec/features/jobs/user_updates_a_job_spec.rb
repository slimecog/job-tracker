require "rails_helper"

describe "user updates an existing job" do
  scenario "user can update an existing job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company, job)
    click_link "Developer"
    click_link "Edit This Job"

    fill_in "job[description]", with: "So hard!"
    click_button "Update"

    expect(page).to have_content("'#{job.title}' was Updated!")
    expect(page).to have_content("Title: #{job.title}")
    expect(page).to have_content("Description: So hard!")
    expect(page).to have_content("Level of Interest: #{job.level_of_interest}")
    expect(page).to have_content("City: #{job.city}")
    expect(page).to have_content("Company: #{company.name}")
    expect(page).to have_content("Edit This Job")
  end
end
