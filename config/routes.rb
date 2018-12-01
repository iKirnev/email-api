Rails.application.routes.draw do
  get 'api/pipl'
  get 'api/fullcontact'
  post 'api/fullcontact'
  root 'api#pipl'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
