Rails.application.routes.draw do

  get 'admin/index'

  get 'schemes/scheme'

  get '/home/hometab' => 'home#hometab'

  get '/home/ray' =>  'home#ray'

  get '/home/smartcity' => 'home#smartcity'

  get '/home/location' => 'home#location'


  get '/schemes/scheme' => 'schemes#scheme'

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

post '/scheme_register'=>'schemes#scheme_register'

get '/notification'=>'schemes#notification'

get '/avlogin'=>'admin#avlogin'

get '/avregisteration'=>'admin#avregisteration'

post '/alogin'=>'admin#alogin'

post '/aregisteration'=>'admin#aregisteration'
end
