class AdminController < ApplicationController
  def index
  end

  def avlogin

  end

  def avregisteration
  end

  def alogin
  	user=params[:user]
	email=user["address"]
	password=params[:password]

    @result = HTTParty.post("http://127.0.0.1:8000/user/login",
         :body => {
         	:email => email,         	
         	:password => password,
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result

        #byebug;
        if @result["error"]==false
        res=@result["result"]
        session[:user_id]=res["session_id"]
        session[:uid]=res["user_id"]
        return redirect_to '/';
        else
        return redirect_to '/vlogin'
        end


  end

  def aregisteration
  	user=params[:user]
	email=user["address"]
	password=params[:password]
	name=params[:name]

    @result = HTTParty.post("http://127.0.0.1:8000/user/login",
         :body => {
         	:name=>name,
         	:email => email,         	
         	:password => password,
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result

        #byebug;
        if @result["error"]==false
        res=@result["result"]
        session[:user_id]=res["session_id"]
        session[:uid]=res["user_id"]
        return redirect_to '/';
        else
        return redirect_to '/vlogin'
        end

  end


 def Alluser
 end

 def Addnotice
 end

 def Addflat
 end
 

 def Addscheme
 end



end
