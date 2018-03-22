Rails.application.routes.draw do

  resources :articles
 ################################## root route ############################################
  root "welcome#index"
  get 'welcome/index'
 


 
######################################company routes ######################################
  resources:companies, except: :destroy
  get 'companies/new'=>'companies#new'
  # get 'companies/edit/:id'=>'companies#edit'
 delete 'companies/:id' => 'companies#destroy',as: :company_delete
 #, except: :destroy

######################################project routes ######################################
  resources:projects
  delete 'projects/:id'=>'project#destroy',as: :project_delete
  get 'projects/new','projects#new'

######################################work routes ######################################
  resources:works,except: :destroy
  get 'works/new'=>'works#new'
  delete 'works/:id'=>'works#destroy',as: :work_delete
  #slug route 
  get 'companyname/:name',to:"companies#show"

###################################### user routes   #######################################
  devise_for :users
  resources:users 
  delete 'users/:user'=>'users#destroy',as: :user_delete 
  #get 'users/new'=>'users#new',as: :user_new
  get 'usernew/create'=>'users#new',as: :user_new_create


  #delete 'works/:id'=>'works#destroy',as: :work_delete
  get 'welcome/home',to:'welcome#home'
 
  #delete path for project


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
