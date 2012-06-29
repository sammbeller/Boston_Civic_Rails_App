require "spec_helper"

describe LoggingsController do
  describe "routing" do

    it "routes to #index" do
      get("/loggings").should route_to("loggings#index")
    end

    it "routes to #new" do
      get("/loggings/new").should route_to("loggings#new")
    end

    it "routes to #show" do
      get("/loggings/1").should route_to("loggings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loggings/1/edit").should route_to("loggings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loggings").should route_to("loggings#create")
    end

    it "routes to #update" do
      put("/loggings/1").should route_to("loggings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loggings/1").should route_to("loggings#destroy", :id => "1")
    end

  end
end
