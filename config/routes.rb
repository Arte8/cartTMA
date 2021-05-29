Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'carts/show'
  get 'products/index'
  get 'products/new'
  get 'products/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
