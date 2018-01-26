Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #Route the page to the action "hello"
  #root "application#hello"
  
  #Route the default route to "Pages Controller > Home Action"
  root "pages#home"
  
  #Get/grab the route '/about' and send it to the "pages#about"(pages controller-about action)
  get '/about', to: "pages#about"
  
  #Get/grab the route '/help' and send it to the "pages#help"(pages controller-help action)
  get '/help', to: "pages#help"
  
  #To get all of the CRUD Routes(Check in Rake Routes) for this resource - 'todo'
  resources :todos
  
end
