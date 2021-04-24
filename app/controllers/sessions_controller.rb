class SessionsController < ApplicationController
  def new
  end

  def create
     user = User.find_by(email: params[:session][:email].downcase)
     if user &.authenticate(params[:session][:password])
      reset_session 
      log_in user
      redirect_to user
      # Log the user in and redirect to the user's show page.
     else
        flash.now[:denger] = 'Invalid Email/Password combination '
      # Create an error message.
      render 'new'
     end
  end
  def destroy
    def destroy 
      log_out
      redirect_to root_url
     
    end
end
