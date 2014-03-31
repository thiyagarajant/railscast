class LoginsController < ApplicationController
  skip_before_filter :check_session

  def new 
    render 'new' and return unless auth_hash
    omniauth =auth_hash
    session[:fb_token] = omniauth['credentials']['token'] if omniauth['provider'] == 'facebook'
    record = Login.find_or_create_from_hash(auth_hash)
    if record.user_id
      session[:user_id] = record.user_id
      if current_user.role_name == "user"
        redirect_to "/episodes"
      else
        redirect_to users_url
      end
    else
      session[:auth_id] = record.id
      session[:provider] = auth_hash[:provider]
      @user = User.new(:email => record.email)

      flash.now[:error] = "Your account is not linked with facebook"
      render "new"
    end
  end

  def create
    @user = User.authenticate(params[:email], params[:password])

    unless @user
      flash.now[:alert] = "invalid email or password"
      render 'new'
    else
      session[:user_id] = @user.id
      if session[:auth_id]
        rec = Login.find(session[:auth_id])
        rec.associate_user(@user.id)
        flash[:notice] = "your account is successfully linked with fb"
        session[:auth_id] = nil
        session[:provider] = nil
      end
      if @user.role_name == "user"
        redirect_to "/episodes"
      else
        redirect_to "/users"
      end
    end
  end

  def destroy
    session[:user_id] = nil
    session[:fb_token]= nil
    redirect_to "/episodes", :notice => "you are successfully logged out"
  end      

  def auth_hash
    request.env['omniauth.auth']
  end

  def failure
    flash.now.alert "unable to connect!!!"
    render "new"
  end
end
