Lighthouse::Application.routes.draw do

  resources :reminders


devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
 
  resources :workspaces do
    get "membership/index"

    resources :projects do

      resources :tasks do
        collection do
          get 'email_purpuse'
        end
        
      end
    end
  end


  get 'projects/project_dropdown'
  get 'tasks/task_list'

  resource :profile
  resources :searches

  
    root :to => 'projects#index'
    
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    
end
    


  
