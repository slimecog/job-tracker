class JobsController < ApplicationController
  def index
    if params.keys[2] == "company_id"
      @company = Company.find(params[:company_id])
      @jobs = @company.jobs
    elsif params.keys[2] == "category_id"
      @category = Category.find(params[:category_id])
      @jobs = @category.jobs
    end
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to job_path(@job)
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update(job_params)
    if @job.save
      flash[:success] = "'#{@job.title}' was Updated!"
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    flash[:success] = "'#{@job.title}' was Deleted!"
    redirect_to company_jobs_path(@job.company_id)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
