Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get "/test_limit" => "sessions#test_limit"

  resources :vote_results do
  end
end
