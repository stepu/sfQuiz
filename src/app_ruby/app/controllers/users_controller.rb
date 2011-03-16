class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
 # include AuthenticatedSystem
  

  # render new.rhtml
  def new
    @user = User.new
  end
 
# Once we explain REST in the book this will obviously be
# refactored.
def create_xml
  @user = User.new(params[:user])
  @user.save!
  self.current_user = @user
  render :xml => @user.to_xml
rescue ActiveRecord::RecordInvalid
  render :text => "error"
end


  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
            # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_user = @user # !! now logged in
      redirect_back_or_default('/login')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
end
