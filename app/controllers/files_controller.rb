require 'httmultiparty'
require 'json'
require "base64"

class FilesController < ApplicationController


def index
end

def file_upload

    aadhar=params["doc_string"]
    format=params["format"]

    pan=params["doc_string_pan"]
    format_pan=params["format_pan"]

    photo=params["doc_string_photo"]
    format_photo=params["format_photo"]


    puts "aadhar is #{aadhar}"
    format = format.split(".")[1]
    puts "format is #{format}"

    puts "pan is #{pan}"
    format_pan = format_pan.split(".")[1]
    puts "format_pan is #{format_pan}"

    puts "photo is #{photo}"
    format_photo = format_photo.split(".")[1]
    puts "format_photo is #{format_photo}"
    
    


     @result = HTTMultiParty.post("http://13.126.53.179:8000/documents/upload",
         :body => [
                    {
         	          :document => aadhar,
         	          :document_type=>1,
         	          :user=>session[:uid],
         	          :mime_type=>"image/format",
                    },

                    {
                      :document => pan,
                      :document_type=>2,
                      :user=>session[:uid],
                      :mime_type=>"image/#{format_pan}",
                    },

                    {
                      :document => photo,
                      :document_type=>3,
                      :user=>session[:uid],
                      :mime_type=>"image/#{format_photo}",
                    },


         	       ].to_json,
            :headers => { 'Content-Type' => 'application/json' })
	
    if(@result["error"]==false)
    puts @result["error"]
    return redirect_to '/'
    else
    puts @result["error"]
    return redirect_to '/index'
    end 


end


end
