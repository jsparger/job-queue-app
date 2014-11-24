Rails.application.routes.draw do
  devise_for :users
  root to: "jobs#index"
  resources :jobs
  resources :job_queues, :path => "job_queue" do
    collection do
      get 'pop'
    end
  end
end
