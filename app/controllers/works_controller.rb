class WorksController < ApplicationController
    def index
        @works=Work.all.paginate(page: params[:page],per_page: 5)
    end
    def new
        @work=Work.new
    end
    def create 
        @work=Work.new(params[:work].permit(:project_id,:user_id,:date_performed))
         if(params[:work][:doc])
             uploaded_io=params[:work][:doc]
                File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
                        file.write(uploaded_io.read) 
                        @work.doc=uploaded_io.original_filename
                  end
        end
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
    #email method
    #def workcreated_email(work)
     #   @work=work
     #   @work=mail(to:work.project.user.email,subject:"Work Item Posted")
    #end
        
    def destroy
        @work=Work.find(params[:id])
        if(@work.destroy)
            flash[:notice]="Work Item is deleted"
            redirect_to works_url
        else
            flash[:notice]="Work Item is not deleted"
        end
    end    
end
