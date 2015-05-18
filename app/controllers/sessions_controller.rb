class SessionsController < ApplicationController
  def new
  end

  def create
    user = UserSignIn.where(email: params[:session][:email].downcase).first
    if user.present? && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      render :js => "window.location = '/home';"
    else
      # Create an error message.
      puts "nottusbajsvdhgvhgdvhg"
      user = "Not authenticated to login"
      render :js =>"$('#temp1').attr('hidden', false); $('#temp1').html(\"#{user}\");"
    end
  end

  def destroy
    log_out
    render :js => "window.location = '/home'"
  end
end
