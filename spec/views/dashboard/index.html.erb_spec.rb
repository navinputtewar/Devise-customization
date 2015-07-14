require 'rails_helper'

RSpec.describe "employees/index", type: :view do
  before(:each) do
    assign(:employees, [
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :salary => 1.5,
        :designation => "Designation"
      ),
      Employee.create!(
        :name => "Name",
        :email => "Email",
        :salary => 1.5,
        :designation => "Designation"
      )
    ])
  end

  it "renders a list of employees" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Designation".to_s, :count => 2
  end
end
