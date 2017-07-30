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

    @result = HTTParty.post("http://13.126.53.179:8000/employee/login",
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
        session[:email]=res["email"]
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

    @result = HTTParty.post("http://13.126.53.179:8000/employee/create",
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
 	 response = HTTParty.get("http://13.126.53.179:8000/user/info"
         )
 puts response
 res=response["result"]
 @user=res["user"]
 puts @user
 #byebug;
 end


 def seenotice
 	response = HTTParty.get("http://13.126.53.179:8000/notifications/notifications"
         )
 puts response
 #byebug;
 end


 def addnoticeform

 end

 def addflatform
 end

 def addschemeform
 end



 def Addnotice
        user=params[:user]
        message=params[:message]
        url=user["homepage"]
        start_date=user["start_date"]
        end_date=user["end_date"]

 	@result = HTTParty.post("http://13.126.53.179:8000/notifications/notifications",
            
         :body => {
         	:message =>message,
	         :url =>url,
	         :end_date =>end_date,
	         :start_date =>start_date,
	        }.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result

        #byebug;
        if @result["error"]==false
        @result["message"]
        else
        @result["message"]
        end
    return redirect_to '/admin/index';

 end

 # def Addflat

 # 	@result = HTTParty.post("http://13.126.53.179:8000/scheme/add_flat",
 #                  :body => {
 #         	:scheme =>"id here",
	#          :flat_type =>"id here",
	#          :carpet_area =>"2017-08-10",
	#          :accomodation =>"2017-07-14",
	#          :estimate_cost=>"2017-08-18",
	#          :application_cost=>"",
	#          :maintenance_deposit=>"",
	#          :no_of_flats=>"",
	#         }.to_json,
 #            :headers => { 'Content-Type' => 'application/json' })
        
 #        puts @result

 # end

 

 def seescheme
 	  result = HTTParty.get("http://13.126.53.179:8000/scheme/scheme_get?admin=1")
         #puts result
         #puts result["schemes"]
         result=result["result"]
         #puts result
         @res=result["schemes"]
         puts @res
        #byebug;
 end

 
 
 def Addscheme
 
        name=params[:name]
        user=params[:user];
        url=user["address"]
        start_date=user["start_date"]
        end_date=user["end_date"]
        draw_date=user["draw_date"]

 	 	@result = HTTParty.post("http://13.126.53.179:8000/scheme/create_scheme",
          :body => {
         	:name =>name,
	         :location =>user,
	         :end_date =>end_date,
	         :start_date =>start_date,
	         :draw_date=>draw_date,
	        }.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result
 end


def verify


end


def avlogout
	session[:user_id]=nil;
	session[:uid]=nil;
	return redirect_to '/admin/index';
end


end
