Rails.application.routes.draw do
  # projects
  get '/projects/:id' => 'projects#show'
  # contestants
  get '/contestants' => 'contestants#index'
end
