Rails.application.routes.draw do
  resources :jobs
  resources :job_queues, :path => "job_queue" do
    collection do
      get 'pop'
    end
  end
end
