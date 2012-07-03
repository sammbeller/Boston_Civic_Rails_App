require 'spec_helper'

describe "Messages" do

	subject { page }

  describe "attempt to visit pages when not signed in" do
    
    describe "home page" do
    	before { visit home_path }

    	it { should have_link("Sign up")  }
    	it { should have_link("Sign in") }
    	it { should have_link("where's my lane") }

    	it { should_not have_link("New update") }
    	it { should_not have_link("Users") }

    end
  end
end
