class SubmitsController < ApplicationController
	def index
		flash[:notice] = '<h3>Contributing to clusteval</h3>If you want to submit a dataset or a clustering method to 
		clusteval, you can contact us using the formulas in this section. After you filled out details about the dataset or clustering method you want to apply, 
		we will send you further information to your given email address on how to submit your content to the framework.'
	end

	def submit_method
	end
end
