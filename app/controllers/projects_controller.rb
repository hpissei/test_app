class ProjectsController < ApplicationController
   # before_filter :only_admins_create_update_project,only: [:new,:create,:edit,:update]
    def index
        @projects=Project.all.paginate(:page=>params[:page],:per_page=>5)
        respond_to do |format|
            format.html 
            format.json {render json:@projects }
            format.xml {render xml:@projects}
        end
    end
    #new and create for new
    def new
        @project=Project.new
    end
    def send_mail 
=begin
        mail=Mail.deliver do
             from     'hpultimatemedia@gmail.com'
               to     'heetesh.panghanti@harbingergroup.com'
             subject  'Here is the your first wmail from rails'
             body     'welcome to mailer'#File.read('body.txt')exit
             
             #add_file '/full/path/to/somefile.png'
        end
            mail.to_s
=end
        mail(to:'heetesh.panghanti@harbingergroup.com', subject: 'Welcome to My Awesome Site')
    end
    def create
        @project=Project.new(params[:project].permit(:project_name,:company_id,:default_rate))
        if @project.save
            
            flash[:notice]='Project Created'
        redirect_to @project
        send_mail
        else
            render 'new'
        end
    end
    def show
        @project=Project.find(params[:id])
        @company=Project.find(@project.id).company
    end
    #edit and update for edit form
    def edit
        @project=Project.find(params[:id])
    end
    def update
        @project=Project.find(params[:id])
        if(@project.update(params[:project].permit(:project_name,:company_id,:default_rate)))
            flash[:notice]="Project updated"
            redirect_to @project
        else
            render 'new'
        end
    end
    #destroy
    def destroy
        @project=Project.find(params[:id])
        if(@project.destroy)
            flash[:notice]="Project deleted successfully"
            redirect_to projects_url
        else
            flash[:notice]="Unable to delete Project!!!"
            redirect_to projects_url
        end
    end
 #before admin filter function not working
=begin
    def only_admins_create_update_project
        redirect_to projects_path
        flash[:notice]="Only admins can create /modify the projects"
        unless
            current_user.admin
            end
    end
=end
end
