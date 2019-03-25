Rails.application.routes.draw do
  devise_for :admins
  root to: redirect('/admin')
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
