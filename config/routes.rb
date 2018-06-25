Rails.application.routes.draw do
  root 'static_pages#home'
  get '/help', to: 'static_pages#help'
  resources :expenses, :departments, :expense_classes, :contract_expenses
  resources :projects, shallow: true do
    resources :expense_classes
    resources :expense_masters
    resources :contract_expenses
    resources :expenses
  end
  get '/projects/:id/sheet', to:  'projects#sheet', as: 'project_sheet'
  get '/projects/:project_id/contract_expenses/create_expense', to: 'contract_expenses#create_expense' , as: 'project_contract_expenses_create_expense' 
  get '/projects/:project_id/expenses/bill_index', to: 'expenses#bill_index' , as: 'project_expenses_bill_index' 
  get '/projects/:project_id/expenses/record_index', to: 'expenses#record_index' , as: 'project_expenses_record_index' 
end
