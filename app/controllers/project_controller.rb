class ProjectController < ApplicationController
    def index
        @projects=Project.all
    end
    def show
        @project=Project.find(params[:id])
        @company=Project.find(@project.id).company
    end
end
