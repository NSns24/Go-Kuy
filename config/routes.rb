Rails.application.routes.draw do
  get 'user/index', as: :user_home
  get 'driver/index', as: :driver_home

  get 'order', :to => 'user#order'
  get 'job', :to => 'driver#job'

  get 'user/profile'
  get 'driver/profile'

  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'form' }, controllers: { sessions: "users/sessions", registrations:"users/registrations"}
  devise_for :drivers, path: 'driver', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'form' }, controllers: { sessions: "drivers/sessions", registrations:"drivers/registrations"}
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
