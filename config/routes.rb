Rails.application.routes.draw do
  get 'members/index'

  get 'members/create'

  get 'members/new'

  get 'families/index'

  resources :members, only: [:index, :create, :new]

  resources :families, only: [:index] do
    collection do
      get :generate_families
    end
  end
end
