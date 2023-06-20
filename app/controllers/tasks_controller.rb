class TasksController < ApplicationController
   include ActionView::Helpers::TextHelper 
   
   before_action :get_stages
   before_action :get_projects
   before_action :set_task, except: [:index, :create, :new]

   def index
   end 

   def show
   end

   def new
      @task = Task.new(project_id: params[:project_id], stage_id: params[:stage_id])
   end

   def create
      puts "---------------------------------"
      puts "---------------------------------"
      puts task_params
      puts "---------------------------------"
      puts "---------------------------------"
      @task = Task.new(task_params)
      if @task.save
         redirect_to @task
      else
         render :new, status: :unprocessable_entity
      end
   end

   def edit 
   end

   def update
      if @task.update(task_params)
         redirect_to @task
      else
         render :edit, status: :unprocessable_entity
      end
   end

   def destroy
      redirect_to project_stages_path(project_id: @task.project_id)
      @task.destroy
   end

   private

   def task_params
        task_params, stage_id, project_id, tag_id, user_id = params.require([:task, :stage, :project, :tag, :user])
        task_params.permit(:name, :description, :deadline).merge({project_id: project_id, user_id: user_id, stage_id: stage_id, tag_id: tag_id})
    end

   def get_stages
      @stages = Stage.where(project_id: params[:project_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path
   end

   def get_projects
      @projects = Project.where(id: params[:project_id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path
   end

   def get_tasks(stage_id)
      @tasks = Task.where(stage_id: stage_id)
   end

   def set_task
      @task = Task.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to root_path
   end

   helper_method :get_tasks

end