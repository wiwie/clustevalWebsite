class ApplicationController < ActionController::Base
  before_filter :check_init
  protect_from_forgery

  # add the default repository parameter which is part of every route to the url_options -> we do not need to write it in every link_to method
  def default_url_options(options={})
    { :repository => params[:repository] }
  end

  #def url_options
  #  { :repository => Repository.first.id }.merge(super)
  #end

  def check_init
    if Repository.count == 0
      render :inline => '<div align="center"><h1>Error: clusteval database not initialized</h1>The framework has not been initialized and no repository could be found in the database.<br />Please initialize the framework by starting the backend server.<br /><br />For more detailed information please consult the clusteval technical documentation.</div>'
    end

    begin
      if params[:repository]
        @repo = Repository.find(params[:repository])
        # run result repository
        if @repo.repository_id
          redirect_to '/'
        end
      end
    rescue
      redirect_to '/'
    end
  end
end
