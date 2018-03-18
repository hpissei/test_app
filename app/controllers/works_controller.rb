class WorksController < ApplicationController
    def index
        @works=Work.all
    end
    def new
        @work=Work.new
    end
    def create 
        @work=Work.new(params[:work].permit(:project_id,:user_id,:date_performed))
       if @work.save
         flash[:notice]="Work created"
         redirect_to @work
        else
            render 'new'
        end
    end
    def show
        @work=Work.find(params[:id])
    end
    #edit
    def edit
        @work=Work.find(params[:id])
    end
    def update
        @work=Work.find(params[:id])
        if @work.update(params[:work].permit(:project_id,:user_id,:date_performed))
            flash[:notice]="Work Updated"
            redirect_to @work
        else
            render 'new'
        end
    end
end
