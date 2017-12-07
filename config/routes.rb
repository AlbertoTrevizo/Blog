Rails.application.routes.draw do

  devise_for :users
  resources :articles do
    resources :comments, only: [:create, :destroy, :update]
  end
  # get "/articles" index
  # post "/articles" ceate
  # delete "/articles/:id" destroy
  # get "/articles/:id" show
  # get "/articles/new" new
  # get "/articles:id/edit" edit
  # patch "/articles/:id" update
  # put "/articles/:id" update

  root 'welcome#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
