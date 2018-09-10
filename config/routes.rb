Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'order' => 'user#order'
  get 'job' => 'driver#job'

  get 'user/index', as: :user_home
  get 'driver/index', as: :driver_home

  get 'user/profile'
  get 'driver/profile'

  post 'order/orderDriver' => 'user#orderDriver'
  get 'order/cancelOrder' => 'user#cancelOrder'
  get 'order/checkOrderUser' => 'order#checkOrderUser'
  get 'order/checkOrderDriver' => 'order#checkOrderDriver'
  get 'order/startWorking' => 'order#startWorking'
  get 'order/finishWorking' => 'order#finishWorking'

  post 'job/getCustomer' => 'driver#getCustomer'
  post 'job/createOrder' => 'order#createOrder'

  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "users/sessions", registrations:"users/registrations"}
  devise_for :drivers, path: 'driver', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "drivers/sessions", registrations:"drivers/registrations"}
  root to: 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
