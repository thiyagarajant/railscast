require 'spec_helper'

describe "feedbacks/edit" do
  before(:each) do
    @feedback = assign(:feedback, stub_model(Feedback,
      :name => "MyString",
      :email => "MyString",
      :message => "MyText"
    ))
  end

  it "renders the edit feedback form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feedbacks_path(@feedback), :method => "post" do
      assert_select "input#feedback_name", :name => "feedback[name]"
      assert_select "input#feedback_email", :name => "feedback[email]"
      assert_select "textarea#feedback_message", :name => "feedback[message]"
    end
  end
end
