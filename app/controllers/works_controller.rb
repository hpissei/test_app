class WorksController < ApplicationController
    def index
        @works=Work.all
    end
    def new
        @work=Work.new
    end
    def create 

    end
    def show
        @work=Work.find(params[:id])
    end
end
