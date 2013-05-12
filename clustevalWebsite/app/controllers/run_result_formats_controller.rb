class RunResultFormatsController < ApplicationController
	before_filter :require_user
	def index
		@runResultFormats = RunResultFormat.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runResultFormats }
		end
	end
	
	def show
		@runResultFormat = RunResultFormat.find_by_id(params[:id])
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @runResultFormat }
		end
	end
end
