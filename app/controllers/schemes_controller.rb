require 'httparty'
require 'json'

class SchemesController < ApplicationController
  

  def scheme
         result = HTTParty.get("http://127.0.0.1:8000/scheme/scheme_get")
         #puts result
         #puts result["schemes"]
         result=result["result"]
         #puts result
         @res=result["schemes"]
         #puts @res

  end
  
  def scheme_register
  end

end
