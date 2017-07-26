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
    
    if gender=="Male"
    no=1;
    elsif gender=="Female"
    no=2;
    elsif gender=="Others"
    no=3;
    end	
    # byebug;
    @result = HTTParty.post("http://127.0.0.1:8000/user/register",
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
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })

        puts @result

        if @result["error"]==false
        return redirect_to '/';
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

    @result = HTTParty.post("http://127.0.0.1:8000/user/login",
         :body => {
         	:email => email,         	
         	:password => password,
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result

        byebug;
        if @result["error"]==false
        session[:user_id]=@result["session_id"]
        return redirect_to '/';
        else
        return redirect_to '/vlogin'
        end
end

def logout
@result = HTTParty.post("http://127.0.0.1:8000/user/logout",
         :body => {
         	:session_id=>session[:user_id]
         	}.to_json,
            :headers => { 'Content-Type' => 'application/json' })
        
        puts @result
        if @result["error"]==false
        return redirect_to '/';
        
        end
	return redirect_to '/'end


end