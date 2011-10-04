TimeTracker::Application.routes.draw do
  get "tasks/index"

  devise_for :users
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end

  resources :tasks, :projects

  root :to => 'tasks#index'
end
