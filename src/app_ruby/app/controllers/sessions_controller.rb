# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
#  include AuthenticatedSystem
#protect_from_forgery :only => [:update, :delete, :create]

  # GET /session/new
  # GET /session/new.xml
  # render new.rhtml
  def new
  end
# Once we explain REST in the book this will obviously be
# refactored.
#def create_xml
#  self.current_user =
#    User.authenticate(params[:login], params[:password])
#  if logged_in?
#    if params[:remember_me] == "1"
#      self.current_user.remember_me
#      cookies[:auth_token] = {
#        :value => self.current_user.remember_token,
#        :expires => self.current_user.remember_token_expires_at
#      }
#    end
                                            
#    render :xml => self.current_user.to_xml
#  else
#    render :text => "badlogin"
#  end
#end

  # POST /session
  # POST /session.xml
  def create
    self.current_user =
      User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = {
          :value => self.current_user.remember_token ,
          :expires =>
            self.current_user.remember_token_expires_at }
      end
      respond_to do |format|
        format.html do
          redirect_back_or_default('/')
          flash[:notice] = "Logged in successfully"
        end
        format.xml  { render :xml => self.current_user.to_xml }
      end
    else
      respond_to do |format|
        format.html { render :action => 'new' }
        format.xml { render :text => "badlogin" }
      end
    end
  end

  # DELETE /session
  # DELETE /session.xml
    def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end

