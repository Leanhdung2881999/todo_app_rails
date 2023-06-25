class ProjectsController < ApplicationController
  include ActionView::Helpers::TextHelper 
  
  before_action :authenticate_user!
  before_action :get_users
  before_action :set_project, only: %i[edit update show destroy]

  def authenticate_user!
    if current_user.blank? 
      redirect_to login_path
    end 
  end

  def index
    search_value = params[:search_value]
    if search_value.blank?.!
      @projects = Project.owner_projects(current_user.id).search(search_value)
    else
      @projects = Project.owner_projects(current_user.id)
    end
    @pagy, @projects = pagy(@projects)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
        redirect_to @project
    else
        render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end


  private

  def project_params
    project_params, tag_params, user_params = params.require([:project, :tag, :user])
    project_params.permit(:name, :start_time, :end_time, :budget, :description).merge({user_id: user_params, tag_id: tag_params})
  end

  def get_users
    @users = User.all
  end

  def set_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
  end

  def get_total_tasks(project_id)
    Task.where(project_id: project_id).count
  end

  def get_user_avatars(project_id)
    tasks = Task.where(project_id: project_id)
    avatars = []
    tasks.each do |i|
      avatars << i.user.avatar
    end
    return avatars
  end

  def filter_stages_by_project
    @stages = Stage.where(project_id: params[:project_id])
  end

  helper_method :get_total_tasks
  helper_method :get_user_avatars
  helper_method :filter_stages_by_project
end
