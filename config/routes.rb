Rails.application.routes.draw do
  get 'welcome/index' 
  #get 'welcome/index/payment' => 'welcome#index', as: 'wel'
  #get 'welcome/index/:id/payment' => "articles#edit"
  
 resources :articles do
 	resources :comments
 	resources :my_topics

 end
 resources :tags

 post "articles/:id/tags/add" => "articles#add_tag", as: 'article_tag'
 # 'welcome/index'
  root 'welcome#index'
end



