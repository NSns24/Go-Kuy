Rails.application.routes.draw do
  
  

  get 'order' => 'user#order'
  get 'job' => 'driver#job'

  get 'user/index', as: :user_home
  get 'driver/index', as: :driver_home
  get 'admin/index', as: :admin_home
  get 'admin/user'
  get 'admin/driver'
  get 'admin/order'

  get 'user/profile'
  get 'driver/profile'

  post 'order/orderDriver' => 'user#orderDriver'

  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "users/sessions", registrations:"users/registrations"}
  devise_for :drivers, path: 'driver', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "drivers/sessions", registrations:"drivers/registrations"}
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "admins/sessions", registrations:"admins/registrations"}
  
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
