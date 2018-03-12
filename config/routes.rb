Rails.application.routes.draw do
  resources :articles

  root "welcome#index"
  get 'welcome/index'
  resources:company
  resources:user
  resources:project
  resources:work
  get 'welcome/home',to:'welcome#home'
  #slug route 
  get 'companyname/:name',to:"company#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
