class ProjectsController < ApplicationController
    def index
        @projects=Project.all
    end
    def new
        @project=Project.new
    end
    def create
    
    end
    def show
        @project=Project.find(params[:id])
        @company=Project.find(@project.id).company
    end
end
