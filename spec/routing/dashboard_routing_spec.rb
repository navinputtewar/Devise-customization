require "rails_helper"

RSpec.describe DashboardController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dashboard/index").to route_to("dashboard#index")
    end

    it "routes to #new" do
      expect(:get => "/dashboard/new").to route_to("dashboard#new")
    end

    it "routes to #show" do
      expect(:get => "/dashboard/show").to route_to("dashboard#show")
    end

    it "routes to #admin_show" do
      expect(:get => "/dashboard/admin_show").to route_to("dashboard#admin_show")
    end

    it "routes to #listing" do
      expect(:get => "/dashboard/listing").to route_to("dashboard#listing")
    end

    it "routes to #create" do
      expect(:post => "/dashboard/create").to route_to("dashboard#create")
    end


    it "routes to #delete" do
      expect(:delete => "/dashboard/delete/1").to route_to("dashboard#delete", :id => "1")
    end

    it "routes to #blocked" do
      expect(:get => "/dashboard/blocked/1").to route_to("dashboard#blocked", :id => "1")
    end

    it "routes to #about" do
      expect(:get => "/dashboard/about").to route_to("dashboard#about")
    end

  end
end

