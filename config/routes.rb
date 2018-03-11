Rails.application.routes.draw do
  resources :articles
  get 'welcome/index'
  resources:company
  resources:user
  resources:project
  get 'welcome/home',to:'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
