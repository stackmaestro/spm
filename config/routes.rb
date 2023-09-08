Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "teams#index"
  resources :teams do
    resources :members
  end
  resources :projects do
    
  end
end


#projects/1/members