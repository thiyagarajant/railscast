require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :name => "MyString",
      :description => "MyText",
      :user_id => 1,
      :episode_id => 1
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => comments_path(@comment), :method => "post" do
      assert_select "input#comment_name", :name => "comment[name]"
      assert_select "textarea#comment_description", :name => "comment[description]"
      assert_select "input#comment_user_id", :name => "comment[user_id]"
      assert_select "input#comment_episode_id", :name => "comment[episode_id]"
    end
  end
end
