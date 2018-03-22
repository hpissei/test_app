class CompaniesController < ApplicationController

    def index
        @company=Company.all
    end
    #new form
    def new
        @company=Company.new
    end
    def create 
        @company=Company.new(params[:company].permit(:name))
        
        if @company.save
         flash[:notice]="Company Created"
            #file upload code
        if params[:company][:doc]
        uploaded_io=params[:company][:doc]
                File.open(Rails.root.join('public','uploads',uploaded_io.original_filename),'wb') do |file|
                        file.write(uploaded_io.read) 
                        @work.doc=uploaded_io.original_filename
                end
        end
         redirect_to @company
        else
            render 'new'
        end
    end
    def show
        if(params[:name])
            @show=Company.find_by name: params[:name]
        elsif(params[:id])
        @show=Company.find(params[:id])
        end 
    end  
    
    def edit
        @company=Company.find(params[:id]) 
    end
    def update
        @company=Company.find(params[:id])
        if @company.update(params[:company].permit(:name))
            flash[:notice]='company updated'
            redirect_to @company
            else
                render 'edit'
        end
    end  
    #destroy method
    def destroy
        @company=Company.find(params[:id])
        if(@company.destroy)
            flash[:notice]="Company deleted"
            redirect_to companies_url
        else
            flash[:notice]="Unable to delete company!!!"
        end 
    end
end
