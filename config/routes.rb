Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'questions#index'
  resources :questions
  post 'questions/new' => 'questions#new'
  post 'questions/#id/edit' => 'questions#edit'
  post 'questions/:id/edit' => 'questions#edit'
  get '/quiz' => 'questions#quiz'
  post '/quiz' => 'questions#quiz'
end
