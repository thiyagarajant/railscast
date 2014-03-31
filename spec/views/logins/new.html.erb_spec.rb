require 'spec_helper'

describe "logins/new" do
  before(:each) do
    assign(:login, stub_model(Login,
      :email => "MyString",
      :user_id => 1,
      :uid => "MyString",
      :provider => "MyString"
    ).as_new_record)
  end

  it "renders new login form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => logins_path, :method => "post" do
      assert_select "input#login_email", :name => "login[email]"
      assert_select "input#login_user_id", :name => "login[user_id]"
      assert_select "input#login_uid", :name => "login[uid]"
      assert_select "input#login_provider", :name => "login[provider]"
    end
  end
end
