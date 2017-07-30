require 'httparty'
require 'json'

class LoginController < ApplicationController

def index

end

def vregistration
end

def registration

	name=params[:name];
	user=params[:user]
	email=user["address"]
	password=params[:password]
    phone=params[:phone]
    address=params[:address]
    dob=user["born_on"]
    gender=params[:Gender]
    father=params[:father]
    spouse=params[:spouse]
    pan=params[:pan]
    aadhar=params[:aadhar]
    
    cast=params[:Cast]
    spouse_aadhar=params[:spouse_aadhar]


    if cast=="GENERAL"
    no=1;
    elsif cast=="OBC"
    no=2;
    elsif cast=="SC"
    no=3;
    elsif cast=="ST"
    no=4;
    end	


    # byebug;
    @result = HTTParty.post("http://13.126.53.179:8000/user/register",
         :body => {
         	:birth_date => dob,
         	:phone => phone, 
         	:name => name, 
         	:email => email, 
         	:password => password,
         	:address=>address,
         	:gender=>no,
            :father_name=>father,
            :spouse_name=>spouse,
            :pan_number=>pan,
            :aadhar_no=>aadhar,
            :spouse_aadhar=>spouse_aadhar,
            :caste=>no,
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })

        puts @result

        if @result["error"]==false
        return redirect_to '/vlogin';
        else
        puts "Wrong Entry of inputs "
        return redirect_to '/vregistration'
        end
       
end


def vlogin
end

def login
	user=params[:user]
	email=user["address"]
	password=params[:password]

    @result = HTTParty.post("http://13.126.53.179:8000/user/login",
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
        return redirect_to '/index';
        else
        return redirect_to '/vlogin'
        end
end

def logout
puts "inside logout"
@result = HTTParty.post("http://13.126.53.179:8000/user/logout",
         :body => {

         	:session_id=>session[:user_id]
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        

        puts @result
        if @result["error"]==false
        session[:user_id]=nil;
        session[:uid]=nil;
        return redirect_to '/';
        
        end
	return redirect_to '/'

end


def User_profile
    puts session[:user_id]
 response = HTTParty.get("http://13.126.53.179:8000/user/info?session_id=#{session[:user_id]}"
         )
 puts response
 res=response["result"]
 @user=res["user"]
 puts @user


end

end
