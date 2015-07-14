Rails.application.routes.draw do
   devise_for :users, controllers: { 
                                    sessions: "users/sessions",
                                    registrations: "users/registrations",
                                    passwords: "users/passwords",
                                    confirmations: "users/confirmations"
                                  }
  
  root 'dashboard#index'

  get 'dashboard/index'
 
  get 'dashboard/new'

  get 'dashboard/listing'

  post 'dashboard/create'

  get 'dashboard/show', to: 'dashboard#show', as: 'dashboard_show'

  get 'dashboard/admin_show'

  delete 'dashboard/delete/:id', to: 'dashboard#delete' , as: 'dashboard_delete'

  get 'dashboard/blocked/:id', to: 'dashboard#blocked' , as: 'dashboard_blocked'

  get 'dashboard/about', to: 'dashboard#about' , as: 'dashboard_about'

  # match '*404' => redirect{ |p, req| req.flash[:error] = "Sorry , you have entered wrong url #{p[:a]}"; '/' }, via: :all
  # match '*406' => redirect{ |p, req| req.flash[:error] = "Sorry , you have entered UnknownFormat #{p[:a]}"; '/' }, via: :all
  # match '*500' => redirect{ |p, req| req.flash[:error] = "Sorry , you have entered Wrong HTTP version,Not Supported! #{p[:a]}"; '/' }, via: :all
end
