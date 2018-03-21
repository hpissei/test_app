Rails.application.routes.draw do
  devise_for :users
  resources :articles

  root "welcome#index"
  get 'welcome/index'
  get 'projects/new','projects#new'
  get 'works/new'=>'works#new'
  get 'users/new'=>'users#new',as: :user_new
  get 'companies/new'=>'companies#new'
  # get 'companies/edit/:id'=>'companies#edit'
  resources:companies, except: :destroy
  delete 'companies/:id' => 'companies#destroy',as: :company_delete
 #, except: :destroy

  
  resources:projects
  resources:works,except: :destroy
  delete 'works/:id'=>'works#destroy',as: :work_delete
  resources:users
  delete 'users/:user'=>'users#destroy',as: :user_delete
  delete 'projects/:id'=>'project#destroy',as: :project_delete
  get 'users/:id'=>'users#new',as: :new_user
  #delete 'works/:id'=>'works#destroy',as: :work_delete
  get 'welcome/home',to:'welcome#home'
  #slug route 
  get 'companyname/:name',to:"companies#show"
  #delete path for project


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
