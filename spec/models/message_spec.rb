require 'spec_helper'

describe Message do
  
  before do 
  	@message = Message.new(content: "this is the content")
  end 

  subject {@message}

  it {should respond_to (:content) }
  it {should respond_to (:user) }


	describe "content should be present" do 
  		before {@message.content = " "}
  		it {should_not be_valid}
	end 

	describe "content should not be nill" do 
		before {@message.content = nil}
		it {should_not be_valid}
	end 

	describe "content should have more than 9 characters" do 
		before {@message.content = "a" * 9 }
		it {should_not be_valid}
	end 

	describe "content should have no more than 140 charachters" do 
		before {@message.content = "a" * 141 }
		it {should_not be_valid}
	end 

	#describe "content should belong to user" do
	#	before do
	#		user =  User.new(email: "sambellar@gmail.com", password: "foo", password_confirmation: "foo")
	#		@message.user = user
	#	end 
	#end 

end
