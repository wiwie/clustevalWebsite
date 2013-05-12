class ApplicationController < ActionController::Base
  before_filter :authenticate
  before_filter :check_init
  before_filter :init_repository
  protect_from_forgery

  helper_method :current_user_session, :current_user

  private
    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      logger.debug "ApplicationController::current_user"
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.url
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

  protected

  def authenticate
    #authenticate_or_request_with_http_basic do |username, password|
    #  username == "clusteval" &&  password == "rockthahouse$"
    #end
    return true
  end

  def init_repository
    if not session[:repository_id]
      session[:repository_id] = Repository.all.first.basePath
    end
    return true
  end

  def check_init
    if Repository.count == 0
      render :inline => '<div align="center"><h1>Error: clusteval database not initialized</h1>The framework has not been initialized and no repository could be found in the database.<br />Please initialize the framework by starting the backend server.<br /><br />For more detailed information please consult the clusteval technical documentation.</div>'
    end
  end
end
