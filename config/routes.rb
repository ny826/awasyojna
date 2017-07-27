Rails.application.routes.draw do

  get '/home/hometab' => 'home#hometab'

  get '/home/ray' =>  'home#ray'

  get '/home/smartcity' => 'home#smartcity'

  get '/home/location' => 'home#location'

  get '/home/societyreg' => 'home#societyreg'

  get '/home/download' => 'home#download'

  get '/home/tnc' => 'home#tnc'

  get '/home/blog' => 'home#blog'

  get '/home/contact' => 'home#contact'

get '/'=>'login#index'

get '/vregistration'=>'login#vregistration'

post '/registration'=>'login#registration'

post '/login'=>'login#login'
post '/logout'=>'login#logout'

get '/User_profile'=>'login#User_profile'

get '/vlogin'=>'login#vlogin'
end
