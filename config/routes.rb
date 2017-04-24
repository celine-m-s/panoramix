Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/movies' do
    get '/', to: 'movies#index'
    get '/:id', to: 'movies#show'
  end
end
