class CompaniesController < ApplicationController
    def index
        @company=Company.all
    end
    #new form
    def new
        @company=Company.new
    end
    def create 

    end
    def show
        if(params[:name])
            @show=Company.find_by name: params[:name]
        elsif(params[:id])
        @show=Company.find(params[:id])
        end 
    end  
    
    def edit
        @company=Company.all
    end  
end
