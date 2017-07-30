Rails.application.routes.draw do

  get 'admin/index'

  get 'schemes/scheme'

  get '/'=>'home#hometab'

  
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

get '/index'=>'files#index'

###############  Admin Routes


get '/avlogin'=>'admin#avlogin'

get '/avregisteration'=>'admin#avregisteration'

post '/alogin'=>'admin#alogin'

post '/aregisteration'=>'admin#aregisteration'

get '/admin/index'=>'admin#index'

get '/admin/Alluser'=>'admin#Alluser'


get '/admin/seenotice'=>'admin#seenotice'

post '/Addnotice'=>'admin#Addnotice'

get '/admin/seeflat'=>'admin#seeflat'

post '/Addflat'=>'admin#Addflat'

get '/admin/seescheme'=>'admin#seescheme'

 post '/Addscheme'=>'admin#Addscheme'


post '/avlogout'=>'admin#avlogout'

###############



get '/addnoticeform'=>'admin#addnoticeform'

get '/addflatform'=>'admin#addflatform'

get '/addschemeform'=>'admin#addschemeform'

post '/file_upload'=>'files#file_upload'
end
