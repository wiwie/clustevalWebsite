class GoldstandardConfigsController < ApplicationController
	before_filter :require_user

	def index
		@goldstandardConfigs = GoldstandardConfig.all(session)
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @goldstandardConfigs }
		end
	end
	
	def show
		@goldstandardConfig = GoldstandardConfig.find_by_name(params[:id])
		
		@goldstandard = @goldstandardConfig.goldstandard
		
		file = File.open(@goldstandardConfig.absPath)
		@contents = ""
		while tmp = file.gets do
			@contents << tmp
		end

		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @goldstandardConfig }
		end
	end
end
