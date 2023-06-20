class StagesController < ApplicationController
    before_action :get_stages
    
    def index
    end

    private

    def get_stages
        @stages = Stage.where(project_id: params[:project_id])
    end

    def get_tasks(stage_id)
      @tasks = Task.where(stage_id: stage_id)
    end

    def get_total_tasks(stage_id)
        Task.where(stage_id: stage_id).count
    end

    helper_method :get_tasks
    helper_method :get_total_tasks

    
end