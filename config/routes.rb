Rails.application.routes.draw do
  resources :tarefas
  root "tarefas#index"
end
