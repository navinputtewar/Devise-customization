require 'rails_helper'

RSpec.describe "dashboard/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "Name",
        :last_name => "lastname",
        :dob => "dob",
        :profile_picture => File.new(Rails.root + 'public/assets/products/1/images3.jpeg'),
        :username => "username",
        :email => "me@example.com",
        :password => "123456789",
        :password_confirmation => "123456789"
      ),
      User.create!(
        :first_name => "firstName",
        :last_name => "lastname",
        :dob => "dob",
        :profile_picture => File.new(Rails.root + 'public/assets/products/1/images3.jpeg'),
        :username => "username",
        :email => "yo@example.com",
        :password => "123456789",
        :password_confirmation => "123456789"
      )
    ])
  end

  it "renders a list of Users" do
    render
    assert_select "tr>td", :text => "first_name".to_s, :count => 2
    assert_select "tr>td", :text => "last_name".to_s, :count => 2
    assert_select "tr>td", :text => "dob"
    assert_select "tr>td", :text => File.new(Rails.root + 'public/assets/products/1/images3.jpeg')
    assert_select "tr>td", :text => "username".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    
  end
end