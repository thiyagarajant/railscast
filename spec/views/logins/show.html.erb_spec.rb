require 'spec_helper'

describe "logins/show" do
  before(:each) do
    @login = assign(:login, stub_model(Login,
      :email => "Email",
      :user_id => 1,
      :uid => "Uid",
      :provider => "Provider"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    rendered.should match(/1/)
    rendered.should match(/Uid/)
    rendered.should match(/Provider/)
  end
end
