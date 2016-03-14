Rails.application.routes.draw do
  root "snapshots#new"
  resources :snapshots, :except => [:show, :index, :edit]
end
