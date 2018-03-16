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
end
