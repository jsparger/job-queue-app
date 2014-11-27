Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :jobs
  resources :job_queue, :controller => :job_queue do
    collection do
      get 'pop'
    end
  end
  resources :home, :only => :index, :controller => :home
end
