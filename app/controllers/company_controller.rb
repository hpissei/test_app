class CompanyController < ApplicationController
    
    
    
    def index
        @company=Company.all
    end
    def show
        @show=Company.find(params[:id]) 
    end  
    def edit
        @company=Company.all
    end  
end
