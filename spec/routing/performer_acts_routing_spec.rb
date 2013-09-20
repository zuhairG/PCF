require "spec_helper"

describe PerformerActsController do
  describe "routing" do

    it "routes to #index" do
      get("/performer_acts").should route_to("performer_acts#index")
    end

    it "routes to #new" do
      get("/performer_acts/new").should route_to("performer_acts#new")
    end

    it "routes to #show" do
      get("/performer_acts/1").should route_to("performer_acts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/performer_acts/1/edit").should route_to("performer_acts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/performer_acts").should route_to("performer_acts#create")
    end

    it "routes to #update" do
      put("/performer_acts/1").should route_to("performer_acts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/performer_acts/1").should route_to("performer_acts#destroy", :id => "1")
    end

  end
end
