Rails.application.routes.draw do
  resources :members, only: [:index, :create, :new, :update]

  resources :families, only: [:index] do
    collection do
      get :generate_families
    end
  end
end
