Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :expenses, :departments, :expense_classes
  resources :projects, shallow: true do
    resources :expense_classes
    resources :expense_masters
  end
  get '/projects/:id/sheet', to:  'projects#sheet', as: 'project_sheet'
end
