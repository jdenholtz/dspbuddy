Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  resources :datasets do
    resources :datas, only: [:create, :show]
  end

  resources :datasets do
    resources :datafiles, only: [:create]
  end
end
