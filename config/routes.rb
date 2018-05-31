Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :projects
  resources :expenses
  get '/projects/:id/sheet', to:  'projects#sheet', as: 'project_sheet'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
