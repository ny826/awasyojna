require 'httparty'
require 'json'

class SchemesController < ApplicationController
  

  def scheme
         result = HTTParty.get("http://13.126.53.179:8000/scheme/scheme_get?admin=1")
         #puts result
         #puts result["schemes"]
         result=result["result"]
         #puts result
         @res=result["schemes"]
         puts @res



  end
  
  def scheme_register

  end

  def notification
      @result = HTTParty.get("http://13.126.53.179:8000/notifications/notifications")
      puts @result

      #byebug;
  end

  def register_scheme
      slug=params[:scheme_name];

         result = HTTParty.get("http://13.126.53.179:8000/scheme/scheme_get?scheme_slug=#{slug}")
         puts result
         puts result["schemes"]
         result=result["result"]
         puts result
         @res=result["schemes"]
         puts @res
 
     # byebug;
  end


  def register_for_scheme
     @flat_id=params[:flat_id]

  end

  def register_for_scheme_with_details

 
  flat_id=params[:flat_id]
  bank_name=params[:bank_name]
  bank_branch_name=params[:bank_branch_name]
  ifsc=params[:ifsc]
  account_no=params[:account_no]
  res=params[:res]

  if res=="yes"
  joint="true";
  else
  joint="false"
  end
  
      @result = HTTParty.post("http://13.126.53.179:8000/registeration/register",
         :body => {
          :user=>session[:uid],
          :flat => flat_id,
          :bank_name => bank_name, 
          :bank_branch_name => bank_branch_name, 
          :ifsc_code => ifsc, 
          :bank_account_no => account_no,
          :joint_application=>joint,
          }.to_json,
            :headers => { 'Content-Type' => 'application/json' })

        @res=@result["result"]
        if @res["error"]==false
        puts @res["message"]
        return redirect_to '/schemes/scheme'
        else
        puts @res["message"]
        return redirect_to '/schemes/scheme'
        end


  end

 
end
