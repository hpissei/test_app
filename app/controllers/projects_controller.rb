class ProjectsController < ApplicationController
    def index
        @projects=Project.all
    end
    def new
        @project=Project.new
    end
    def create
        @project=Project.new(params[:project].permit(:project_name,:company_id,:default_rate))
        if @project.save
            flash[:notice]='Project Created'
        redirect_to @project
        else
            render 'new'
        end
    end
    def show
        @project=Project.find(params[:id])
        @company=Project.find(@project.id).company
    end
end
