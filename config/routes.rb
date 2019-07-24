Rails.application.routes.draw do
  get 'candidates/index'
  get 'candidates/new'
  get 'managers/index'
  get 'managers/new'
  get 'skills/index'
  get 'skills/new'
  get 'managers/index'
  get 'managers/new'
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skills, :managers, :candidates, :positions, :interviews, :scorecards
  root 'dashboard#index'
end
