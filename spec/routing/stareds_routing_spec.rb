require "spec_helper"

describe StaredsController do
  describe "routing" do

    it "routes to #index" do
      get("/stareds").should route_to("stareds#index")
    end

    it "routes to #new" do
      get("/stareds/new").should route_to("stareds#new")
    end

    it "routes to #show" do
      get("/stareds/1").should route_to("stareds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stareds/1/edit").should route_to("stareds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stareds").should route_to("stareds#create")
    end

    it "routes to #update" do
      put("/stareds/1").should route_to("stareds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stareds/1").should route_to("stareds#destroy", :id => "1")
    end

  end
end
