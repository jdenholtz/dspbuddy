Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'datasets#index'

  resources :datasets do
    resources :datas, only: [:create, :show]
  end
end
