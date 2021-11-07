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
  resources :plans, only:[:edit, :update]
  resources :users

  get 'plans/new'
  get 'plans/edit'
  get 'blogs/index'
  get 'blogs/new'
  get 'blogs/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
