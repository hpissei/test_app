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
end
