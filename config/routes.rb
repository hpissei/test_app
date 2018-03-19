Rails.application.routes.draw do
  devise_for :users
  resources :articles

  root "welcome#index"
  get 'welcome/index'
  get 'projects/new','projects#new'
  get 'works/new'=>'works#new'
  get 'users/new'=>'users#new'
  get 'companies/new'=>'companies#new'
  # get 'companies/edit/:id'=>'companies#edit'
  resources:companies
  resources:users
  resources:projects
  resources:works
  get 'welcome/home',to:'welcome#home'
  #slug route 
  get 'companyname/:name',to:"companies#show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
