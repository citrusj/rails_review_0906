Rails.application.routes.draw do
  devise_for :users
  root 'post#index'
  get 'post/index'
  get 'post/new'
  post 'post/create'
  patch '/post/update/:post_id' => 'post#update', as: 'post_update'
  get '/post/:post_id' => 'post#show', as: 'post'
  get '/post/destroy/:post_id' => 'post#destroy'
  get '/post/edit/:post_id' => 'post#edit'
  post '/post/:post_id/comments/create' => 'post#commentcreate', as: 'comment_create'
  get '/post/:post_id/comments/:comment_id/destroy' => 'post#commentdestroy'
  get '/post/comments/:comment_id/edit' => 'post#commentedit'
 patch '/post/comments/:comment_id/update' => 'post#commentupdate', as: 'comment_update'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
