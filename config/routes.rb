Rails.application.routes.draw do
  get 'api/pipl'
  get 'api/fullcontact'
  post 'api/fullcontact'
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
