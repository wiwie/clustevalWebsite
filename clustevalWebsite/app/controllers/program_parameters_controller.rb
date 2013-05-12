class ProgramParametersController < ApplicationController
	before_filter :require_user

	def show
		@programParameter = ProgramParameter.find_by_id(params[:id])
		@programConfig = @programParameter.program_config
		
		respond_to do |format|
			format.html # index.html.erb
			format.json { render :json => @programParameter }
		end
	end
end
