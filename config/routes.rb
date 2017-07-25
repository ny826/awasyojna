Rails.application.routes.draw do

get '/'=>'login#index'

get '/vregistration'=>'login#vregistration'

post '/registration'=>'login#registration'

get '/vlogin'=>'login#vlogin'
end
