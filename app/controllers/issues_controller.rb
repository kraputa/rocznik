class IssuesController < ApplicationController
  before_action :admin_required

  def index
   @issues = Issue.find_by(published: true)
  end

	def prepared
    @issues = Issue.where(published: false).order(:year)
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    
    if @issue.save
      redirect_to @issue
    else
			render :new
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
    if @issue.update_attributes(issue_params)
      redirect_to @issue
    else
      render :edit
    end
  end

  def show
    @issue = Issue.find(params[:id])
  end

	def destroy
    issue = Issue.find(params[:id])
    issue.destroy
    redirect_to issues_path
  end

  private
  def issue_params
    params.require(:issue).permit(:year,:volume,:articles, submission_ids: [])
  end
end
