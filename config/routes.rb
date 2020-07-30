Iteasykit::Engine.routes.draw do

  #filter :pagination, :uuid
  filter :locale
  mount Ckeditor::Engine => '/ckeditor'
  resources :forms
  root :to => 'entities#index'
  resources :taxonomies
  resources :entities
  devise_for :users, class_name: "Iteasykit::User", module: :devise, :controllers => { :registrations => :registrations }
  namespace :admin do
    resources :taxonomies
    resources :fcis
    resources :entities
    resources :seomores
    resources :forms
    resources :cells
    resources :menus
    resources :menu_items do
      post :sort, on: :collection
    end
    resources :blocks do
      post :sort, on: :collection
    end
    resources :entity_types

  end
  resources :fci_images
  get 'admin/dashboard' => 'admin/page#dashboard', as: 'admin_dashboard'
  get 'admin/help' => 'admin/page#help', as: 'admin_help'
  get 'admin/entity_types/:id/fields' => 'admin/entity_types#fields', as: 'admin_entity_type_fields'
  get 'admin/entity/:id/custom_fields' => 'admin/entities#custom_fields', as: 'admin_entity_custom_fields'
  get 'admin/blocks/:id/custom_fields' => 'admin/blocks#custom_fields', as: 'admin_block_custom_fields'
  get 'admin/taxonomy/:id/custom_fields' => 'admin/taxonomies#custom_fields', as: 'admin_taxonomy_custom_fields'
  get 'admin/fcis/:id/destroy_fields' => 'admin/fcis#destroy_fields', as: 'admin_fci_destroy_fields'


  Iteasykit::DynamicRouter.load
  

end
