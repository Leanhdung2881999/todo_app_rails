class StagesController < ApplicationController
    before_action :get_stages
    
    def index
    end

    def create
        @stage = Stage.new(stage_params)
        if @stage.save
            respond_to do |format|
                format.html { redirect_to project_stages_path(project_id: @stage.project_id) }
            end
        end
    end

    def destroy
        stage = Stage.find(params[:id])
        respond_to do |format|
            format.html { redirect_to project_stages_path(project_id: stage.project_id) }
        end
        stage.destroy
    end

    private

    def stage_params
        stage_params= params.require(:stage)
        stage_params.permit(:name, :project_id)
    end

    def get_stages
        @stages = Stage.where(project_id: params[:project_id])
    end

    def get_tasks(stage_id)
        search_value = params[:search_value]
        if search_value.blank?.!
            @tasks = Task.where(stage_id: stage_id).search(search_value)
        else
            @tasks = Task.where(stage_id: stage_id)
        end
    end

    def get_total_tasks(stage_id)
        Task.where(stage_id: stage_id).count
    end

    helper_method :get_tasks
    helper_method :get_total_tasks
    
end