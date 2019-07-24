Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skills, :managers, :candidates, :positions, :interviews, :scorecards
  root 'dashboard#index'
end
