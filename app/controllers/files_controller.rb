require 'httmultiparty'
require 'json'
require "base64"
#
class FilesController < ApplicationController

def index
end

def file_upload

    aadhar=params["aadhar"]
    puts "aadhar is #{aadhar}"
	# puts aadhar.read;

    data = ActiveSupport::Base64.encode64(File.read("aadhar")).gsub("\n", '')
    puts data;
    
	byebug;
	# encoded_string = Base64.encode64(File.open("aadhar", "rb").read)

    #  @result = HTTMultiParty.post("http://127.0.0.1:8000/documents/upload",
    #      :body => {
    #      	:document => File.new(aadhar),
    #      	:document_type=>"1",
    #      	:uid=>session[:uid],
    #      	:mime_type=>"image/png",
    #      	}.to_json,
    #         :headers => { 'Content-Type' => 'application/json' })
		 #
    #     puts @result

end


end
