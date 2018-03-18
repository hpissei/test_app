class ProjectsController < ApplicationController
    def index
        @projects=Project.all
    end
    #new and create for new
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
    #edit and update for edit form
    def edit
        @project=Project.find(params[:id])
    end
    def update
        @project=Project.find(params[:id])
        if(@project.update(params[:project].permit(:project_name,:company_id,:default_rate)))
            flash[:notice]="Project updated"
            redirect_to @project
        else
            render 'new'
        end

    end
    
end
