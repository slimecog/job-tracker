class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.job_id = params[:job_id]
    if @comment.save
      flash[:success] = "You created comment for #{@comment.job.title} at #{@comment.job.company.name}"
      redirect_to job_path(@comment.job)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
