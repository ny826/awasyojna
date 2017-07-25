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

    puts "name is #{name}  ,  email is #{email}  ,password is #{password}  ,phone is #{phone}  ,address is #{address}  , dob is #{dob} "
	return redirect_to '/';
	
end


def vlogin
end

def login
	user=params[:user]
	email=user["address"]
	password=params[:password]

	return redirect_to '/'
end



end
