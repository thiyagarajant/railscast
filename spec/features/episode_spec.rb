require "spec_helper"

feature "Episode management"  do

  def create_user
    user = FactoryGirl.create(:user)
  end
  def create_episode(count)
    count.times do |n|      
      episode = FactoryGirl.create(:episode)
    end
    Episode.all.collect{|x|x}
  end

  background do
    @user  = create_user
    visit '/login'
    fill_in 'email',    :with => @user.email
    fill_in 'password', :with => 'password'
    click_button 'Sign In'
  end

  scenario "List all episodes", :js => true do
    @episodes = create_episode(2)
    visit "/episodes"
    within ("body") do
      page.should have_content("episodes")
      page.should have_content(@episodes[0].imei)
      page.should have_content(@episodes[1].imei)
    end
  end

  # scenario "User can update his/her own profile", :js => true do    
  #   within ('body') do
  #     page.should have_content("Myprofile")
  #     find_link('Myprofile').click
  #     find_link('myprofile').click

  #     fill_in 'user_name', :with => "Thiyagu"

  #     click_button 'Update'
  #     page.should have_content('Your profile updated successfully')
  #   end
  # end
end