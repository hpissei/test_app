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
            redirect_to @user
        else
            render 'new'
        end
    end
    def show
        @user=User.find(params[:id])
    end
end
