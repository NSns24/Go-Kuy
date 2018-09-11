Rails.application.routes.draw do

  root to: 'home#index'

  get 'admin/index', as: :admin_home
  get 'admin/user'
  get 'admin/driver'
  get 'admin/order'

  get 'user/index', as: :user_home
  get 'user/profile'
  get 'user/history'

  get 'driver/index', as: :driver_home
  get 'driver/profile'
  get 'driver/history'

  get 'order' => 'user#order'
  get 'job' => 'driver#job'
  
  get 'order/rating/:id' => 'user#rating', as: 'rating'
  post 'order/orderDriver' => 'user#orderDriver'
  post 'order/saveRating' => 'order#saveRating'
  get 'order/cancelOrder' => 'user#cancelOrder'
  get 'order/checkOrderUser' => 'order#checkOrderUser'
  get 'order/checkOrderDriver' => 'order#checkOrderDriver'
  get 'order/startWorking' => 'order#startWorking'
  get 'order/finishWorking' => 'order#finishWorking'

  post 'job/getCustomer' => 'driver#getCustomer'
  post 'job/createOrder' => 'order#createOrder'

  devise_for :users, path: 'user', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "users/sessions", registrations:"users/registrations"}
  devise_for :drivers, path: 'driver', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "drivers/sessions", registrations:"drivers/registrations"}
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: '' }, controllers: { sessions: "admins/sessions", registrations:"admins/registrations"}
  
end
