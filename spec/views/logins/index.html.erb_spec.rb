require 'spec_helper'

describe "logins/index" do
  before(:each) do
    assign(:logins, [
      stub_model(Login,
        :email => "Email",
        :user_id => 1,
        :uid => "Uid",
        :provider => "Provider"
      ),
      stub_model(Login,
        :email => "Email",
        :user_id => 1,
        :uid => "Uid",
        :provider => "Provider"
      )
    ])
  end

  it "renders a list of logins" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Uid".to_s, :count => 2
    assert_select "tr>td", :text => "Provider".to_s, :count => 2
  end
end
