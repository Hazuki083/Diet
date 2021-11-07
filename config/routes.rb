Rails.application.routes.draw do

  devise_for :users,  controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
}

  # devise_scope :user do
  #   get 'users/new' => 'users/registrations#new'
  # end
  root 'homes#top'
  resources :blogs
  resources :plans, only: [:index, :show, :new, :create, :destroy, :edit, :update]
  resources :users, only: [:edit, :update]
    # get "users/edit/:id", to: "users#edit"
    # patch "users/edit/:id", to: "users#edit"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
