Rails.application.routes.draw do
  get 'interviews/index'
  get 'interviews/new'
  get 'positions/index'
  get 'positions/new'
  get 'candidates/index'
  get 'candidates/new'
  get 'managers/index'
  get 'managers/new'
  get 'skills/index'
  get 'skills/new'
  get 'managers/index'
  get 'managers/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skills, :managers, :candidates, :interviews, :scorecards, :positions

  root 'positions#index'
end
