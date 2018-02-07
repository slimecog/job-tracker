require "rails_helper"

describe "user deletes an existing job" do
  scenario "user deletes an existing job for a specific company" do
    company = Company.create!(name: "The Business")
    category = Category.create!(title: "cat1")
    job1 = company.jobs.create!(title: "Developer", description: "It Aight", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "Engineer", description: "Doin' it", level_of_interest: 80, city: "Austin", category_id: category.id)

    visit company_jobs_path(company)

    click_link "Developer"

    click_link "Delete This Job"

    expect(page).to have_content("'#{job1.title}' was Deleted!")
    expect(page).to have_content("All Jobs for #{company.name}")
    expect(page).to_not have_content("#{job1.title} at #{company.name}")
    expect(page).to have_content("#{job2.title} at #{company.name}")
  end
end
