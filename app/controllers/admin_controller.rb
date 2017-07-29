class AdminController < ApplicationController

  layout "admin"


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

    @result = HTTParty.post("http://127.0.0.1:8000/employee/login",
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
        return redirect_to '/admin/index';
        else
        return redirect_to '/avlogin'
        end


  end



  def aregisteration
  	user=params[:user]
	email=user["address"]
	password=params[:password]
	name=params[:name]

    @result = HTTParty.post("http://127.0.0.1:8000/employee/create",
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
        return redirect_to '/avlogin';
        else
        return redirect_to '/avregisteration'
        end
       # byebug;
  end



 def Alluser
 	 response = HTTParty.get("http://127.0.0.1:8000/user/info"
         )
 puts response
 res=response["result"]
 @user=res["user"]
 puts @user
 #byebug;
 end


 def seenotice
 	response = HTTParty.get("http://127.0.0.1:8000/notifications/notifications"
         )
 puts response
 byebug;
 end


 def Addnotice
 end

 
 def seeflat
 end


 
 def Addflat
 end

 

 def seescheme
 	  result = HTTParty.get("http://127.0.0.1:8000/scheme/scheme_get?admin=1")
         #puts result
         #puts result["schemes"]
         result=result["result"]
         #puts result
         @res=result["schemes"]
         puts @res
        #byebug;
 end

 
 
 def Addscheme
 end



end
