Rails.application.routes.draw do
  get 'managers/index'
  get 'managers/new'
  get 'managers/show'
  get 'managers/edit'
  get 'skills/index'
  get 'skills/new'
  get 'skills/edit'
  get 'managers/index'
  get 'managers/new'
  get 'managers/edit'
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :skills, :managers, :candidates, :positions, :interviews, :scorecards
  root 'dashboard#index'
end
