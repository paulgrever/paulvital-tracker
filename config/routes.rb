Rails.application.routes.draw do
  root "boards#index"
  resources :boards, except: [:destroy, :edit, :update]
  resources :tickets
end
