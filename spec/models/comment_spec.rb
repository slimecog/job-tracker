require "rails_helper"

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without content" do
        company = Company.create!(name: "Turing")
        category = Category.create!(title: "cat1")
        job = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        comment = Comment.new(job_id: job.id)

        expect(comment).to_not be_valid
      end
    end

    context "valid attributes" do
      it "is valid with content" do
        company = Company.create!(name: "Turing")
        category = Category.create!(title: "cat1")
        job = Job.create!(title: "Developer", level_of_interest: 40, city: "Denver", company: company, category_id: category.id)
        comment = Comment.new(content: "content", job_id: job.id)

        expect(comment).to be_valid
      end
    end
  end
end
