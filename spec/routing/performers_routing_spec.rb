require "spec_helper"

describe PerformersController do
  describe "routing" do

    it "routes to #index" do
      get("/performers").should route_to("performers#index")
    end

    it "routes to #new" do
      get("/performers/new").should route_to("performers#new")
    end

    it "routes to #show" do
      get("/performers/1").should route_to("performers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/performers/1/edit").should route_to("performers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/performers").should route_to("performers#create")
    end

    it "routes to #update" do
      put("/performers/1").should route_to("performers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/performers/1").should route_to("performers#destroy", :id => "1")
    end

  end
end
