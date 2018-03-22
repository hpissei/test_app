class UsersController < ApplicationController
    def index
        @users=User.all
    end
    def new
        @user=User.new
    end
    def create

        @user=User.new(params[:user].permit(:first_name,:last_name,:company_id,:project_id,:work_id))
        if @user.save
            flash[:notice]="New User Created"
            redirect_to users_path
        else
            flash[:notice]="Unable to create user"
            render 'new'
        end
    end
    def create_new
         
        @user=User.new(params[:user].permit(:first_name,:last_name,:company_id,:project_id,:work_id))
        if @user.save
            flash[:notice]="New User Created"
            redirect_to users_new_create_path(@user)
        else
            flash[:notice]="Unable to create user"
            render 'new'
        end
    end
    
    def show
        @user=User.find(params[:id])
    end
    #edit 
    def edit
        @user=User.find(params[:id])
    end
    def update
        @user=User.find(params[:id])
        
        if (@user.update(params[:user].permit(:first_name,:last_name,:company_id)))
            flash[:notice]="User Updated"
            redirect_to @user
        else
            render 'new'
        end
    end
    def signin

    end     
    def destroy
        @user=User.find(params[:id])
        if(@user.destroy)
            flash[:notice]="User deleted successfully"
            redirect_to users_url
        else
            flash[:notice]="Unable to delete the user"
        end  
    end
end
