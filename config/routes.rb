TimeTracker::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  resources :authentications

  get "reports/index"

  get "tasks/index"

  devise_for :users
  
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "sign_up", :to => "devise/registrations#new"
  end

  resources :projects
  resources :tasks do
    collection do
      get :task_name_list
      get :details
    end
  end

  root :to => 'tasks#index'
end
